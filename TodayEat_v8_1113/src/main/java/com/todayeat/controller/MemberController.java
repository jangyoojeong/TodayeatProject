package com.todayeat.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.todayeat.member.MemberService;
import com.todayeat.member.MemberVO;

@Controller
public class MemberController {

	@Resource(name="MemberService")
	 
	private MemberService memberService;
	
	/*회원가입*/
	
	@RequestMapping(value = "join.do", method = RequestMethod.GET) 
	public String join() {
		
		return "member/join";
	}
	
	 @RequestMapping(value = "join.do", method = RequestMethod.POST)
	   public String joinMember(MemberVO mvo) {
		 System.out.println(mvo);
		 
		 memberService.joinMember(mvo);
		
	      return "redirect:/";   
	   }
	 
	 /*로그인*/
	 
	 @RequestMapping(value = "login.do", method = RequestMethod.GET) 
		public String login() {
			return "member/login";
			
		}
	
	 @RequestMapping(value = "login-post", method = RequestMethod.POST)
		public void loginCheck(MemberVO mvo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
//		    boolean result = memberService.loginCheck(mvo);   
//		   
//		    HttpSession session = request.getSession();
//			if(result == true) {
//				System.out.println("성공");
//				session.setAttribute("login_id", mvo.getId());
//				session.setAttribute("login_pwd", mvo.getPassword());
//				response.sendRedirect("index.do");
//			} else {
//				response.sendRedirect("login.do");
//			}
		 
		    MemberVO result = memberService.loginCheck(mvo);   
		   
		    HttpSession session = request.getSession();
			if(result.getId()!=null && !result.getId().equals("")) {
				System.out.println("성공");
				session.setAttribute("login_id", result.getId());
				session.setAttribute("login_nickname", result.getNickname());
				session.setAttribute("login_pwd", result.getPassword());
				response.sendRedirect("index.do");
			} else {
				response.sendRedirect("login.do");
			}
		}
	 
	 /*마이페이지*/
	 
	 @RequestMapping(value = "Mypage_info.do", method = RequestMethod.GET) 
		public ModelAndView myPage_info(HttpServletRequest request, HttpServletResponse response) {
			
			HttpSession session = request.getSession();
			String login = (String) session.getAttribute("login_id");
			MemberVO mbvo = memberService.myPage_info(login);

			ModelAndView mav = new ModelAndView();
			mav.setViewName("mypage/Mypage_info");
			mav.addObject("mvo", mbvo);
			
			
			return mav;
		}
	 
	 /*로그아웃*/
	 
