package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.itbank.model.vo.AccountVO;

public interface AccountDAO {
	
	@Select("select * from account where idx = #{idx}")
	AccountVO test(int idx);

	@Select("select * from account order by idx desc")
	List<AccountVO> selectAll();

	@Select("select userid from account where email = #{email}")
	List<String> selectEmail(String email);
	
	@Select("select * from account where userid = #{userid} and userpw = #{userpw}")
	AccountVO selectOne(AccountVO input);

	@Select("select * from account where userid = #{userid}")
	AccountVO selectTest(AccountVO input);
	
	@Select("select * from account where userid = #{userid} and email = #{email}")
	AccountVO seletAcc(AccountVO input);
	
	@Delete("delete from account where idx = #{idx}")
	int delete(int idx);
	
	int insert(AccountVO input);

	int update(AccountVO input);

	

	


}
