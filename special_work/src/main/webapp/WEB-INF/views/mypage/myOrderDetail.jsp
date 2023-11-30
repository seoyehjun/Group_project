<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>


<h1>배송 현황</h1>
 <div>
 
 </div>
<h1>1. 주문 상세정보</h1>
<table class="list_view">
 <tbody align=center>
  <tr style="background: #33ff00">
   <td>주문 번호</td>
   <td>주문 일자</td>
   <td colspan=2 clas="fixed">주문상품명</td>
   <td>수량</td>
   <td>주문금액</td>
   <td>배송비</td>
   <td>주문금액합계</td>
   <td>예상적립금</td>
   
  </tr>
 
 <c:forEach var="item" items="${myOrderList }">
  <tr>
   
   <td>${item.orders_idx }</td>
   
   <td>${item.orders_date }</td>
   
   <%--상품 이미지(링크연결) --%>
   <td class="godds_image">
    <a href="${contextPath }/products/productsDetail?products_idx=${item.products_idx}">
    <%--프로젝트 내 resources폴더에 공백 이미지 추가 --%>
     <IMG width="75" alt="" src="${contextPath }/thumbnails?products_idx=${item.products_idx }&fileName=${item.products_image_url }">
    </a>
   </td>
   
   <td><%--상품 이름(링크연결) --%>
    <h2>
    <%--상품 이름을 받아오기 위해 조인구문을 사용해야한다 --%>
     <a href="${contextPath }/products/productsDetail?products_idx=${item.orders_idx}">${item.products_name}</a>   
    </h2>
   </td>
   
   
	<td><%--수량 --%>
	 <h2>${item.orders_total_quantity }개<h2>
	</td>
	
	<td><%--개당 가격 --%>
	 <h2>${item.proudcts_price }</h2>
	</td>				
					
	<td><%--배송비 --%>
	 <h2>0원</h2>
	</td>
		
	<td><%--주문금액 합계 (가격 x 수량) --%>
	 <h2>${item.orders_total_quantity *item.products_price}원 </h2>
	</td>
			
	<td><%--적립은 가격의 5% --%>
	 <h2>${item.order_total_quantity *item.products_price*0.05}원</h2>
	</td>		
	
  </tr>
  
 </c:forEach>
 </tbody>
</table>
<h1>2.배송지 정보</h1>
 <div class="detail_table">
  <table>
   <tbody>
   
    <tr class="dot_line">
	 <td class="fixed_join">배송방법</td>
	  <td>
	      일반 택배<%--일반 택배로 고정 --%>
	  </td>
	</tr>
	
	<tr class="dot_line">
	 <td class="fixed_join">받으실 분</td>
	 <td>
	  ${myOrderList[0].members_name }
	 </td>
	</tr>
	
	<tr class="dot_line">
	 <td class="fixed_join">휴대폰번호</td>
	 <td>
	  ${myOrderList[0].members_phone_number }
	 </td>
	</tr>
	
	<tr class="dot_line">
	 <td class="fixed_join">유선전화(선택)</td>
	 <td>
	  ${myOrderList[0].receiver_tel1}-${myOrderList[0].receiver_tel2}-${myOrderList[0].receiver_tel3}
	 </td>
	</tr>


	<tr class="dot_line">
	 <td class="fixed_join">주소</td>
	 <td>
	  ${myOrderList[0].orders_recipient_address}
	 </td>
	 </tr>
	 
	<tr class="dot_line">
	 <td class="fixed_join">상세주소</td>
	 <td>
	  ${myOrderList[0].orders_detailed_address}
	 </td>
    </tr>
    
	<tr class="dot_line">
	 <td class="fixed_join"></td>
	 <td>
	  ${myOrderList[0].gift_wrapping}
	 </td>
	 </tr>
	 
   </tbody>
  </table>
		
 </div>



</body>
</html>