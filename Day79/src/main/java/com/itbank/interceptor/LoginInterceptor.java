package com.itbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.itbank.model.vo.AccountVO;

/*
	Interceptor : 요청을 가로채서 필요한 로직을 처리하는 클래스
	
	작동 시점
	1. preHandle		: 요청이 컨트롤러에 넘어가기 전
	2. postHandle		: 컨트롤러의 메서드가 모두 수행된 후
	3. afterCompletion	: 응답이 클라이언트에 도달한 후
*/

public class LoginInterceptor extends HandlerInterceptorAdapter {

	// 1. true를 반환 	: 요청된 Controller를 이어서 수행
	// 2. false를 반환	: Controller를 실행하지 않고 중단
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String cpath = request.getContextPath();
		
		HttpSession session = request.getSession();
		AccountVO user = (AccountVO)session.getAttribute("user");
		
		if (user == null) {
			response.sendRedirect(cpath + "/account/login");
			return false;
		}
		
		return true;
	}

	
}
