package kr.gudi.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

public class HttpUtil {
   public static ModelAndView makeHashToJsonModelAndView(final HashMap<String, Object> map) {
      JSONObject jsonObject = new JSONObject();
      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(map));

      ModelAndView mnv = new ModelAndView();
      mnv.setViewName("json");
      mnv.addObject("message", jsonObject.toString());
      return mnv;
   }

   public static void sendResponceToJson(HttpServletResponse response, final HashMap<String, Object> map) { // 화면을 찾지 않고 바로 write하는 방법
      response.setContentType("application/json; charset=utf-8");
      JSONObject jsonObject = new JSONObject();
      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(map));
      try {
         response.getWriter().write(jsonObject.toString()); // 따로 jsp를 안만들고 write함 java파일에서 바로 실행 가능하다는 얘기
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

   public static HashMap<String, Object> getParameterMap(HttpServletRequest request) { // parameter값이 있을경우 set을 써서 전환시킴
      HashMap<String, Object> parameterMap = new HashMap<String, Object>();
      Enumeration<?> enums = request.getParameterNames(); // request로 ParameterNames()을 받아와서 enums에 저장
      while (enums.hasMoreElements()) { // 요청한 갯수만큼 루프가 돔
         String paramName = (String) enums.nextElement(); // 키
         String[] parameters = request.getParameterValues(paramName); // 밸류
         // Parameter 확인
         if (parameters.length > 1) { // parameters에 값이 있으면 실행하고 없으면 안함
            parameterMap.put(paramName, parameters); // 키와 밸류를 put으로 parameterMap에 담아줌
            // Parameter 담기
         } else {
            try {
               /*
                * parameters[0] = parameters[0].replaceAll("%", "%25");
                * parameterMap.put(paramName,
                * URLDecoder.decode(parameters[0],"UTF-8")); // 인코더해서 받아온게 있으면 디코더로 풀어서 보내야됨 그대로 인코더안하고 보낼 거면 이거 안써도 됨ㅁㄴㅇㅁㄴㅇ
                */
               parameterMap.put(paramName, parameters[0]);

            } catch (Exception e) {
               e.printStackTrace();
            }
         }
      }
      return parameterMap;
   }
   
 // 암호화(중복방지)
    public static String sha256(String str) {
       String SHA = "";
       try {
          MessageDigest sh = MessageDigest.getInstance("SHA-256");
          sh.update(str.getBytes());
          byte byteData[] = sh.digest();
          StringBuffer sb = new StringBuffer();
          for (int i = 0; i < byteData.length; i++) {
             sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
          }
          SHA = sb.toString();
       } catch (NoSuchAlgorithmException e) {
          e.printStackTrace();
          SHA = null;
       }
       System.out.println(SHA.substring(30));
       return SHA.substring(30);
    }

    //파일 업로드
    public static List<BoardFile> fileUpload(MultipartHttpServletRequest request, String path, String filetype) {
       SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
       // 모든 업로드된 파일
       List<MultipartFile> multipartFile = null;
       // 새로추가한것
       Iterator<String> iter = request.getFileNames();
       String str ="";
       List<BoardFile> fileuploadList = new ArrayList<BoardFile>();
       
       while(iter.hasNext()) {
          str = iter.next();
          multipartFile = request.getFiles(str);
          // 저장 위치 home 폴더 하위 file 하위 path
          String savefullPath = "";
          String encodeFilename = "";
          String orgFilename = "";
          String shortFilename = "";
          String fileextension = "";
          String today = sf.format(new Date());
          String savefolder = request.getSession().getServletContext().getRealPath("/") + "/resources/file/" + path + "/" + today;
   
          Boolean isExtension = false;
          BoardFile fileUpload = null;
          String[] extension = null;
   
          // 게시판
          if (path.equalsIgnoreCase("board")) {
             extension = new String[] { "jpg", "png", "gif", "mp3", "wmv", "mkv", "avi", "mp4", "csv", "xls", "xlsx",
                   "hwp", "ppt", "pptx", "doc", "zip", "7z", "alz","txt" };
          }
   
   
          // File클래스 실제 저장
          File savePath = new File(savefolder);
   
          // 현재 폴더 경로
          System.out.println(savePath.getAbsolutePath());
   
          // 없을 경우 자동 생성
          if (!savePath.exists()) {
             savePath.mkdirs();
             System.out.println("폴더가 생성 되었습니다.");
          }
   
          // 파일 저장
          BufferedOutputStream bos = null;
   
          // 파일 입력
          if (request != null) {
             // 업로드된 파일 갯수만큼 반복
             for (MultipartFile m : multipartFile) {
                fileUpload = new BoardFile();
                // 파일사이즈가 0이면 파일이 없다고 판단
                if (m.getSize() <= 0) {
                   continue;
                }
   
                orgFilename = m.getOriginalFilename().substring(0, m.getOriginalFilename().lastIndexOf("."));
                fileextension = m.getOriginalFilename().substring(m.getOriginalFilename().lastIndexOf(".") + 1);
                encodeFilename = sha256(orgFilename + System.currentTimeMillis());
                if (m.getOriginalFilename().contains(".")) {
                   fileUpload.setOrgfilename(orgFilename);
                   fileUpload.setFilename(encodeFilename);
                   fileUpload.setShortname(shortName(encodeFilename));
                }
   
                // 해당 확장자가 일치하지 않은 파일이 있을 경우 해당 파일 업로드 중지
                if (path.equalsIgnoreCase("board")) {
                   for (String s : extension) {
                      if (fileextension.equalsIgnoreCase(s)) {
                         isExtension = true;
                         break;
                      } else {
                         isExtension = false;
                      }
                   }
                }
   
                if (!isExtension) {
                   continue;
                }
   
                savefullPath = savefolder + "/" + encodeFilename + "." + fileextension;
                String dbsaveFullPath = "/resources/file/" + path + "/" + today + "/" + encodeFilename + "." + fileextension;
                System.out.println(dbsaveFullPath);
                // 파일 경로 = 저장폴더 + 인코딩된 원본이름 + . + 확장자
                fileUpload.setPath(dbsaveFullPath);
   
                // 파일 용량 설정
                fileUpload.setSize(m.getSize() + "");
                // 아이피설정1
                fileUpload.setIp(request.getRemoteAddr());
                fileUpload.setType(fileextension);
   
                // 등록일
                fileUpload.setRegdate(timeStamp());
                fileUpload.setDel_YN("N");
                System.out.println(fileUpload);
                fileuploadList.add(fileUpload);
                try {
                   // 암호화 하여 저장
                   bos = new BufferedOutputStream(new FileOutputStream(savefullPath));
                   bos.write(m.getBytes());
                   bos.flush();
                   bos.close();
                } catch (IOException e) {
                   e.printStackTrace();
                }
             }
          }
       }

       return fileuploadList;
    }
    
    // 이름짧게해주는거
    public static String shortName(String str) {
       String shortName = "";
       for (int i = 0; i < 6; i++) {
          // 최댓값 초과 방지 -2 ( 원래는 -1이 정상 최대길이 6이면 0부터이기 때문에 기본-1해야함)
          int random = (int) (Math.random() * str.length()) - 2;
          while (random < 0) {
             random = (int) (Math.random() * str.length()) - 2;
          }
          shortName += str.substring(random, random + 1);
       }
       return shortName;
    }
    
    //시간찍는거
    public static String timeStamp() {
       long time = System.currentTimeMillis();
       String t = String.valueOf(time / 1000);
       return t;
 }
}
   
   
   
   
