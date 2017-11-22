

import static org.hamcrest.CoreMatchers.containsString;
import static org.junit.Assert.*;
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
      public void managerlogin() throws Exception {
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
      public void board() throws Exception {
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
   		       System.out.println(element);
   		       JsonObject jobject = element.getAsJsonObject(); 
   		       
   		       JsonArray list = jobject.get("list").getAsJsonArray();
   		    	JsonObject row = list.get(0).getAsJsonObject();
//   		    	System.out.println(row);
               assertEquals("fr", row.get("TYPE").getAsString());
               
//               JsonArray list = jobject.get("list").getAsJsonArray();
//   			JsonObject row = list.get(0).getAsJsonObject();
//
//   			assertEquals("KF", row.get("type").getAsString());
            }
         });
   }
//      @Test
      public void boardView() throws Exception {
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
      @Test
      public void selectItem() throws Exception {
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

      
   
}