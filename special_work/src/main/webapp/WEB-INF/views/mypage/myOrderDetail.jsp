<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>


<h1>��� ��Ȳ</h1>
 <div>
 
 </div>
<h1>1. �ֹ� ������</h1>
<table class="list_view">
 <tbody align=center>
  <tr style="background: #33ff00">
   <td>�ֹ� ��ȣ</td>
   <td>�ֹ� ����</td>
   <td colspan=2 clas="fixed">�ֹ���ǰ��</td>
   <td>����</td>
   <td>�ֹ��ݾ�</td>
   <td>��ۺ�</td>
   <td>�ֹ��ݾ��հ�</td>
   <td>����������</td>
   
  </tr>
 
 <c:forEach var="item" items="${myOrderList }">
  <tr>
   
   <td>${item.orders_idx }</td>
   
   <td>${item.orders_date }</td>
   
   <%--��ǰ �̹���(��ũ����) --%>
   <td class="godds_image">
    <a href="${contextPath }/products/productsDetail?products_idx=${item.products_idx}">
    <%--������Ʈ �� resources������ ���� �̹��� �߰� --%>
     <IMG width="75" alt="" src="${contextPath }/thumbnails?products_idx=${item.products_idx }&fileName=${item.products_image_url }">
    </a>
   </td>
   
   <td><%--��ǰ �̸�(��ũ����) --%>
    <h2>
    <%--��ǰ �̸��� �޾ƿ��� ���� ���α����� ����ؾ��Ѵ� --%>
     <a href="${contextPath }/products/productsDetail?products_idx=${item.orders_idx}">${item.products_name}</a>   
    </h2>
   </td>
   
   
	<td><%--���� --%>
	 <h2>${item.orders_total_quantity }��<h2>
	</td>
	
	<td><%--���� ���� --%>
	 <h2>${item.proudcts_price }</h2>
	</td>				
					
	<td><%--��ۺ� --%>
	 <h2>0��</h2>
	</td>
		
	<td><%--�ֹ��ݾ� �հ� (���� x ����) --%>
	 <h2>${item.orders_total_quantity *item.products_price}�� </h2>
	</td>
			
	<td><%--������ ������ 5% --%>
	 <h2>${item.order_total_quantity *item.products_price*0.05}��</h2>
	</td>		
	
  </tr>
  
 </c:forEach>
 </tbody>
</table>
<h1>2.����� ����</h1>
 <div class="detail_table">
  <table>
   <tbody>
   
    <tr class="dot_line">
	 <td class="fixed_join">��۹��</td>
	  <td>
	      �Ϲ� �ù�<%--�Ϲ� �ù�� ���� --%>
	  </td>
	</tr>
	
	<tr class="dot_line">
	 <td class="fixed_join">������ ��</td>
	 <td>
	  ${myOrderList[0].members_name }
	 </td>
	</tr>
	
	<tr class="dot_line">
	 <td class="fixed_join">�޴�����ȣ</td>
	 <td>
	  ${myOrderList[0].members_phone_number }
	 </td>
	</tr>
	
	<tr class="dot_line">
	 <td class="fixed_join">������ȭ(����)</td>
	 <td>
	  ${myOrderList[0].receiver_tel1}-${myOrderList[0].receiver_tel2}-${myOrderList[0].receiver_tel3}
	 </td>
	</tr>


	<tr class="dot_line">
	 <td class="fixed_join">�ּ�</td>
	 <td>
	  ${myOrderList[0].orders_recipient_address}
	 </td>
	 </tr>
	 
	<tr class="dot_line">
	 <td class="fixed_join">���ּ�</td>
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