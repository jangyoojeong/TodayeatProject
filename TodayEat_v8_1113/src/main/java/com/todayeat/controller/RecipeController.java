package com.todayeat.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.todayeat.recipe.service.RecipeService;
import com.todayeat.recipe.vo.RecipeVO;


@Controller
public class RecipeController {
	
	String[] imsi_st_image = new String[30];
	RecipeVO rvo = new RecipeVO();
	private String imsi_complete_img;
	

	@Resource(name = "RecipeService")
	
	private RecipeService recipeService;

	
	@RequestMapping(value = "deleteRecipe.do", method = RequestMethod.GET)
	public String deleteRecipe(RecipeVO vo1, Model model1) throws ClassNotFoundException, SQLException {
		
		recipeService.deleteRecipe(vo1);
		
		return "index";
	}
	
	@RequestMapping(value = "searchOneRecipe.do", method = RequestMethod.GET)
	public String searchOneRecipe(RecipeVO vo1, Model model1) throws ClassNotFoundException, SQLException {
		
		model1.addAttribute("mRecipe", recipeService.searchOneRecipe(vo1));
		model1.addAttribute("mRecipe_material", recipeService.searchOneRecipe_material(vo1));
		model1.addAttribute("mRecipe_step", recipeService.searchOneRecipe_step(vo1));
		model1.addAttribute("mReply", recipeService.searchOneReply_Paging(vo1));
		
		return "recipe/recipe_view";
	}
	
	@RequestMapping(value = "searchOneReply_all.do", method = RequestMethod.GET)
	public String searchOneReply_all(RecipeVO vo1, Model model1) throws ClassNotFoundException, SQLException {
		
		
		model1.addAttribute("mRecipe", recipeService.searchOneRecipe(vo1));
		model1.addAttribute("mRecipe_material", recipeService.searchOneRecipe_material(vo1));
		model1.addAttribute("mRecipe_step", recipeService.searchOneRecipe_step(vo1));
		model1.addAttribute("mReply", recipeService.searchOneReply(vo1));
		
		return "recipe/recipe_view";
	}
	
	@RequestMapping(value = "upload_recipe.do", method = RequestMethod.GET)
	@ResponseBody
	public String uploadRecipe(RecipeVO vo1, HttpServletRequest req, Model model1) throws ClassNotFoundException, SQLException {
		
		
		int fo_nu = Integer.parseInt(req.getParameter("fo_nu"));
		int st_nu = Integer.parseInt(req.getParameter("st_nu"));
		
		
		String[] m_food = new String[fo_nu];
		String[] m_amo = new String[fo_nu];
		String[] s_no = new String[st_nu];
		String[] s_content = new String[st_nu];
		String[] s_image = new String[st_nu];
		
		
		for(int i=0;i<fo_nu;i++) {
			int j = i+1;
			m_food[i] = req.getParameter("food"+j+"_tx1");
			m_amo[i] = req.getParameter("food"+j+"_tx2");
			System.out.println(m_food[i]+";"+m_amo[i]);
			
		}
		
		for(int i=0;i<st_nu;i++) {
			int j = i+1;
			s_no[i] = "Step"+j;
			s_content[i] = req.getParameter("steptext_"+j);
			s_image[i] = imsi_st_image[i];
			System.out.println(s_no[i]+";"+s_content[i]+";"+s_image[i]);
		}
		
		recipeService.insertRecipe(vo1, imsi_complete_img);
		int r_no = recipeService.searchRecipe_no();
		recipeService.insertRecipe_material(vo1, r_no, m_food, m_amo, fo_nu);
		recipeService.insertRecipe_step(vo1, r_no, s_no, s_content, s_image, st_nu);
		
		return "recipe/uploadrecipe";
	}
	
	@RequestMapping(value = "upload_photo.do", method = RequestMethod.POST)
	@ResponseBody
	public String upload_photh(MultipartHttpServletRequest multipartRequest, HttpServletRequest req) {
		String filePath = "C:\\TodayEat_img\\recipe_upload";
		
		String file_gubun = req.getParameter("file_gubun1");
		String id = req.getParameter("id");
		
		MultipartFile mfile = null;
		String uuid = null;
		String fileName = null;
		String fileType = null;
		String rfileName = null;
		
		System.out.println(file_gubun+id);
		
		if(file_gubun.equals("Step")) {
			mfile = multipartRequest.getFile("step_" + id);
			uuid = UUID.randomUUID().toString();
			fileName = mfile.getOriginalFilename();
			//System.out.println("기존 파일이름: "+fileName);
			fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
			rfileName = uuid+fileType;		
			
			int index = Integer.parseInt(id)-1;
			//System.out.println("배열 위치 no " + index);
			imsi_st_image[index] = rfileName;
			
			//System.out.println("저장된 이름 " + imsi_st_image[index]);
			
			
		} else if(file_gubun.equals("work")) {
			mfile = multipartRequest.getFile("work_" + id);
			uuid = UUID.randomUUID().toString();
			fileName = mfile.getOriginalFilename();
			//System.out.println("기존 파일이름: "+fileName);
			fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());	
			rfileName = uuid+fileType;
			
			imsi_complete_img = rfileName;
		}
		