	@RequestMapping(value = "logout.do", method = RequestMethod.GET) 
	public String logout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/login.do";
	}
	 
	/*아이디 중복확인*/
	
	@RequestMapping(value = "confirmId.do", method = RequestMethod.GET) 
	public String confirmId(MemberVO mvo, Model model) {
		int x = memberService.confirmId(mvo);			
		if(x==1) {
			System.out.println("아이디성공 : 중복" );
			model.addAttribute("check_id", 1);
			model.addAttribute("s_id", mvo.getId());
		}else {
			System.out.println("아이디실패 : 중복아님");
			model.addAttribute("check_id", -1);
			model.addAttribute("s_id", mvo.getId());
		}
				
		return "member/confirmId";	
	}
	
	/*회원탈퇴*/
	
	@RequestMapping(value = "deleteId.do", method = RequestMethod.GET) 
	public ModelAndView dbPwd(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("login_id");
		MemberVO mbvo = memberService.dbPwd(login);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/deleteId");
		mav.addObject("mvo", mbvo);
		
		
		return mav;	
	}
	
	//회원 정보 수정
	@ResponseBody
	@RequestMapping(value = "updateMember.do", method = RequestMethod.POST) 
	//public ModelAndView updateMember(HttpServletRequest request, HttpServletResponse response) {
	public MemberVO updateMember(HttpServletRequest request, @RequestParam(value="updateNickname") String updateNickname,
			@RequestParam(value="updateEmail") String updateEmail) {
		
		HttpSession session = request.getSession();
		String _id = (String) session.getAttribute("login_id");
		
		MemberVO mbvo = new MemberVO();
		mbvo.setId(_id);
		mbvo.setNickname(updateNickname);
		mbvo.setEmail(updateEmail);
		
		return memberService.updateMember(mbvo);	
	}
	
	@RequestMapping(value = "updatePwd.do", method = RequestMethod.GET) 
	public ModelAndView up_Pwd(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("login_id");
		MemberVO mbvo = memberService.up_Pwd(login);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/updatePwd");
		mav.addObject("mvo", mbvo);
		
		
		return mav;	
	
	}
	
	@RequestMapping(value = "updatePwd.do", method = RequestMethod.POST) 
	public String updatePwd(MemberVO mvo, Model model, HttpSession session,
			HttpServletRequest req,HttpServletResponse response) throws IOException {	
		int x = 1;			
		String id = (String) session.getAttribute("login_id");
		String pwd = (String) session.getAttribute("login_pwd");
		String newPwd = req.getParameter("password1");
		mvo.setId(id);
		mvo.setPassword(pwd);
		memberService.updatePwd(mvo, newPwd);
	
		if( x== 1) {
			System.out.println("변경 성공");		
			System.out.println(newPwd);
			session.invalidate();
			return "index.do";	
		}else {
			System.out.println("한번 더 실패");			
			return "mypage/updatePwd";
		}
		
	}
	
	@RequestMapping(value = "deleteId.do", method = RequestMethod.POST) 
	public String deleteId(MemberVO mvo, Model model, HttpSession session,HttpServletResponse response) throws IOException {	
		int x = 0;			
		String id = (String) session.getAttribute("login_id");
		mvo.setId(id);
		x = memberService.deleteId(mvo);
	
		if( x== 1) {
			System.out.println("성공");		
			session.invalidate();
			return "index";	
		}else {
			System.out.println("ㅆㅂ");			
			return "mypage/deleteId";
		}
		
	}
	
	/*닉네임 중복확인*/
	
    @ResponseBody
	@RequestMapping(value = "/confirmNick.do", method = RequestMethod.POST) 
	public int confirmNick(MemberVO mvo) {
    	System.out.println(mvo.getNickname());
    	int result = 0;
    	  result = memberService.confirmNick(mvo);		
		
		if(result ==1) {
			System.out.println("닉네임성공 : 중복" );
			}		
		return result;	
	}
	
    /*아이디 찾기*/
    
	@RequestMapping(value = "idsearch.do", method = RequestMethod.GET) 
	public String idsearch() {
		
		return "member/idsearch";
	}
	
	@RequestMapping(value = "searchid", method = RequestMethod.POST)	
	public ModelAndView searchId(MemberVO mvo){
		System.out.println(mvo.getName());
		System.out.println(mvo.getEmail()); //값 받아오는지 확인
		MemberVO membervo = memberService.searchId(mvo);
		System.out.println(membervo.getId()); //값 받아오는지 확인
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/search_id");
		mv.addObject("s_id", membervo.getId());
		
		return mv;
	}
	
	/*비밀번호 찾기*/
	
	@RequestMapping(value = "pwdsearch.do", method = RequestMethod.GET) 
	public String pwdsearch() {
		
		return "member/pwdsearch";
	}
	
	@RequestMapping(value = "searchpwd", method = RequestMethod.POST)	
	public ModelAndView searchPwd(MemberVO mvo){
		System.out.println(mvo.getId());
		System.out.println(mvo.getName());
		System.out.println(mvo.getEmail()); //값 받아오는지 확인
		MemberVO membervo = memberService.searchPwd(mvo);
		System.out.println(membervo.getPassword()); //값 받아오는지 확인
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/search_pwd");
		mv.addObject("s_pwd", membervo.getPassword());
		
		return mv;
	}
	
	@RequestMapping(value = "upload_profile.do", method = RequestMethod.POST)
	@ResponseBody
	public String upload_photh(MultipartHttpServletRequest multipartRequest, HttpServletRequest req, MemberVO mvo) throws SQLException {
		String filePath = "C:\\TodayEat_img\\member_profile";
		String id = req.getParameter("id");
		
		System.out.println("컨트롤러 안:"+id);
		
		MultipartFile mfile = null;
		String uuid = null;
		String fileName = null;
		String fileType = null;
		String rfileName = null;
		String member_profile = null;
		
			mfile = multipartRequest.getFile("input_img");
			uuid = UUID.randomUUID().toString();
			fileName = mfile.getOriginalFilename();
			//System.out.println("기존 파일이름: "+fileName);
			fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
			rfileName = uuid+fileType;		
		
		File file = new File(filePath, rfileName);
		
		
		try {
			// getInputStream() : 업로드한 파일 데이터를 읽어오는 InputStream을 구한다.
			FileCopyUtils.copy(mfile.getInputStream(), new FileOutputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		member_profile = rfileName;
		
		memberService.upload_profile(id, member_profile);  
		
		
		return rfileName;
	}
	
	@RequestMapping(value = "del_profile.do", method = RequestMethod.POST)
	@ResponseBody
	public String del_profile(HttpServletRequest req) throws SQLException {
		String id = req.getParameter("id");
		String result;
		
		result = memberService.del_profile(id);  
		
		
		return result;
	}
	
	
	/*마이페이지*/
	
/*	@RequestMapping(value = "Mypage_interest.do", method = RequestMethod.GET) 
	public String Mypage_interest() {
		
		return "mypage/Mypage_interest";
	}
	
	@RequestMapping(value = "Mypage_membership.do", method = RequestMethod.GET) 
	public String Mypage_membership() {
		
		return "mypage/Mypage_membership";
	}
	
	@RequestMapping(value = "Mypage_my.do", method = RequestMethod.GET) 
	public String Mypage_my() {
		
		return "mypage/Mypage_my";
	}*/

}
