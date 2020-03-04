package com.todayeat.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.todayeat.tip.service.TipService;
import com.todayeat.tip.vo.TipVO;

@Controller
public class TipController {

	@Resource(name = "TipService")
	
	private TipService tipService;

	
	@RequestMapping(value = "tip_main.do", method = RequestMethod.GET) 
	public String sub1(Model model1) throws ClassNotFoundException, SQLException {
		tipService.tipAllInfo();
		
		ArrayList<TipVO> tiplist = tipService.tipAllInfo();
		
		model1.addAttribute("tipinfo", tiplist);
		model1.addAttribute("tipnum", tiplist.size());
		return "sub1_tip/tip_main";
	}
	
	@RequestMapping(value = "tip_sub.do", method = RequestMethod.GET) 
	public String sub1_sub(Model model1, HttpServletRequest req) throws ClassNotFoundException, SQLException {
		
		String tname = (String) req.getParameter("tname");
		System.out.println("넘어온" + tname);
		
		model1.addAttribute("tipinfo1", tipService.tipOneInfo(tname));
		return "sub1_tip/tip_sub";
	}
	
	
}