		File file = new File(filePath, rfileName);
		
		
		try {
			// getInputStream() : 업로드한 파일 데이터를 읽어오는 InputStream을 구한다.
			FileCopyUtils.copy(mfile.getInputStream(), new FileOutputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return rfileName;
	}
	
	@RequestMapping(value = "updateRecipe_view.do", method = RequestMethod.GET)
	public String updateRecipe_view(RecipeVO vo1, HttpServletRequest request, Model model1) throws ClassNotFoundException, SQLException {

		
		rvo = recipeService.searchOneRecipe(vo1);
		model1.addAttribute("mRecipe", rvo);
		request.setAttribute("cate", rvo.getRecipe_category());
		model1.addAttribute("mRecipe_material", recipeService.searchOneRecipe_material(vo1));
		model1.addAttribute("mRecipe_step", recipeService.searchOneRecipe_step(vo1));	
		
		imsi_st_image = recipeService.searchOneRecipe_step_img(vo1);
		imsi_complete_img = rvo.getComplete_img();
		
		
		return "recipe/updaterecipe";
	}
	
	
	@RequestMapping(value = "updateRecipe.do", method = RequestMethod.GET)
	@ResponseBody
	public String updateRecipe(RecipeVO vo1, HttpServletRequest req, Model model1) throws ClassNotFoundException, SQLException {
		
		
		int fo_nu = Integer.parseInt(req.getParameter("fo_nu"));
		int st_nu = Integer.parseInt(req.getParameter("st_nu"));
		
		
		String[] m_food = new String[fo_nu];
		String[] m_amo = new String[fo_nu];
		String[] s_no = new String[st_nu];
		String[] s_content = new String[st_nu];
		String[] s_image = new String[st_nu];
		
		
		for(int i=0;i<fo_nu;i++) {
			int j = i+1;
			m_food[i] = req.getParameter("food"+j+"_tx1");
			m_amo[i] = req.getParameter("food"+j+"_tx2");
			//System.out.println(m_food[i]+";"+m_amo[i]);
			
		}
		
		for(int i=0;i<st_nu;i++) {
			int j = i+1;
			s_no[i] = "Step"+j;
			s_content[i] = req.getParameter("steptext_"+j);
			s_image[i] = imsi_st_image[i];
			//System.out.println(s_no[i]+";"+s_content[i]+";"+s_image[i]);
		}
		
		recipeService.updateRecipe(vo1, imsi_complete_img);
		recipeService.updateRecipe_material(vo1, m_food, m_amo, fo_nu);
		recipeService.updateRecipe_step(vo1, s_no, s_content, s_image, st_nu);
		
		return "recipe/uploadrecipe";
	}
	
//////////////////////////////////////////////////////////////////////////////
	//댓글 테이블
	
	@RequestMapping(value = "upload_reply.do", method = RequestMethod.GET)
	public String upload_reply(RecipeVO vo1, HttpServletRequest req) throws ClassNotFoundException, SQLException {

		int good_sw = Integer.parseInt(req.getParameter("good_sw"));
		String score = null;
		
		if(good_sw == 1) {
			score = "good_icon.svg";
		} else {
			score = "bad_icon.svg";
		}
		
		recipeService.insertReply(vo1, score);
		
		return "recipe/recipe_view";
	}
	
	@RequestMapping(value = "delete_reply.do", method = RequestMethod.GET)
	public String update_reply(RecipeVO vo1, HttpServletRequest req) throws ClassNotFoundException, SQLException {

		int reply_no = Integer.parseInt(req.getParameter("reply_no"));
		//String score = req.getParameter("reply_score");
		
		recipeService.deleteReply(vo1, reply_no);
		
		return "recipe/recipe_view";
	}
	
	//////////////////////////////////////////////////////////////////////////////
	//마이페이지 (나의레시피)
	
	@RequestMapping(value = "Mypage_my.do", method = RequestMethod.GET)
	public String Mypage_my(RecipeVO vo1, HttpServletRequest req, Model model1) throws ClassNotFoundException, SQLException {

		String nickname = req.getParameter("nickname");
		
		
		model1.addAttribute("myRecipe", recipeService.myRecipe_Search(vo1, nickname));
		
		
		return "mypage/Mypage_my";
	}
	
	
}
