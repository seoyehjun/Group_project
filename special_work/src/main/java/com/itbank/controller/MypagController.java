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
		
		//�Ʒ� ���ڵ� ������ �ٸ������� ���ǿ� memberInfo��� �̸����� MemberVO�����͸� ���ε� �س����� �����ȴ�.
		MemberVO temp_member = myPageService.givememember(3);
		httpsession.setAttribute("memberInfo", temp_member);//�ٸ� ������ �̹� ���ε� �س������� ���� ���ε� �� �ʿ�� ������
		
		return "mypage/myDetailInfo";
	}
	
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
	public String modifyMyInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value, Model model,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		Map<Object,Object> memberMap=new HashMap<Object,Object>();
		String val_list[]=null;
		HttpSession session=request.getSession();
		
		//�Ʒ� 3�ڵ�� �ʿ� member_idx ���� �ֱ� ���� ����
		MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
		System.out.println("Members_idx: "+memberVO.getMembers_idx());
		System.out.println("74line");
		//MemberVO memberVO = myPageService.givememember("memberInfo");//���� �޾ƿ��� �������ڵ�
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
		
		memberMap.put("members_idx", member_idx);//�����ϰ����ϴ� �ٸ� �����Ϳ� ������ �Բ�����
		//members_idx ���� ����ã���� 5�ð� �ɸ�(int������ �Ѱ����  mapper���� ���� �Ȼ���)
		
		//������ ȸ�� ������ �ٽ� ���ǿ� �����Ѵ�.
		memberVO=(MemberVO)myPageService.modifyMyInfo(memberMap);//���� ��ģ �� memberVO 
		session.removeAttribute("memberInfo");//���� ���ε�1
		session.setAttribute("memberInfo", memberVO);//���� ���ε�2
		
		return "mypage/myDetailInfo";
		/*String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;*/
	}	
}
