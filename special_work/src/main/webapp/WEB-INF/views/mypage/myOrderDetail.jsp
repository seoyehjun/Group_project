<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>

<h1>1. 주문 상세정보</h1>
<table class="list_view">
 <tbody align=center>
  <tr style="background: #33ff00">
   <td>주문 번호</td>
   <td>주문 일자</td>
   <td colspan=2 clas="fixed">주문상품평</td>
   <td>수량</td>
   <td>주문금액</td>
   <td>예상적립금</td>
   <td>주문금액합계</td>
  </tr>
 </tbody>
 <c:forEach var="item" items="${myOrderList }">
  <tr>
   <td>${item.orders_idx }</td>
   <td>${item.orders_date }</td>
   
   <td class="godds_image">
    <a href="${contextPath }/goods/goodsDetail?good_id=${items.goods_id">
     <img class="link" alt="" src="${contextPath }/resources/image/1px.gif">
    </a>
   </td>
  </tr>
 </c:forEach>
</table>


</body>
</html>