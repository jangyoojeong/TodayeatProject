package com.todayeat.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.todayeat.recipe.vo.RecipeVO;
import com.todayeat.season.service.SeasonService;
import com.todayeat.season.vo.SeasonPage;
import com.todayeat.season.vo.SeasonVO;

@SessionAttributes({"season", "f1", "f2", "f3"})
@Controller
public class SeasonController {
	
	private int size = 5; //size는 원하는 갯수만큼, 한 화면에 게시글을 몇개 출력할건지 지정
	
	@Resource(name = "SeasonService")
	
	private SeasonService seasonService;
	
	@RequestMapping(value = "season_main.do", method = RequestMethod.GET) 
	public String sub2() {
		
		return "sub2_season/season_main";
	}
	
	@RequestMapping(value = "season_sub.do", method = RequestMethod.GET) 
	public String sub2_sub(Model model1, HttpServletRequest req) throws ClassNotFoundException, SQLException {
		
		String season = (String) req.getParameter("season");
		String f1 = (String) req.getParameter("f1");
		String f2 = (String) req.getParameter("f2");
		String f3 = (String) req.getParameter("f3");
		
		String pageNoVal = req.getParameter("pageNo"); //현재 보고있는 페이지 파라미터값으로 받음
	    ArrayList<RecipeVO> dumi_list = new ArrayList<RecipeVO>();
	    
		int pageNo = 1; //처음들어왔을때 1을 줘라
	    if(pageNoVal != null) { //null 이면 처음 들어왔을때 상태, null이 아니면 처음 들어온 상태가 아님(페이지 넘버를 파라미터로 넘긴 상태)
	         pageNo = Integer.parseInt(pageNoVal);
	    }
	      
	    int total = seasonService.Season_Search(f1, f2, f3);
	   
	    dumi_list = seasonService.paging((pageNo-1) * size, ((pageNo-1) * size)+size); //5개씩 잘라서 가져온 데이터를 저장
	    SeasonPage season_page = new SeasonPage(total, pageNo, size, dumi_list); //밑에 숫자 계산, 게시글이 몇개냐에 따라서 숫자를 몇개보여줄건지
		
	    System.out.println("더미 : " +dumi_list.size());
	    
	    SeasonVO sv = new SeasonVO();
	    sv = seasonService.seasonOneInfo(season);
	   
		model1.addAttribute("seasoninfo", sv);
		model1.addAttribute("season_page", season_page);
		model1.addAttribute("season", season);
		model1.addAttribute("f1", f1);
		model1.addAttribute("f2", f2);
		model1.addAttribute("f3", f3);
		
		return "sub2_season/season_sub";
	}

	
	
	
}
