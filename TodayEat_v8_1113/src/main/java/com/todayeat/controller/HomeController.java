package com.todayeat.controller;


import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.todayeat.recipe.service.RecipeService;
import com.todayeat.recipe.vo.RecipeVO;
import com.todayeat.tip.service.TipService;
import com.todayeat.tip.vo.TipVO;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	// 메인 화면
	@RequestMapping(value = {"/", "index.do"}, method = RequestMethod.GET) 
	public String main() {
		return "index"; 		
	}
	
	@RequestMapping(value = "uploadrecipe_view.do", method = RequestMethod.GET) 
	public String uploadrecipe() {
		
		return "recipe/uploadrecipe";
	}


}