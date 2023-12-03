<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>

<table>
 <tbody>
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