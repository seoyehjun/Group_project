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
  				<td>�����</td>
				<td>��ǰ��</td>
				<td>����</td>
				<td>�ɼ�</td>
				<td>����</td>
			</tr>
 
  <c:forEach var="cart" items="${ mycartlist }" >
   <tr>  
    <%--��ǰ �̹���(��ǰ �󼼷� ��ũ����) --%>
    <td class="godds_image">
     <a href="${contextPath }/products/productsDetail?products_idx=${myorderdetail.products_idx}">
     
     <IMG width="75" alt="" src="${contextPath }/thumbnails?products_idx=${myorderdetail.products_idx }&fileName=${myorderdetail.img_url }">
     </a>
    </td>
    
    <%--��ǰ �̸� --%>
    <td>
     <span>
      ${cart.products_name }
     </span>
    </td>
    
    <%--��ǰ ���� --%>
    <td>
     <span>
      ${cart.products_price }
     </span>
    </td>
    
    <%--��ǰ ������ Į�� --%>
    <td>
     <span>
      ${cart.color }
      <br>
      ${cart.size_product }
     </span>
    </td>
    
    <%--��ǰ ���� --%>
    <td>
     <span>
      ${cart.quantity }��
     </span>
    </td>
    
    
   </tr>
  
  </c:forEach>
 </tbody>
</table>

</body>
</html>