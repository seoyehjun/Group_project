package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.itbank.model.vo.BoardVO;

public interface BoardDAO {

	@Select("select * from board where idx = #{idx}")
	BoardVO selectOne(int idx);

	@Delete("delete from board where idx = #{idx}")
	int delete(int idx);
	

	List<BoardVO> selectAll();
	
	int insert(BoardVO input);

}
