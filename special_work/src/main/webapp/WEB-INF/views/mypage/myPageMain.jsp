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
</head>
<body>
	<table class="list_view">
		<tbody align=center>
			<tr style="background: #008080">
				<td>주문번호</td>
				<td>주문일자</td>
				<td>주문상품</td>
				<td>주문상태</td>
				<td>주문취소</td>
			</tr>
		<c:choose><%--주문한상품이 있을경우 or 없을경우 --%>
			<c:when test="${ empty myOrderList }"><%--주문 상품이 없을 경우 --%>
			<tr>
				<td colspan=5 class="fixed">
					<strong>주문한 상품이 없습니다. </strong>
				</td>
			</tr>
			</c:when>
			<c:otherwise><%--주문 상품이 존재할 경우 --%>
			 <c:forEach var="item" items="${myOrderList }" varStatus="i">
			  <c:choose>		
				<c:when test="${pre_order_id != item.order_id }">
				 <c:choose>
				 
				</c:when>
			  </c:choose>
			</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
</body>
</html>