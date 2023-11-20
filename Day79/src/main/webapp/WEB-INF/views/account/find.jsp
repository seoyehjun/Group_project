<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section>
	<h4>ID 찾기</h4>
	
	<form action="${cpath }/account/findId" method="POST">
		 <p><input name="email" type="email" placeholder="이메일" required></p>
		 
		 <button>전송</button>
	</form>
	
	
	
	<h4>PW 찾기</h4>
	
	<form action="${cpath }/account/findPw" method="POST">
		 <p><input name="email" type="email" placeholder="이메일" required></p>
		 <p><input name="userid" placeholder="아이디" required></p>
		 
		 <button>전송</button>
	</form>
	
</section>

<%@ include file="../footer.jsp" %>