<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %><%--html body�±׸� �ݾ����� --%>
<head>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

//������ ���� �Է� or domain option ����
const domainListEl = document.querySelector('#domain-list')
const domainInputEl = document.querySelector('#domain-txt')
// select �ɼ� ���� ��

domainListEl.addEventListener('change', (event) => {
  // option�� �ִ� ������ ���� ��
  if(event.target.value !== "type") {
    // ������ �������� input�� �Է��ϰ� disabled
    domainInputEl.value = event.target.value
    domainInputEl.disabled = true
  } else { // ���� �Է� ��
    // input ���� �ʱ�ȭ & �Է� �����ϵ��� ����
    domainInputEl.value = ""
    domainInputEl.disabled = false
  }
})

//���� �ڵ�� �̸��� ������ ���õ����ش�.

<%--
window.onload=function()
{
  selectBoxInit();
}

function selectBoxInit(){

 var tel1='${memberInfo.tel1 }';
 var hp1='${memberInfo.hp1}';
 var selTel1 = document.getElementById('tel1');
 var selHp1 = document.getElementById('hp1');
 var optionTel1 = selTel1.options;
 var optionHp1 = selHp1.options;
 var val;
 for(var i=0; i<optionTel1.length;i++){
   val = optionTel1[i].value;
   if(tel1 == val){
	   optionTel1[i].selected= true;
    break;
   }
 }  
 
 for(var i=0; i<optionHp1.length;i++){
     val = optionHp1[i].value;
     if(hp1 == val){
    	 optionHp1[i].selected= true;
      break;
     }
   } 
 
}--%>
function fn_modify_member_info(attribute){
	var value;
	// alert(member_id);
	// alert("mod_type:"+mod_type);
		var frm_mod_member=document.frm_mod_member;
		
		
		if(attribute=='members_password'){
			value=frm_mod_member.members_password.value;//frm_mod_member�� form�±� 
			//alert("member_pw:"+value);
		}
		else if(attribute=='members_nickname')
		{
			value=frm_mode_member.members_nickname.value;
		}
		else if(attribute=='tel')
		{
			var tel1=frm_mod_member.tel1;
			var tel2=frm_mod_member.tel2;
			var tel3=frm_mod_member.tel3;
			
			for(var i=0; tel1.length;i++){
			 	if(tel1[i].selected){
					value_tel1=tel1[i].value;
					break;
				} 
			}
			value_tel2=tel2.value;
			value_tel3=tel3.value;
			value=value_tel1+","+value_tel2+", "+value_tel3;
		}
		else if(attribute=='email')
		{
			var email1=frm_mod_member.email1;
			var email2=frm_mod_member.email2;
			
			value_email1=email1.value;
			value_email2=email2.value;
			value=value_email1+","+value_email2;
			//alert(value);
		}
		else if(attribute=='address')
		{
			var address1=frm_mod_member.address1;
			var address2=frm_mod_member.address2;
			
			value_address1=address1.value;
			value_address2=address2.value;
			value=value_address1+","+value_address2;
		}
		console.log(attribute);
	 
		$.ajax({
			type : "post",
			async : false, //false�� ��� ��������� ó���Ѵ�.
			url : "${contextPath}/mypage/modifyMyInfo.do",
			data : {
				attribute:attribute,
				value:value,
			},
			success : function(data, textStatus) {
				if(data.trim()=='mod_success'){
					alert("ȸ�� ������ �����߽��ϴ�.");
				}else if(data.trim()=='failed'){
					alert("�ٽ� �õ��� �ּ���.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("������ �߻��߽��ϴ�."+data);
			},
			complete : function(data, textStatus) {
				//alert("�۾����Ϸ� �߽��ϴ�");
				
			}
		}); //end ajax
}
</script>
</head>
<body>
<h3>�� �� ����</h3>
 <form name="frm_mod_member">
  <div id="detail_table">
   <table>
   	<tbody>
   	
   	 <tr class="dot_line">
   	  <td class="fixed_join">���̵�</td>
   	  <td><input name="members_idx" type="text" size="20" value="${memberInfo.members_idx }" disabled/></td>
   	  <%--memberInfo���� ���ε� ���ּ���--%>
   	  <td></td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">����Ʈ</td>
   	  <td><input name="members_points" type="number" size="20" value="${memberInfo.members_points }" disabled/></td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">�г���</td>
   	  <td><input name="members_nickname" type="text" size="20" value="${memberInfo.members_nickname}"/></td>
   	  <td><input type="button" value="����" onclick="fn_modify_member_info('members_nickname')"/></td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">��й�ȣ</td>
   	  <td><input name="members_password" type="password" size="20" value="${memberInfo.members_password }"/></td>
   	  <td><input type="button" value="����" onclick="fn_modify_member_info('members_password')"/></td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">�̸�</td>
   	  <td><input name="members_name" type="text" size="20" value="${memberInfo.members_name } disabled"/>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">��ȭ��ȣ</td>
   	  <td>
   	   <select name="tel1" id="tel1" >
   	    <option>����</option>
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">018</option>
		<option value="019">019</option>
   	   </select>
   	   
   	 
   	   -<input type="text" size=4 name="tel2" value="${memberInfo.members_phone_number.substring(3,7) }">
   	   -<input type="text" size=4 name="tel3" value="${memberInfo.members_phone_number.substring(7,11) }">
   	  </td>
   	  
   	  <td>
   	   <input type="button" value="����" onClick="fn_modify_member_info('tel')"/>
   	  </td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">�̸���<br>(e-mail)</td>
   	  
   	  <td>
   	  <%--@�������� �ɰ��� �Ѵ�. --%>
   	  <c:set var="origin_email" value="${memberInfo.members_email }"/>
   	  <c:set var="refined_email" value="${fn:split(origin_email,'@') }"/>
   	   
   	   <input type="text" name="email1" size=10 value="${refined_email[0] }"/> 
   	   @<input type="text" size=10 name="email2" id="domain-txt" value="${refined_email[1] }"/>
   	  
   	   <select name="select_email" id="domain-list" onChange="" title="�����Է�">
   	  
   	    <option value="non">�����Է�</option>
   	    <option value="hanmail.net">hanmail.net</option>
   	    <option value="naver.com">naver.com</option>
   	    <option value="yahoo.co.kr">yahoo.co.kr</option>
   	    <option value="hotmail.com">hotamil.com</option>
   	    <option value="paran.com">paran.com</option>
		<option value="nate.com">nate.com</option>
		<option value="google.com">google.com</option>
		<option value="gmail.com">gmail.com</option>
		<option value="empal.com">empal.com</option>
		<option value="korea.com">korea.com</option>
		<option value="freechal.com">freechal.com</option>
   	    
   	   </select>
   	  </td>
   	  
   	  <td>
   	  	<input type="button" value="���� " onClick="fn_modify_member_info('email')"/>
   	  </td> 
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">�ּ�</td>
   	  <td>
   	     �ּ� :<br><input type="text"  name="address1" size=5 value="${memberInfo.members_address }"><br><br>
   	     ���ּ� :<br><input type="text"  name="address2" size=5 value="${memberInfo.members_detailed_address}">
   	  </td>
   	 
   	  <td>
   	   <input type="button" value="����" onClick="fn_modify_member_info('address')"/>
   	  </td>
   	 </tr>
   	 
   	 
   	</tbody>
   </table>
  </div>
  	
</form>
</body>
</html>