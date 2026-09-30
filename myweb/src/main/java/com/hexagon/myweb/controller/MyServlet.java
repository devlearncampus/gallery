package com.hexagon.myweb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글이 깨지지 않도록 UTF-8 인코딩 처리
		response.setCharacterEncoding("UTF-8");
		
		//이 애플리케이션을 접속하여 들어오는 클라이언트 브라우저에게 나의 이름을 전송하기 위해 문자열을 준비하자!!
		PrintWriter out = response.getWriter();
		out.print("HI!!!!");
		
	}
}

	





