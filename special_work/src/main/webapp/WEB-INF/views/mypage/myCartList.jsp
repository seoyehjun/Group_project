<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>

<style>
 	td
 	{
 		padding-left: 30px;
 		padding-right: 30px;
 	}
</style>
<table>
 <tbody>
  <tr style="background: #008080">
  				<td>썸네일</td>
				<td>상품명</td>
				<td>가격</td>
				<td>옵션</td>
				<td>수량</td>
			</tr>
 
  <c:forEach var="cart" items="${ mycartlist }" >
   <tr>  
    <%--상품 이미지(상품 상세로 링크연결) --%>
    <td class="godds_image">
     <a href="${contextPath }/products/productsDetail?products_idx=${myorderdetail.products_idx}">
     
     <IMG width="75" alt="" src="${contextPath }/thumbnails?products_idx=${myorderdetail.products_idx }&fileName=${myorderdetail.img_url }">
     </a>
    </td>
    
    <%--상품 이름 --%>
    <td>
     <span>
      ${cart.products_name }
     </span>
    </td>
    
    <%--상품 가격 --%>
    <td>
     <span>
      ${cart.products_price }
     </span>
    </td>
    
    <%--상품 사이즈 칼라 --%>
    <td>
     <span>
      ${cart.color }
      <br>
      ${cart.size_product }
     </span>
    </td>
    
    <%--상품 갯수 --%>
    <td>
     <span>
      ${cart.quantity }개
     </span>
    </td>
    
    
   </tr>
  
  </c:forEach>
 </tbody>
</table>

</body>
</html>