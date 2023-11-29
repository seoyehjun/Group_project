package com.itbank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.vo.MemberVO;
import com.itbank.model.vo.OrderVO;
import com.itbank.service.MyPageService;

@Controller
@RequestMapping(value="/mypage")
public class MypagController
{	
	@Autowired 
	private MyPageService myPageService;
	
	private OrderVO orderVO;//session에서 get해온다.
	//private MemberVO memberVO;
	
	@RequestMapping(value = "/myPageMain", method = RequestMethod.GET)//orderlist바인딩 ,  세션으로부터 memberVO에 정보 바인딩
	public String myPageMain(Model model, HttpSession httpsession
			,HttpServletRequest request)throws Exception
	{
		ModelAndView mav = new ModelAndView();
		//memberVO = (MemberVO)httpsession.getAttribute("memberInfo");
		//String members_idx = memberVO.getMembers_idx()+"";//VO 구현해라
		
		List<OrderVO> myOrderList = myPageService.listMyOrderGoods("1");//오더 리스트 받아오는 함수 구현해라(위에서 받은 id를 토대로)
		
		mav.addObject("myOrderList", myOrderList);
		mav.setViewName("mypage/myPageMain");
		System.out.println("컨트롤러 실행됨");
		return "mypage/myPageMain";
	}
	@RequestMapping(value = "/myDetailInfo", method = RequestMethod.GET)//orderlist바인딩 ,  세션으로부터 memberVO에 정보 바인딩
	public String myDetailInfo(Model model, HttpSession httpsession
			,HttpServletRequest request)throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		//아래 두코드 두줄은 다른조원이 세션에 memberInfo라는 이름으로 MemberVO데이터를 바인딩 해놓으면 삭제된다.
		MemberVO temp_member = myPageService.givememember(3);
		httpsession.setAttribute("memberInfo", temp_member);//다른 조원이 이미 바인딩 해놓았으면 따로 바인딩 할 필요는 없을것
		
		return "mypage/myDetailInfo";
	}
	
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
	public String modifyMyInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value, Model model,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		Map<Object,Object> memberMap=new HashMap<Object,Object>();
		String val_list[]=null;
		HttpSession session=request.getSession();
		
		//아래 3코드는 맵에 member_idx 쌍을 넣기 위해 존재
		MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
		System.out.println("Members_idx: "+memberVO.getMembers_idx());
		System.out.println("74line");
		//MemberVO memberVO = myPageService.givememember("memberInfo");//세션 받아오면 삭제될코드
		String  member_idx=memberVO.getMembers_idx()+"";
		
		String temp;
		if(attribute.equals("tel"))
		{
			value=value.replaceAll(",","-");
			System.out.println("value:"+value);
			memberMap.put("members_phone_number",value);
		}
		else if(attribute.equals("email")){
			val_list=value.split(",");
			value = val_list[0]+"@"+val_list[1]; 
			memberMap.put("members_email",value);
		}
		else if(attribute.equals("address")){
			val_list=value.split(",");
			memberMap.put("members_address",val_list[0]);
			memberMap.put("members_detailed_address",val_list[1]);
		}
		else //password, nickname, 
		{
			memberMap.put(attribute,value);	
		}
		
		memberMap.put("members_idx", member_idx);//수정하고자하는 다른 데이터와 무조건 함께들어가는
		//members_idx 여기 오류찾느라 5시간 걸림(int형으로 넘겨줘야  mapper에서 오류 안생김)
		
		//수정된 회원 정보를 다시 세션에 저장한다.
		memberVO=(MemberVO)myPageService.modifyMyInfo(memberMap);//수정 마친 후 memberVO 
		session.removeAttribute("memberInfo");//세션 업로드1
		session.setAttribute("memberInfo", memberVO);//세션 업로드2
		
		return "mypage/myDetailInfo";
		/*String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;*/
	}	
}
