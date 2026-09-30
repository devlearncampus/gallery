package com.hexagon.myapp.test;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;

public class Gugudan extends HttpServlet{
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		PrintWriter out = resp.getWriter();//브라우저에게 전송할 응답 정보를 문자열로 출력할 스트림 얻기

		for(int i=1;i<=9;i++){
			out.println("2*"+i+"="+(2*i));
		}

	}	


}
