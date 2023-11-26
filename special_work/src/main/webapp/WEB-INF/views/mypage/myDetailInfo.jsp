<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../header.jsp" %><%--html body태그만 닫아주자 --%>
<head>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

//도메인 직접 입력 or domain option 선택
const domainListEl = document.querySelector('#domain-list')
const domainInputEl = document.querySelector('#domain-txt')
// select 옵션 변경 시
domainListEl.addEventListener('change', (event) => {
  // option에 있는 도메인 선택 시
  if(event.target.value !== "type") {
    // 선택한 도메인을 input에 입력하고 disabled
    domainInputEl.value = event.target.value
    domainInputEl.disabled = true
  } else { // 직접 입력 시
    // input 내용 초기화 & 입력 가능하도록 변경
    domainInputEl.value = ""
    domainInputEl.disabled = false
  }
})
//이위 코드는 이메일 도메인 선택도와준다.
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('roadAddress').value = fullRoadAddr;
            document.getElementById('jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}


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
 
}
function fn_modify_member_info(attribute){
	var value;
	// alert(member_id);
	// alert("mod_type:"+mod_type);
		var frm_mod_member=document.frm_mod_member;
		
		
		if(attribute=='member_pw'){
			value=frm_mod_member.member_pw.value;//frm_mod_member는 form태그 
			//alert("member_pw:"+value);
		}else if(attribute=='tel'){
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
		}else if(attribute=='hp'){
			var hp1=frm_mod_member.hp1;
			var hp2=frm_mod_member.hp2;
			var hp3=frm_mod_member.hp3;
			var smssts_yn=frm_mod_member.smssts_yn;
			
			for(var i=0; hp1.length;i++){
			 	if(hp1[i].selected){
					value_hp1=hp1[i].value;
					break;
				} 
			}
			value_hp2=hp2.value;
			value_hp3=hp3.value;
			value_smssts_yn=smssts_yn.checked;
			value=value_hp1+","+value_hp2+", "+value_hp3+","+value_smssts_yn;
		}else if(attribute=='email'){
			var email1=frm_mod_member.email1;
			var email2=frm_mod_member.email2;
			var emailsts_yn=frm_mod_member.emailsts_yn;
			
			value_email1=email1.value;
			value_email2=email2.value;
			value_emailsts_yn=emailsts_yn.checked;
			value=value_email1+","+value_email2+","+value_emailsts_yn;
			//alert(value);
		}else if(attribute=='address'){
			var zipcode=frm_mod_member.zipcode;
			var roadAddress=frm_mod_member.roadAddress;
			var jibunAddress=frm_mod_member.jibunAddress;
			var namujiAddress=frm_mod_member.namujiAddress;
			
			value_zipcode=zipcode.value;
			value_roadAddress=roadAddress.value;
			value_jibunAddress=jibunAddress.value;
			value_namujiAddress=namujiAddress.value;
			value=value_zipcode+","+value_roadAddress+","+value_jibunAddress+","+value_namujiAddress;
		}
		console.log(attribute);
	 
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
   	  <td><input name="member_id" type="text" size="20" value="${memberInfo }" disabled/></td>
   	  <%--memberInfo세션 바인딩 해주세요--%>
   	  <td></td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">포인트</td>
   	  <td><input name="member_poin" type="number" size="20" value="${memberInfo.members_points }" disabled/></td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">닉네임</td>
   	  <td><input name="member_nick" type="text" size="20" value="${memberInfo.members_nickname}"/></td>
   	  <td><input type="button" value="수정" onclick="fn_modify_member_info('member_nick')"/></td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">비밀번호</td>
   	  <td><input name="member_pw" type="password" size="20" value="${memberInfo.member_pw }"/></td>
   	  <td><input type="button" value="수정" onclick="fn_modify_member_info('member_nick')"/></td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">이름</td>
   	  <td><input name="member_name" type="text" size="20" value="${memberInfo.member_name } disabled"/>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">전화번호</td>
   	  <td>
   	   <select name="tell" id="tell">
   	    <option>없음</option>
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
   	   <input type="button" value="수정" onClick="fn_modify_member_info('tel')"/>
   	  </td>
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">이메일<br>(e-mail)</td>
   	  
   	  <td>
   	  <%--@기준으로 쪼개야 한다. --%>
   	  <c:set var="origin_email" value="${memberInfo.members_email }"/>
   	  <c:set var="refined_email" value="${fn:split(origin_email,'@') }"/>
   	   
   	   <input type="text" name="email" size=10 value="${refined_email[0] }"/> 
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
   	  	<input type="button" value="수정하기 " onClick="fn_modify_member_info('email')"/>
   	  </td> 
   	 </tr>
   	 
   	 <tr class="dot_line">
   	  <td class="fixed_join">주소</td>
   	  <td>
   	     주소 :<br><input type="text"  name="address" size=5 value="${memberInfo.address }"><br><br>
   	     상세주소 :<br><input type="text"  name="address" size=5 value="${memberInfo.members_detailed_address}">
   	  </td>
   	 
   	  <td>
   	   <input type="button" value="수정하기" onClick="fn_modify_member_info('address')"/>
   	  </td>
   	 </tr>
   	 
   	 
   	</tbody>
   </table>
  </div>
  	
</form>
</body>
</html>