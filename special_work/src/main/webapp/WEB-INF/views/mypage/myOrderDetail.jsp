<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %>

<h1>1. �ֹ� ������</h1>
<table class="list_view">
 <tbody align=center>
  <tr style="background: #33ff00">
   <td>�ֹ� ��ȣ</td>
   <td>�ֹ� ����</td>
   <td colspan=2 clas="fixed">�ֹ���ǰ��</td>
   <td>����</td>
   <td>�ֹ��ݾ�</td>
   <td>����������</td>
   <td>�ֹ��ݾ��հ�</td>
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