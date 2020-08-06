
package com.jachi.Action;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.jachi.DTO.ActionForward;


public class TokenGetAccessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Object access_token = request.getAttribute("access_token");
		System.out.println(access_token);
		System.out.println("엑세토큰");
		
		if(access_token != null) { // access_token을 잘 받아왔다면
			try {
		    	// 이 안에 코드 작성
				System.out.println("access_token");
				System.out.println("엑세토큰");
				String apiurl = "https://openapi.naver.com/v1/nid/me";
				URL url = new URL(apiurl);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				String header = "Bearer " + access_token;
				con.setRequestProperty("Authorization", header);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if(responseCode==200) { // 정상 호출
					System.out.println("정상호출");
				 br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // 에러 발생
					System.out.println("에러발생");
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer res = new StringBuffer();
				 while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
				}
				br.close();
				
				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(res.toString());
				JSONObject jsonObj = (JSONObject)obj;
				JSONObject resObj = (JSONObject)jsonObj.get("response");
				 
				//왼쪽 변수 이름은 원하는 대로 정하면 된다. 
				//단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
				String naverCode = (String)resObj.get("id");
				String email = (String)resObj.get("email");
				String name = (String)resObj.get("name");
				String nickName = (String)resObj.get("nickname");
				
				System.out.println(email + "이메일 확인");
				
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
		}
		
		ActionForward forward = new ActionForward();
		System.out.println("액션으로 리턴 잘옴");
		forward.setPath("/Index.jsp");
		
		return forward;
	}

}
