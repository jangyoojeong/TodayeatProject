package com.todayeat.controller;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.todayeat.keep.service.KeepService;
import com.todayeat.keep.vo.KeepVO;

@Controller
public class KeepController {

	@Resource(name = "KeepService")
	
	private KeepService keepService;
	
	
	
//	@RequestMapping(value ="Mypage_info.do", method =RequestMethod.GET)
//	public String Mypage_info() {
//		
//		return "mypage/Mypage_info";
//	}
	
	@RequestMapping(value ="Mypage_interest.do", method =RequestMethod.GET)
	public String Mypage_interest() {
		
		return "mypage/Mypage_interest";
	}
	

	
	@RequestMapping(value ="Mypage_membership.do", method =RequestMethod.GET)
	public String Mypage_membership() {
		
		return "mypage/Mypage_membership";
	}
	
	
	@RequestMapping(value ="deleteKeep.do", method = RequestMethod.POST)
	public String deleteKeep(KeepVO vo1, Model model1, HttpServletRequest req) throws ClassNotFoundException, SQLException {
		
//System.out.println("&&"+vo1.getKeep_id_s());
		if(vo1.getKeep_id_s()!=null || vo1.getKeep_id_s().equals("")) {
		keepService.deleteKeep(vo1);
		return "redirect:listKeep.do";
		}
		
		return "redirect:listKeep.do";
	}
	
	
	   @RequestMapping(value ="insertKeep.do", method =RequestMethod.GET)
	   @ResponseBody
	   public String insertKeep(KeepVO vo1, Model model1) throws ClassNotFoundException, SQLException {
	      
	      int sw = keepService.insertKeep(vo1);
	      
	      if (sw == 0) {
	         return "1";
	      } else {
	         return "0";
	      }
	   }
	
	@RequestMapping(value ="listKeep.do", method =RequestMethod.GET)
	public String listKeep(KeepVO vo1, Model model1, HttpServletRequest req) throws ClassNotFoundException, SQLException{
		HttpSession session = req.getSession();
		String login_nickname = (String)session.getAttribute("login_nickname");
//		System.out.println("@@"+login_nickname);
//		System.out.println("@@@"+vo1.getNickname());
//		String login_nickname = req.getParameter("login_nickname");
		if(vo1.getNickname()==null || vo1.getNickname().equals("")) {
			vo1.setNickname(login_nickname);
		}
		model1.addAttribute("kList",keepService.listKeep(vo1));
		
		
		return "mypage/Mypage_interest";
	}
}
