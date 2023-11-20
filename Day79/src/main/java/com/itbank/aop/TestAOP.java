package com.itbank.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.itbank.model.vo.BoardVO;

/*
	AOP : Aspect Object Programming
	- 관점 지향 프로그래밍
	- 문제를 바라보는 관점을 기준으로 프로그래밍 하는 기법을 의미
	- 쉽게는 공통적인 관심사를 묶어서 처리
	- 주로 Service 위치에서 활용한다

	@Before 	: 지정 포인트 컷이 실행되기 전에 수행
	@After 		: 지정 포인트 컷이 실행된 후 수행
	
	PointCut 		: AOP가 실행될 위치를 의미
	1. executeion 	: 실행할 위치를 지정한다
	2. *			: 반환형 자리 (*는 모든 타입을 의미)
	3. com.itbank.service : 패키지명
	4. BoardService	: 클래스명
	5. *			: 메서드명
	6. (..)			: 매개변수 (..은 모든 매개변수를 의미)
*/

@Component
@Aspect
public class TestAOP {
	private long startTime, endTime;
	
	// 지정한 메서드가 실행되기 전에 먼저 수행
	@Before("execution(* com.itbank.service.BoardService.*(..))")
	public void start() {
		startTime = System.currentTimeMillis();
	}
	
	// 지정한 메서드가 실행된 후 수행
	@After("execution(* com.itbank.service.BoardService.*(..))")
	public void end() {
		endTime = System.currentTimeMillis();
		double result = (endTime - startTime) / 1000.0;
		
		System.out.println("실행 시간 : " + result + "초");
	}
	
	@After("execution(* com.itbank.service.BoardService.*(int))")
	public void paramTest(JoinPoint jp) {
		String params = "";
		
		// getArgs() : 전달인자를 Object 배열로 반환
		for (Object ob : jp.getArgs()) {
			params += ob;
		}
		
		// getSignature() : 실행 대상을 반환
		System.out.println("jp = " + jp);
		System.out.println("jp = " + jp.getSignature().getName());
		System.out.println("jp = " + params);
	}
	
	@Before("execution(* com.itbank.service.BoardService.*(com.itbank.model.vo.BoardVO))")
	public void change(JoinPoint jp) {
		
		BoardVO input = (BoardVO)jp.getArgs()[0];
		
		// input.setTitle(input.getTitle() + " ※ AOP 개입~");
		// - 매변 게시글 제목에 추가 되기 때문에 제거 (= 디버그용)
		
		System.out.println(input.getTitle());
	}
	
	
	
	
}
