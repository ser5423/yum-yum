

import static org.hamcrest.CoreMatchers.containsString;
import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.fileUpload;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultHandler;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import org.junit.Before;


import kr.gudi.yumyum.controller.yumyumController;
import kr.gudi.yumyum.dao.yumyumDaoInterface;
import kr.gudi.util.HttpUtil;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@WebAppConfiguration
@SessionAttributes("id")
public class TestCase {
   
     @Autowired
     yumyumDaoInterface ydi;
   
   
     @Autowired // WebContext Bean 받아오기
       private WebApplicationContext wac;
      
      // MockMVC 변수 생성
      private MockMvc mock;
      
   
      //로그인 변수 
      private String ID = "admin";//선언하시오
      
      
      //로그인 서치 아이디 변수
      private String loginsearchid = ""; //선언하시오
      //패스워드 서치 변수
      private String pwsearch =""; //선언하시오
      @Before
      public void init(){ // MockMVC 에게 WebContext 정보 받아 오기 
         mock = MockMvcBuilders.webAppContextSetup(wac).build();
         
      }
         
//      @Test
      public void managerlogin() throws Exception { // 매니저 로그인 테스트
         mock.perform(get("/Managerlogin1")           // get방식 : get("주소"), post방식 : post("주소") 
                .param("PW", "123123") // paramater값 설정 : .param("key", "value")
                .param("ID", "admin")
                )
         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
            @Override
            public void handle(MvcResult arg0) throws Exception {
               ModelAndView mav = arg0.getModelAndView();
               Map<String, Object> map = mav.getModel();              
               
               String message = map.get("message").toString();
       
               System.out.println(message);
               JsonParser parser = new JsonParser();
   		       JsonElement element = parser.parse(message);
   		
   		       JsonObject jobject = element.getAsJsonObject(); 
//               System.out.println(jobject.get("ID").toString());
//               System.out.println(ID);
               assertEquals(ID, jobject.get("ID").getAsString());
            }
         });
   }      
//      @Test
      public void board() throws Exception { // 게시판 리스트 
         mock.perform(get("/Board1_Data")           // get방식 : get("주소"), post방식 : post("주소") 
                .param("type", "fr") // paramater값 설정 : .param("key", "value")
                .param("start", "1")
                .param("viewRow", "10")
                )
         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
            @Override
            public void handle(MvcResult arg0) throws Exception {
               ModelAndView mav = arg0.getModelAndView();
               Map<String, Object> map = mav.getModel();              
               
               String message = map.get("message").toString();
               JsonParser parser = new JsonParser();
   		       JsonElement element = parser.parse(message);
   		       System.out.println(element); // 게시판 전체 글 불러오는 거 확인 하는 부분
//   		       JsonObject jobject = element.getAsJsonObject(); 
   		       
//   		       JsonArray list = jobject.get("list").getAsJsonArray();
//   		    	JsonObject row = list.get(0).getAsJsonObject();
//   		    	System.out.println(row);
//               assertEquals("fr", row.get("TYPE").getAsString()); // 타입 부분으로 게시글 중 하나를 비교하는 부분
            }
         });
   }
//      @Test
      public void boardsearh() throws Exception { // 게시판 검색
         mock.perform(get("/Board1_Data")           // get방식 : get("주소"), post방식 : post("주소") 
                .param("type", "fr") // paramater값 설정 : .param("key", "value")
                .param("start", "1")
                .param("viewRow", "10")
        		.param("TITLE", "qwe")
                )
         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
            @Override
            public void handle(MvcResult arg0) throws Exception {
               ModelAndView mav = arg0.getModelAndView();
               Map<String, Object> map = mav.getModel();              
               
               String message = map.get("message").toString();
               JsonParser parser = new JsonParser();
   		       JsonElement element = parser.parse(message);
//   		       System.out.println(element);
   		       JsonObject jobject = element.getAsJsonObject(); 
   		       
   		       JsonArray list = jobject.get("list").getAsJsonArray();
   		    	JsonObject row = list.get(0).getAsJsonObject();
   		    	System.out.println(row);
               assertEquals("qwe", row.get("TITLE").getAsString()); // 게시판 글 검색 부분
            }
         });
   }
//      @Test
      public void boardView() throws Exception { // 게시판 세부보기 테스트
         mock.perform(get("/BoardView_Data")           // get방식 : get("주소"), post방식 : post("주소") 
                .param("NO", "1") // paramater값 설정 : .param("key", "value")
                .param("TYPE", "fr")
                )
         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
            @Override
            public void handle(MvcResult arg0) throws Exception {
               ModelAndView mav = arg0.getModelAndView();
               Map<String, Object> map = mav.getModel();              
               
               String message = map.get("message").toString();
               JsonParser parser = new JsonParser();
   		       JsonElement element = parser.parse(message);

   		       JsonObject jobject = element.getAsJsonObject(); 
   		       System.out.println(jobject.get("boardview"));
   		       
   		       JsonObject obj = jobject.get("boardview").getAsJsonObject();
   		       int no = obj.get("NO").getAsInt();
               assertEquals(1, no);
               
            }
         });
   }      
//      @Test
      public void boardDelete() throws Exception { // 게시판 글 삭제 테스트
         mock.perform(get("/BoDelete_Data")           
                .param("NO", "1") // param(key , value)
//                .param("type", "fr")
//                .param("move", "/yumyum/Board?type=fr")
                )
         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
            @Override
            public void handle(MvcResult arg0) throws Exception {
               ModelAndView mav = arg0.getModelAndView();
               Map<String, Object> map = mav.getModel();              
               
               String message = map.get("message").toString();
               JsonParser parser = new JsonParser();
                JsonElement element = parser.parse(message);

//                JsonObject jobject = element.getAsJsonObject(); 
//                System.out.println(jobject.get("boardview"));
//                JsonElement val = jobject.get("delete");
                System.out.println(element);
//                assertEquals("1", jobject.toString());
               
            }
         }).andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
       .andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
   }      
      
