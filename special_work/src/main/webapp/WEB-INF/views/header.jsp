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
			<li><a href="${contextPath }/mypage/">home</a></li>
			<li><a href="${contextPath }/mypage/myDetailInfo">내정보 수정</a></li>
			<li><a href="${contextPath }/mypage/myCartList">카트</a></li>
		</ul>
		
</nav>
<hr>
</header>