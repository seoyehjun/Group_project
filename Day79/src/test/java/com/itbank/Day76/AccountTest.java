package com.itbank.Day76;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itbank.components.SHA512;
import com.itbank.model.AccountDAO;
import com.itbank.model.vo.AccountVO;
import com.itbank.service.AccountService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class AccountTest {

	@Autowired private AccountService as;
	@Autowired private AccountDAO dao;
	@Autowired private SHA512 hash;
	
	private AccountVO testAcc;
	
	@Before
	public void setup() {
		testAcc = dao.test(1002);
	}
	
	@Test
	public void testGetAccounts() {
		List<AccountVO> list = as.getAccounts();
		assertNotNull(list);
	}
	
	@Test
	public void testLogin() {
		AccountVO user;
		
		user = dao.selectOne(testAcc);
		assertNotNull(user);
		
		// System.out.println(user.getUserid());
	}

	@Test	// delete/insert 테스트
	public void testSignUp() throws NoSuchAlgorithmException {
		testAcc.setUserid("testCase123123");
		testAcc.setNick("테스트시 삭제 후 진행");
		
		AccountVO delAcc = dao.selectTest(testAcc);
		System.err.println(delAcc);
		
		// 1. 계정이 있으면 제거 후
		if (delAcc != null) {
			int row = as.delete(delAcc.getIdx());
			assertNotEquals(0, row);
		}
		
		// 2. insert를 수행
		int row = as.signUp(testAcc);
		assertNotEquals("이미 있는 계정", 0, row);
	}
	
	@Test
	public void testGetHash() throws NoSuchAlgorithmException {
		String testPw = "4dff4ea340f0a823f15d3f4f01ab62eae0e5da579ccb851f8db9dfe84c58b2b37b89903a740e1ee172da793a6e79d560e5f7f9bd058a12a280433ed6fa46510a";
		
		assertEquals(testPw, hash.getHash("1"));
	}
	
	@Test
	public void testFindId() {
		String result = as.findAccount("test1@icloud.com");
		assertNotNull(result);
		
		// System.out.println(result);
	}
	
	@Test
	public void testFindPw() throws NoSuchAlgorithmException {
		String msg = as.findAccount(testAcc);
		
		assertNotNull(msg);
		System.out.println("msg = " + msg);
		
	}

	
}
