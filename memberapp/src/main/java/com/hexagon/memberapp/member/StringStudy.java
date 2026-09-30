package com.hexagon.memberapp.member;

public class StringStudy {

	public static void main(String[] args) {
		/*
		java 에서 String 객체를 생성하는 방법은 일반 변수처럼 사용하는 방법도 있지만, 일반클래스이기 때문에 new 연산자에 의한 생성방법도 있다.
		1) 일반 변수처럼 생성하는 방법은 - 상수풀(Constant Pool)에 생성되므로, 같은 내용의 String 객체가 존재할 경우 중복생성을 하지 않음
		2) new 연산자에 의한 생성방법은 일반 인스턴스 처럼 생성되므로 new 할때 마다 인스턴스가 생성되므로, 같은 객체를 가리키지 않는다.
		
		문제제기) 문자열의 주소가 아니라, 내용을 비교하려면??
		            모든 클래스의 부모인 Object 최상위 클래스에는 equals() 가 존재하며, 이 equals() 메서드를 재정의한 객체라면 
		            인스턴스간 내용비교가 가능한데, 특히 우리가 흔히 쓰고 있는 String 클래스는 이미 sun에 의해 equals() 메서드를 재정의해놓음
		*/
		String s1="korea";
		String s2="korea";		
		System.out.println(s1==s2); 
		
		String k1=new String("korea");
		String k2=new String("korea");
		System.out.println(k1==k2); 
		System.out.println(k1.equals(k2));//내용비교 
		
		/*
		 String 객체는 immutable 이다!!!  = 불변
		 String 객체는 상수로 취급되므로, 한번 생성된 이후엔 수정 자체가 불가능함
		 따라서 아래의 경우 상수풀에 총 만들어진 문자리터럴의 수는? 
		 2개 
		 1) "우리는" 이라는 문자 객체 리터럴
		 2) "우리는 개발자다" 문자 객체 리터럴 
		 따라서, 절대로 String을 대상으로 누적 반복문을 돌려서는 안된다!!!
		*/
		
		//신입들이 절대 해서는 안되는 코드의 예
		String str="우리는";
		for(int i=1;i<=20;i++) {
			str=str+" 개발자다";
		}
		
		//해결책) 수정 가능한 문자열처리 객체를 사용해야 함, 누적이 가능한 문자열 처리 객체 
		//주의) String 이 아니므로 누적이 끝난 후엔 String으로 변환!!
		StringBuffer sql=new StringBuffer();
		sql.append("insert int member(c1,c2...)");
		sql.append(" values(?,?)");
		
		System.out.println(sql.toString()); //Object 클래스로부터 상속받은 toString() 메서드를 사용해서 문자열로 전환!!
		
		
	}

}









