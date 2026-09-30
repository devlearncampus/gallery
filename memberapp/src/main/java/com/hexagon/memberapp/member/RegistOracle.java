package com.hexagon.memberapp.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//오라클 insert 요청을 처리하는 서블릿  
public class RegistOracle extends HttpServlet{
	
	//클라이언트의 요청 방법이 Post 이므로, doXXX형 중 doPost() 를 재정의한다!!
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");//한글이 깨지지 않도록 인코딩 방식 지정
		response.setContentType("text/html"); //문서형식이면서 html 이다!!!
		
		/*데이터베이스 연동 절차 
		 * 1) 드라이버 로드 oracle driver 
		 * 2) 접속 
		 * 3) 쿼리수행
		 * 4) 자원해제
		 */
		
		
			Connection con=null;
			
			try {
				//1)드라이버 로드 
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				//2) 접속, 접속이 성공되면 그 정보를 가진 객체가 반환(Connection)
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1", "web", "1234");
				
				if(con==null) {
					System.out.println("접속 실패");
				}else {
					System.out.println("접속 성공");
				}
				
				//3) 쿼리실행 
				String str="";
				for(int i=1;i<=20;i++) {
					str+="appleappleappleappleappleappleappleappleappleappleapple";
				}
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		//클라이언트에게 보내질(by tomcat) 응답 정보 만들기 위해 응답 정보가 보유한 문자기반 출력스트림을 얻자!!
		PrintWriter out = response.getWriter();
		
		out.print("나의 오라클 요청 서블릿 가동 테스트 성공");
		
	}
}






