//      @Test
      public void selectItem() throws Exception { // 레시피 리스트 테스트
         mock.perform(get("/RE_Data")           // get방식 : get("주소"), post방식 : post("주소") 
        		 .param("type", "KF") // paramater값 설정 : .param("key", "value")
                 .param("start", "1")
                 .param("viewRow", "10")
                 .param("NO", "2")
                 )
          .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
             @Override
             public void handle(MvcResult arg0) throws Exception {
                ModelAndView mav = arg0.getModelAndView();
                Map<String, Object> map = mav.getModel();              
                
                String message = map.get("message").toString();
                JsonParser parser = new JsonParser();
    		       JsonElement element = parser.parse(message);
//    		       System.out.println(element);
    		       JsonObject jobject = element.getAsJsonObject(); 
    		       
    		       JsonArray list = jobject.get("list").getAsJsonArray();
//    		       System.out.println(list);
    		    	JsonObject row = list.get(0).getAsJsonObject();
    		    	System.out.println(row);
                assertEquals("KF", row.get("type").getAsString());
               
            }
         });
   }    
//      @Test
      public void review() throws Exception { // 리뷰 리스트 테스트
         mock.perform(get("/Review_Data")           // get방식 : get("주소"), post방식 : post("주소") 
                .param("start", "1") // paramater값 설정 : .param("key", "value")
                .param("viewRow", "10")
                )
         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
            @Override
            public void handle(MvcResult arg0) throws Exception {
               ModelAndView mav = arg0.getModelAndView();
               Map<String, Object> map = mav.getModel();              
               
               String message = map.get("message").toString();
               JsonParser parser = new JsonParser();
   		       JsonElement element = parser.parse(message);
   		       System.out.println(element); // 리뷰 글 전체 불러오는 부분
//   		       JsonObject jobject = element.getAsJsonObject(); 
   		       
//   		       JsonArray list = jobject.get("list").getAsJsonArray();
//   		       JsonObject row = list.get(0).getAsJsonObject();
//   		       System.out.println(row);
//               assertEquals("fr", row.get("TYPE").getAsString()); // 타입 부분 조회
//               assertEquals("qwe", row.get("TITLE").getAsString()); // 게시판 글 검색 부분
              
            }
         });
   }
//    @Test
    public void reviewsearh() throws Exception { // 리뷰 검색 테스트
       mock.perform(get("/Review_Data")           // get방식 : get("주소"), post방식 : post("주소") 
              .param("start", "1") // paramater값 설정 : .param("key", "value")
              .param("viewRow", "10")
              .param("WRITER","admin")
              .param("TITLE", "admintesttest")
              )
       .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
          @Override
          public void handle(MvcResult arg0) throws Exception {
             ModelAndView mav = arg0.getModelAndView();
             Map<String, Object> map = mav.getModel();              
             
             String message = map.get("message").toString();
             JsonParser parser = new JsonParser();
 		       JsonElement element = parser.parse(message);
// 		       System.out.println(element); // 글 전체 불러오는 부분
 		       JsonObject jobject = element.getAsJsonObject(); 
 		       
 		       JsonArray list = jobject.get("list").getAsJsonArray();
 		       JsonObject row = list.get(0).getAsJsonObject();
 		       System.out.println(row);
 		       assertEquals("admin", row.get("WRITER").getAsString()); // 작성자 조회
 		       assertEquals("admintesttest", row.get("TITLE").getAsString()); // 제목 검색 부분
            
          }
       });
 }

//    @Test
    public void reviewinsert() throws Exception {
      MockMultipartFile file = new MockMultipartFile("file", "hello.txt", MediaType.TEXT_PLAIN_VALUE, "Hello, World!".getBytes());
       mock.perform(fileUpload("/ReInput_Data")
            .file(file)
            .param("TITLE", "연어샐러드") // paramater값 설정 : .param("key", "value")
              .param("WRITER", "tm_nanaya@naver.com")
              )
       .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
          @Override
          public void handle(MvcResult arg0) throws Exception {
             ModelAndView mav = arg0.getModelAndView();
             Map<String, Object> map = mav.getModel();              
             
             String message = map.get("message").toString();
             JsonParser parser = new JsonParser();
              JsonElement element = parser.parse(message);

              JsonObject jobject = element.getAsJsonObject(); 
              System.out.println(jobject.get("rstInsertCnt"));      
          }
       });
 }    
    @Test
    public void boardinsert() throws Exception {
      MockMultipartFile file = new MockMultipartFile("file", "hello.txt", MediaType.TEXT_PLAIN_VALUE, "Hello, World!".getBytes());
       mock.perform(fileUpload("/BoInput_Data")
            .file(file)
            .param("TITLE", "맛있네요") // paramater값 설정 : .param("key", "value")
              .param("NAME", "hanyena1134@naver.com")
              )
       .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
          @Override
          public void handle(MvcResult arg0) throws Exception {
             ModelAndView mav = arg0.getModelAndView();
             Map<String, Object> map = mav.getModel();              
             
             String message = map.get("message").toString();
             JsonParser parser = new JsonParser();
              JsonElement element = parser.parse(message);

              JsonObject jobject = element.getAsJsonObject(); 
              System.out.println(jobject.get("rstInsertCnt"));      
          }
       });
 } 
      
   
}