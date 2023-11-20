package com.itbank.aop;

import java.security.NoSuchAlgorithmException;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itbank.components.SHA512;
import com.itbank.model.vo.AccountVO;

@Component
@Aspect
public class AccountAOP {
	
	@Autowired private SHA512 hash;

	@Before("execution(* com.itbank.service.AccountService.*(com.itbank.model.vo.AccountVO, ..))")
	public void hash(JoinPoint jp) throws NoSuchAlgorithmException {
		AccountVO input = (AccountVO)jp.getArgs()[0];
		
		if (input.getUserpw() == null) {
			input.setUserpw("0");
		}
		
		input.setUserpw(hash.getHash(input.getUserpw()));
	}
}