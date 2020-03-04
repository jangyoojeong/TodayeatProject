package com.todayeat.recipe.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.todayeat.recipe.vo.RecipeVO;

public interface RecipeService {
	
	public RecipeVO searchOneRecipe(RecipeVO vo1) throws ClassNotFoundException, SQLException;
	
	public ArrayList <RecipeVO> searchOneRecipe_material(RecipeVO vo1) throws ClassNotFoundException, SQLException;
	
	public ArrayList <RecipeVO> searchOneRecipe_step(RecipeVO vo1) throws ClassNotFoundException, SQLException;
	
	//public RecipeVO searchOneRecipe_complete(RecipeVO vo1) throws ClassNotFoundException, SQLException;
	
	public String[] searchOneRecipe_step_img(RecipeVO vo1) throws ClassNotFoundException, SQLException;
	
	public void insertRecipe(RecipeVO vo1, String imsi_complete_img) throws ClassNotFoundException, SQLException;
	
	public int searchRecipe_no() throws ClassNotFoundException, SQLException;
	
	public void insertRecipe_material(RecipeVO vo1, int r_no, String[] m_food, String[] m_amo, int fo_nu) throws ClassNotFoundException, SQLException;
	
	public void insertRecipe_step(RecipeVO vo1, int r_no, String[] s_no, String[] s_content, String[] s_image, int st_nu) throws ClassNotFoundException, SQLException;
	
	public void deleteRecipe(RecipeVO vo1) throws ClassNotFoundException, SQLException;
	
	public void updateRecipe(RecipeVO vo1) throws ClassNotFoundException, SQLException;

	public void updateRecipe(RecipeVO vo1, String imsi_complete_img) throws ClassNotFoundException, SQLException;
	
	public void updateRecipe_material(RecipeVO vo1, String[] m_food, String[] m_amo, int fo_nu) throws ClassNotFoundException, SQLException;
	
	public void updateRecipe_step(RecipeVO vo1, String[] s_no, String[] s_content, String[] s_image, int st_nu) throws ClassNotFoundException, SQLException;

	//댓글
	public ArrayList <RecipeVO> searchOneReply_Paging(RecipeVO vo1) throws ClassNotFoundException, SQLException;
	
	public ArrayList <RecipeVO> searchOneReply(RecipeVO vo1) throws ClassNotFoundException, SQLException;

	public void insertReply(RecipeVO vo1, String score) throws ClassNotFoundException, SQLException;
	
	public void deleteReply(RecipeVO vo1, int reply_no) throws ClassNotFoundException, SQLException;
	
	//마이페이지 (나의레시피)
	public ArrayList <RecipeVO> myRecipe_Search(RecipeVO vo1, String nickname) throws ClassNotFoundException, SQLException;

}
