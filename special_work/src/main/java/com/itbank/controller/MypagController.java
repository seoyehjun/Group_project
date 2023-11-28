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
	
	private OrderVO orderVO;//session���� get�ؿ´�.
	//private MemberVO memberVO;
	
	@RequestMapping(value = "/myPageMain", method = RequestMethod.GET)//orderlist���ε� ,  �������κ��� memberVO�� ���� ���ε�
	public String myPageMain(Model model, HttpSession httpsession
			,HttpServletRequest request)throws Exception
	{
		ModelAndView mav = new ModelAndView();
		//memberVO = (MemberVO)httpsession.getAttribute("memberInfo");
		//String members_idx = memberVO.getMembers_idx()+"";//VO �����ض�
		
		List<OrderVO> myOrderList = myPageService.listMyOrderGoods("1");//���� ����Ʈ �޾ƿ��� �Լ� �����ض�(������ ���� id�� ����)
		
		mav.addObject("myOrderList", myOrderList);
		mav.setViewName("mypage/myPageMain");
		System.out.println("��Ʈ�ѷ� �����");
		return "mypage/myPageMain";
	}
	@RequestMapping(value = "/myDetailInfo", method = RequestMethod.GET)//orderlist���ε� ,  �������κ��� memberVO�� ���� ���ε�
	public String myDetailInfo(Model model, HttpSession httpsession
			,HttpServletRequest request)throws Exception
	{
		ModelAndView mav = new ModelAndView();
		MemberVO temp_member = myPageService.givememember("4");
		model.addAttribute("memberInfo",temp_member);
		//System.out.println("controller executed");
		return "mypage/myDetailInfo";
	}
	
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		Map<String,String> memberMap=new HashMap<String,String>();
		String val[]=null;
		HttpSession session=request.getSession();
		//MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
		MemberVO memberVO = myPageService.givememember("1");//���� �޾ƿ��� �������ڵ�
		String  member_idx=memberVO.getMembers_idx()+"";
		
		String temp;
		if(attribute.equals("tel"))
		{
			value.replace(",","");
			memberMap.put("members_phone_number",value);
		}
		else if(attribute.equals("email")){
			value.replace(",", "");
			memberMap.put("members_email",value);
		}
		else if(attribute.equals("address")){
			val=value.split(",");
			memberMap.put("members_address",val[0]);
			memberMap.put("members_detailed_address",val[1]);
		}
		else //password, nickname, 
		{
			memberMap.put(attribute,value);	
		}
		
		memberMap.put("members_idx", member_idx);
		
		//������ ȸ�� ������ �ٽ� ���ǿ� �����Ѵ�.
		memberVO=(MemberVO)myPageService.modifyMyInfo(memberMap);
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);//���� ���ε�
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}	
}
