package com.hexagon.basicapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//이 서블릿은 클라이언트의 로그인 요청을 처리하기 위한 서블릿임
public class LoginServlet extends HttpServlet{
	
	//개발자가 이 서블릿 클래스를 서버에 배포한 후, 최초의 브라우저의  요청에 의해 서블릿의 인스턴스가 Tomcat에 의해 만들어지는데, 
	//인스턴스 생성 직후, 이 서블릿의 init() 초기화 메서드가 무조건 호출된다..
	//생성자 아님!! 즉 생성후에 초기화를 위해 호출되므로 생성자보다 호출시점도 늦다..
	public void init() throws ServletException {
		System.out.println("저 아까 태어나서 지금 울어요..ㅜㅜ");
	}
	
	//이 메서드는 서블릿 클래스가 보유한 doXXXX 형 중, 클라이언트의 요청 method가 post인 경우 동작하는 메서드이다..
	//즉 개발자가 이 메서드를 정의해놓으면, 클라이언트의 요청 post을때 이 메서드가 쓰레드에 의해 호출된다..
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트의 웹브라우저에서 전송된 id, password 알아맞춰보자!!
		//클라이언트의 요청 정보는 당연히 요청 객체에 들어있으므로, 꺼내보자!!
		//웹상으로 전송된 데이터는 언제나 자료형이 문자열이다... 1234 조차 "1234" 가 되버림
		String v1=request.getParameter("id"); //아이디 값 꺼내기
		String v2=request.getParameter("password"); //비밀번호 값 꺼내기
		
		System.out.println("전송된 아이디는 "+v1);
		System.out.println("전송된 패스워드는 "+v2);
		
		//개발자는 브라우저가 보게될 컨텐트를 문자기반 출력스트림에 저장해놓으면, 톰켓이 그 저장된 결과를 이용하여 html 을 생성하고,
		//응답 정보로 전송하고..네트워크는 끊어지며, 요청을 처리했던 request, response, thread 를 소멸시켜 버린다..
		
		PrintWriter out=response.getWriter();//응답 객체로부터 스트림 얻기!!
		
		String tag="<table width='300px' border='px'>";
		tag+="<tr>";
		tag+="<td>ID</td>";
		tag+="<td>"+v1+"</td>";
		tag+="</tr>";
		
		tag+="<tr>";
		tag+="<td>Password</td>";
		tag+="<td>"+v2+"</td>";
		tag+="</tr>";
		tag+="</table>";

		out.print(tag); //스트림에 보관!!! 주의- 브라우저에 출력하는 시점 아님!!!! 즉 스트림에 문자열을 넣어두면 고양이가 브라우저에 보냄
	}
}








