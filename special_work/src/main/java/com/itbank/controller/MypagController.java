package com.itbank.controller;

import net.coobird.thumbnailator.Thumbnails;//pom파일에 의존성 추가해줘야한다. 

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
	
	private OrderVO orderVO;//session에서 get해온다.
	//private MemberVO memberVO;
	
	@RequestMapping(value = "/myPageMain", method = RequestMethod.GET)//orderlist바인딩 ,  세션으로부터 memberVO에 정보 바인딩
	public String myPageMain(Model model, HttpSession httpsession
			,HttpServletRequest request)throws Exception
	{
		ModelAndView mav = new ModelAndView();
		//memberVO = (MemberVO)httpsession.getAttribute("memberInfo");
		//String members_idx = memberVO.getMembers_idx()+"";//VO 구현해라
		
		List<O_P_OD_vo> myOrderList = myPageService.listMyOrderGoods("2");//로그인 구현되면 위 두줄 주석 풀고 members_idx받아오면 된다. 
		System.out.println(myOrderList.get(0).getOrders_idx());//테스트 코드이다 지워도됨...
		httpsession.setAttribute("myOrderList", myOrderList);//myPageMain에 보낼 정보 바인딩
		//mav.setViewName("mypage/myPageMain");//controller사용하면서 경로이름 반환으로 변경
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
	
	// Model and View 와 ResponseEntity의 차이에 대한 글
	// https://velog.io/@dhk22/Spring-MVC-4-Response-ViewResolver-ModelAndView-ResponseEntity-Response-Json-ing
	// https://velog.io/@wonizizi99/TIL-22.12.19-3Tier-controller-%EC%99%80RestController%EB%8F%99%EC%9E%91%EC%9B%90%EB%A6%AC-ResponseEntity-Httpstatus
	// https://m.blog.naver.com/nsqfrnidzb/222437153414 RestController에서  ResponseEntity로의 진화
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value, Model model,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception 
	{
		
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
		
		//리스트 불러오는 구문(조인해서 구현해라)
		httpsession.setAttribute("list", 조인결과물 바인딩해라);
		
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
		//CURR_IMAGE_REPO_PATH경로 아래에
		//goods_id해당 상품의 id(폴더이름) ,  fileName은 해당 상품의파일이름(이미지)
		//를 만들어주면 이미지가 뜬다. 
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
