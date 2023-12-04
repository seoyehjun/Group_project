<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %><%--html body태그만 닫아주자 --%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<head>
<script>


window.onload=function()
{
	selectBoxInit();//select태그 기본값 정하는 함수	
}

function selectBoxInit()
{
	
	var temp = '<c:out value='${memberInfo.members_phone_number}'/>';//바인딩된 정보 가져온다.
	var origin_selected_tel = '${memberInfo.members_phone_number.substring(0,3)}';
	var user_selected_tel = document.getElementById('tel1');
	var tel_list = user_selected_tel.options;
	var val;
	for(var i=0; i<tel_list.length;i++)
	{
		val = tel_list[i].value;
		if(origin_selected_tel == val)
		{
			tel_list[i].selected = true;
			break;
		}
	}
}

function fn_modify_member_info(attribute){
	var value;
	// alert(member_id);
	// alert("mod_type:"+mod_type);
		var frm_mod_member=document.frm_mod_member;
		
		if(attribute=='members_password'){
			value=frm_mod_member.members_password.value;//frm_mod_member는 form태그 
			//alert("member_pw:"+value);
		}
		else if(attribute=='members_nickname')
		{
			value=frm_mod_member.members_nickname.value;
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
			value=value_tel1+","+value_tel2+","+value_tel3;
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
		
		
		//jQuery는 2006년 미국의 존 레식(John Resig)이 뉴욕시 바캠프(Barcamp)에서 처음 소개한 ‘자바 스크립트 라이브러리’입니다.
		//ajax는 jQuery 기능이다.
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/mypage/modifyMyInfo.do",
			data : {
				attribute:attribute,
				value:value,
			},
			success : function(data, textStatus) {
				if(data.trim()=='mod_success'){
					alert("회원 정보를 수정했습니다.");
				}else if(data.trim()=='failed'){
					alert("다시 시도해 주세요.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax
}
</script>
</head>
<body>
<h3>내 상세 정보</h3>
 <form name="frm_mod_member">
  <div id="detail_table">
   <table>
   	<tbody>
   	
   	 <tr class="dot_line">
   	  <td class="fixed_join">아이디</td>
   	  <td><input name="members_idx" type="text" size="20" value="${memberInfo.members_id }" disabled/></td>
   	  <%--memberInfo세션 바인딩 해주세요--%>
   	  <td></td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">포인트</td>
   	  <td><input name="members_points" type="number" size="20" value="${memberInfo.members_points }" disabled/></td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">닉네임</td>
   	  <td><input name="members_nickname" type="text" size="20" value="${memberInfo.members_nickname}"/></td>
   	  <td><input type="button" value="수정" onclick="fn_modify_member_info('members_nickname')"/></td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">비밀번호</td>
   	  <td><input name="members_password" type="password" size="20" value="${memberInfo.members_password }"/></td>
   	  <td><input type="button" value="수정" onclick="fn_modify_member_info('members_password')"/></td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">이름</td>
   	  <td><input name="members_name" type="text" size="20" value="${memberInfo.members_name }" disabled/>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">전화번호</td>
   	  <td>
   	   <select name="tel1" id="tel1" >
   	    <option>없음</option>
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">018</option>
		<option value="019">019</option>
   	   </select>
   	   
   	 
   	  <%--@기준으로 쪼개야 한다. --%>
   	  <c:set var="origin_tel" value="${memberInfo.members_phone_number }"/>
   	  <c:set var="refined_tel" value="${fn:split(origin_tel,'-') }"/>
   	   -<input type="text" size=4 name="tel2" value="${refined_tel[1] }">
   	   -<input type="text" size=4 name="tel3" value="${refined_tel[2] }">
   	  </td>
   	  
   	  <td>
   	   <input type="button" value="수정" onClick="fn_modify_member_info('tel')"/>
   	  </td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">이메일<br>(e-mail)</td>
   	  
   	  <td>
   	  <%--@기준으로 쪼개야 한다. --%>
   	  <c:set var="origin_email" value="${memberInfo.members_email }"/>
   	  <c:set var="refined_email" value="${fn:split(origin_email,'@') }"/>
   	   
   	   <input type="text" name="email1" size=10 value="${refined_email[0] }"/> 
   	   @<input type="text" size=10 name="email2" id="domain-txt" value="${refined_email[1] }"/>
   	  
   	   <select name="select_email" id="domain-list" onChange="" title="직접입력">
   	  
   	    <option value="non">직접입력</option>
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
   	  	<input type="button" value="수정 " onClick="fn_modify_member_info('email')"/>
   	  </td> 
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">주소</td>
   	  <td>
   	     주소 :<br><input type="text"  name="address1" size=10 value="${memberInfo.members_address }"><br><br>
   	     상세주소 :<br><input type="text"  name="address2" size=20 value="${memberInfo.members_detailed_address}">
   	  </td>
   	 
   	  <td>
   	   <input type="button" value="수정" onClick="fn_modify_member_info('address')"/>
   	  </td>
   	 </tr>
   	 
   	 
   	</tbody>
   </table>
  </div>
  	
</form>
</body>


<script>
//도메인 직접 입력 or domain option 선택
const domainListEl = document.querySelector('#domain-list')
const domainInputEl = document.querySelector('#domain-txt')
// select 옵션 변경 시
domainListEl.addEventListener('change', (event) => {
  // option에 있는 도메인 선택 시
  
  if(event.target.value !== "non") {
    // 선택한 도메인을 input에 입력하고 disabled
    domainInputEl.value = event.target.value
    domainInputEl.disabled = true
  } else { // 직접 입력 시
    // input 내용 초기화 & 입력 가능하도록 변경
    domainInputEl.value = ""
    domainInputEl.disabled = false
  }
})
</script>
</html>