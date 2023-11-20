package com.itbank.Day76;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itbank.service.AccountService;
import com.itbank.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class SampleTest {
	// 한번에 너무 실행되서 확인이 힘들면
	// 별도의 Test를 만들어서 확인하는 방식도 추천
	
	@Autowired private AccountService as;
	@Autowired private BoardService bs;
	
	@Test
	public void run() {
		
	}
}
