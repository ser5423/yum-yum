package kr.gudi.util;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

}