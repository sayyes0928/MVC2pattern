package com.jachi.Api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.jachi.Action.Action;
import com.jachi.DTO.ActionForward;
import com.jachi.DTO.UserinfoDTO;
import com.jachi.svc.JoinIdcheckUserinfoService;


public class CallbackNaver implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		throws Exception{
		
		
		    
		    String clientId = "Z5SQgAjtE4al89G3NLng";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
		    String clientSecret = "8c2ZbjbrQq";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = URLEncoder.encode("http://127.0.0.1:8080/MVC2/backpage.jsp", "UTF-8");
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token = "";
		    String refresh_token = "";
		    System.out.println("apiURL="+apiURL);
		    ActionForward forward = new ActionForward();
	
		    
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      
		      BufferedReader br;
		      System.out.print("responseCode="+responseCode);
		      if(responseCode==200) { // ���� ȣ��
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // ���� �߻�
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		    		System.out.println(res.toString());
		    		JSONParser parsing = new JSONParser();
		    		Object obj = parsing.parse(res.toString());
		    		JSONObject jsonObj = (JSONObject)obj;
		    			        
		    		access_token = (String)jsonObj.get("access_token");
		    		refresh_token = (String)jsonObj.get("refresh_token");
		    		
		    	   
					if(access_token != null) { // access_token�� �� �޾ƿԴٸ�
							System.out.println("access_token");
							System.out.println("������ū");
							String apiurl = "https://openapi.naver.com/v1/nid/me";
							URL url1 = new URL(apiurl);
							HttpURLConnection con1 = (HttpURLConnection)url1.openConnection();
							con1.setRequestMethod("GET");
							String header = "Bearer " + access_token;
							con1.setRequestProperty("Authorization", header);
							int responseCode1 = con1.getResponseCode();
							BufferedReader br1;
							if(responseCode1==200) { // ���� ȣ��
								System.out.println("����ȣ��");
							 br1 = new BufferedReader(new InputStreamReader(con1.getInputStream()));
							} else {  // ���� �߻�
								System.out.println("�����߻�");
							br1 = new BufferedReader(new InputStreamReader(con1.getErrorStream()));
							}
							String inputLine1;
							StringBuffer res1 = new StringBuffer();
							 while ((inputLine1 = br1.readLine()) != null) {
							res1.append(inputLine1);
							}
							br1.close();
							
							JSONParser parsing1 = new JSONParser();
							Object obj1 = parsing1.parse(res1.toString());
							JSONObject jsonObj1 = (JSONObject)obj1;
							JSONObject resObj = (JSONObject)jsonObj1.get("response");
							 
							//���� ���� �̸��� ���ϴ� ��� ���ϸ� �ȴ�. 
							//��, ������ get()�ȿ� ���� ���� ���λ� ���� ���� ���� �״�� �����־�� �Ѵ�.
							String us_id = (String)resObj.get("id");
							String email = (String)resObj.get("email");
							String name = (String)resObj.get("name");
							String profile_image = (String)resObj.get("profile_image");
							
					    	// �� �ȿ� �ڵ� �ۼ�
							HttpSession session = request.getSession(false);
							UserinfoDTO userDTO = new UserinfoDTO();
							
							session.setAttribute("us_id", us_id);
							userDTO.setUs_mail(email);
							userDTO.setUs_name(name);
							userDTO.setUs_pic(profile_image);
							
							if(email==null || name==null || profile_image==null) {
								
								response.setContentType("text/html;charset=UTF-8");
								PrintWriter out = response.getWriter();
								out.println("<script>");
								out.println("alert('�ʼ��׸��� �ݵ�� �������ּž� �մϴ�.����ó�� �ݴ���������.�����ϼ���')");
								out.println("history.back();");
								out.println("</script>");
							}
			// ����ȸ�� ���Կ��� üũ
							String joinCheck = null;
						    JoinIdcheckUserinfoService joinIdcheckUserinfoService = new JoinIdcheckUserinfoService();
						    joinCheck = joinIdcheckUserinfoService.checkUserID(us_id);
					        
							if(!joinCheck.equals("0")) {					
						     forward.setPath("backpage.jsp");
							}else {
							 request.setAttribute("userinfo", userDTO);
							 forward.setPath("joinNaverFormPage.jsp");
							}
								
					    } 
					}
		      
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		 
		return forward;
	}

}
