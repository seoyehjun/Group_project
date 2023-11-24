<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</header>--%>
<%@ include file="../header.jsp" %>


<br><br>
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
			 <c:forEach var="item" items="${ myOrderList }" varStatus="i">
			  <c:choose>
			   <c:when test="${pre_order_id != item.orders_idx }">
			  <c:choose><%--점선 --%>	
				<c:when test="${ item.orders_status == 'delivery_prepared' }">
				  <tr bgcolor="lightgreen">
				</c:when>
				<c:when test="${ item.orders_status == 'finished_delivering' }">
				  <tr bgcolor="lightgray">
				</c:when>
				<c:otherwise>
				 <tr bgcolor="orange">
				</c:otherwise>
			  </c:choose>
		
		    <tr><%--실제 상품 --%>
		    
		     <td><%--주문번호 --%>
		      <a href="${contextPath }/mypage/myOrderDetail.do?order_id=${item.orders_idx}"><span>${item.orders_idx }</span></a>
		      <%--컨트롤러에서 받아서 주문 상세페이지 띄워주자 --%>
		     </td>
		     
		     <td>
		      <span>${item.orders_date }</span>
		     </td><%-- 주문 시간 --%>
		     
		     
		     <td align="left"><%--주문row의 상품title --%>
		      <strong>
		       <c:forEach var="item2" items="${myOrderList }" varStatus="j"><%--전체 orders에서 같은 주문에 속한것 모두 한줄에 표시 --%>
		        <c:if test="${item.orders_idx == item2.orders_idx }">
		         <a href="${contextpath }/goods/goodsDetail?goods_idx=${item2.getproducts_idx()}">질문부분${item2.products_idx }/${item2.orders_total_quantity }개
		         </a><br>                 <%--주문의 products_idx를 주면 상품 상세페이지로 연결되도록 해주세요 --%>
		        </c:if>
		       </c:forEach>
		      </strong>
		     </td>     
		     
		     <td>
		      <c:choose>
		      	<c:when test="${item.orders_status =='Preparing' }">
				  배송 준비중
		      	</c:when>
		      	<c:when test="${item.orders_status =='delivering' }">
		      	 배송중
		      	</c:when>
		      	<c:when test="${item.orders_status =='finished_delivering' }">
		      	 배송 완료
		      	</c:when>
		      	<c:when test="${item.orders_status =='cancel_order' }">
		      	 주문취소
		      	</c:when>
		      	<c:when test="${item.orders_status =='returning_goods' }">
		      	 반품 완료
		      	</c:when>
		      </c:choose>
		     </td>
		     
		     <td><%--배송 취소 기능 --%>
		      	<c:choose>
		      	 <c:when test="${item.orders_status='delivery_prepared' }">
		      	  <input type="button" onClick="fn_cancel_order('${item.orders_idx}')" value="주문취소"/>
		      	 </c:when>
		      	 <c:otherwise>
		      	  <input type="button" onClick="fn_cancel_order('${item.orders_idx}')" value="주문취소" disabled/> 
		      	 </c:otherwise>
		      	</c:choose>
		     </td>
		     
		     
		    </tr><%--실제 상품 row --%>
		 	</c:when>
		 	</c:choose>
		 	
			</c:forEach>
			
			</c:otherwise><%--주문 상품이 존재할 경우 --%>
		</c:choose> <%--주문상품 있냐 없냐 여부 --%> 
		</tbody>
	</table>


</body>
</html>