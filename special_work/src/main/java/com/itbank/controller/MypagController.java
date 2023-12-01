package com.itbank.controller;

import net.coobird.thumbnailator.Thumbnails;//pom���Ͽ� ������ �߰�������Ѵ�. 

import java.io.File;
import java.io.OutputStream;
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
import com.itbank.model.vo.O_P_OD_vo;
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
		
		List<O_P_OD_vo> myOrderList = myPageService.listMyOrderGoods("2");//�α��� �����Ǹ� �� ���� �ּ� Ǯ�� members_idx�޾ƿ��� �ȴ�. 
		System.out.println(myOrderList.get(0).getOrders_idx());//�׽�Ʈ �ڵ��̴� ��������...
		httpsession.setAttribute("myOrderList", myOrderList);//myPageMain�� ���� ���� ���ε�
		//mav.setViewName("mypage/myPageMain");//controller����ϸ鼭 ����̸� ��ȯ���� ����
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
	
	// Model and View �� ResponseEntity�� ���̿� ���� ��
	// https://velog.io/@dhk22/Spring-MVC-4-Response-ViewResolver-ModelAndView-ResponseEntity-Response-Json-ing
	// https://velog.io/@wonizizi99/TIL-22.12.19-3Tier-controller-%EC%99%80RestController%EB%8F%99%EC%9E%91%EC%9B%90%EB%A6%AC-ResponseEntity-Httpstatus
	// https://m.blog.naver.com/nsqfrnidzb/222437153414 RestController����  ResponseEntity���� ��ȭ
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value, Model model,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception 
	{
		
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
		
		//return "mypage/myPageMain";
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	/*
	@RequestMapping(value="/myOrderDetail" ,method = RequestMethod.GET)
	public String myOrderDetail(HttpSession httpsession, Model model )
	{
		MemberVO sessionowner = (MemberVO)httpsession.getAttribute("memberInfo");
		
		//����Ʈ �ҷ����� ����(�����ؼ� �����ض�)
		httpsession.setAttribute("list", ���ΰ���� ���ε��ض�);
		
		return "/mypage/myOrderDetail";
	}
	*/
	
	
	private static String CURR_IMAGE_REPO_PATH = "C:\\shopping\\file_repo";
	
	@RequestMapping("/thumbnails")
	protected void thumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+fileName;
		//CURR_IMAGE_REPO_PATH��� �Ʒ���
		//goods_id�ش� ��ǰ�� id(�����̸�) ,  fileName�� �ش� ��ǰ�������̸�(�̹���)
		//�� ������ָ� �̹����� ���. 
		File image=new File(filePath);
		
		
		if (image.exists()) { 
			//https://yermi.tistory.com/entry/Library-%EC%9E%90%EB%B0%94Java%EC%97%90%EC%
			//84%9C-%EC%8D%B8%EB%84%A4%EC%9D%BC-%EC%9D%B4%EB%AF%B8%EC%A7%80
			//-%EB%A7%8C%EB%93%A4%EA%B8%B0-%EC%8D%B8%EB%84%A4%EC%9D%BC-%EB%9
			//D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC-Thumbnailator
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}

	
}
