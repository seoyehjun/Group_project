<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<link href="${contextPath }/resources/css/style.css" rel="stylesheet">
</head>
<body>


<header>

		<h1>Gaba works</h1>
		<br>
<nav class="menu">
 		<ul>
			<li><a href="${cpath }">home</a></li>
		</ul>
		
		<ul>
			<c:if test="${empty user }">
				<li><a href="${cpath }/account/signUp">회원가입</a></li>
				<li><a href="${cpath }/account/login">로그인</a></li>
			</c:if>
			<c:if test="${not empty user }">
				<li><a href="${cpath }/account/myPage">${user.nick }</a></li>
				<li><a href="${cpath }/account/logout">로그아웃</a></li>
			</c:if>
		</ul>
</nav>
<hr>
</header>