<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>



<h1>��� ��Ȳ</h1>
 <div style = "text-decoration: underline">
  ${myorderdetail.orders_status }
 </div>
 
<h1>1. �ֹ� ������</h1>
<table class="list_view" style="width:80%">
 <tbody align=center>
  <tr style="background: #008080">
   <td>�ֹ� ��ȣ</td>
   <td>�ֹ� ����</td>
   <td>�����</td>
   <td>�ֹ���ǰ��</td>
   <td>����</td>
   <td>�ɼ�,������</td>
   <td>�ֹ��ݾ�</td>
   <td>��ۺ�</td>
   <td>�ֹ��ݾ��հ�</td>
   <td>����������</td>
   
  </tr>
 
  <tr>
   
   <td>${myorderdetail.orders_idx }</td>
   
   <td>${myorderdetail.orders_date }</td>
   
   <%--��ǰ �̹���(��ũ����) --%>
   <td class="godds_image">
    <a href="${contextPath }/products/productsDetail?products_idx=${myorderdetail.products_idx}">
    <%--������Ʈ �� resources������ ���� �̹��� �߰� --%>
     <IMG width="75" alt="" src="${contextPath }/thumbnails?products_idx=${myorderdetail.products_idx }&fileName=${myorderdetail.img_url }">
    </a>
    	dummy
   </td>
   
   <td><%--��ǰ �̸�(��ũ����) --%>
    <h2>
    <%--��ǰ �̸��� �޾ƿ��� ���� ���α����� ����ؾ��Ѵ� --%>
     <a href="${contextPath }/products/productsDetail?products_idx=${myorderdetail.products_idx}">${myorderdetail.products_name}</a>   
    </h2>
   </td>
   
   
	<td><%--���� --%>
	 <h4>${myorderdetail.quantity }��<h4>
	</td>
	
	<%--�ɼ� --%>
	<td>
	 <h2>${myorderdetail.color}</h2>
	 <br>
	 <h2>${myorderdetail.size_product }</h2>
	</td>
	
	<td><%--���� ���� --%>
	 <h2>${myorderdetail.products_price }</h2>
	</td>				
					
	<td><%--��ۺ� --%>
	 <h2>0��</h2>
	</td>
		
	<td><%--�ֹ��ݾ� �հ� (���� x ����) --%>
	 <h2>${myorderdetail.quantity * myorderdetail.products_price}�� </h2>
	</td>
			
	<td><%--������ ������ 5% --%>
	 <h2>${myorderdetail.quantity * myorderdetail.products_price*0.05}��</h2>
	</td>		
	
  </tr>
  
 </tbody>
</table>
<h1>2.����� ���� �� �ֹ��� ����</h1>
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
	  ${myorderdetail.orders_recipient_name }
	 </td>
	</tr>
	
	<tr class="dot_line">
	 <td class="fixed_join">�޴�����ȣ</td>
	 <td>
	  ${myorderdetail.orders_recipient_phone }
	 </td>
	</tr>


	<tr class="dot_line">
	 <td class="fixed_join">�ּ�</td>
	 <td>
	  ${myorderdetail.orders_recipient_address}
	 </td>
	 </tr>
	 
	<tr class="dot_line">
	 <td class="fixed_join">���ּ�</td>
	 <td>
	  ${myorderdetail.orders_detailed_address}
	 </td>
    </tr>

	 
   </tbody>
  </table>
		
 </div>



</body>
</html>