
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
		System.out.println("������ū");
		
		if(access_token != null) { // access_token�� �� �޾ƿԴٸ�
			try {
		    	// �� �ȿ� �ڵ� �ۼ�
				System.out.println("access_token");
				System.out.println("������ū");
				String apiurl = "https://openapi.naver.com/v1/nid/me";
				URL url = new URL(apiurl);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				String header = "Bearer " + access_token;
				con.setRequestProperty("Authorization", header);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if(responseCode==200) { // ���� ȣ��
					System.out.println("����ȣ��");
				 br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // ���� �߻�
					System.out.println("�����߻�");
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
				 
				//���� ���� �̸��� ���ϴ� ��� ���ϸ� �ȴ�. 
				//��, ������ get()�ȿ� ���� ���� ���λ� ���� ���� ���� �״�� �����־�� �Ѵ�.
				String naverCode = (String)resObj.get("id");
				String email = (String)resObj.get("email");
				String name = (String)resObj.get("name");
				String nickName = (String)resObj.get("nickname");
				
				System.out.println(email + "�̸��� Ȯ��");
				
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
		}
		
		ActionForward forward = new ActionForward();
		System.out.println("�׼����� ���� �߿�");
		forward.setPath("/Index.jsp");
		
		return forward;
	}

}
