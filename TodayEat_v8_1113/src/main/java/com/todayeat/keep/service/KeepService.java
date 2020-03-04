package com.todayeat.keep.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.todayeat.keep.vo.KeepVO;
import com.todayeat.recipe.vo.RecipeVO;

public interface KeepService {
	
	public KeepVO searchOneKeep(KeepVO vo1) throws ClassNotFoundException,SQLException;
	
	public int insertKeep(KeepVO vo1) throws ClassNotFoundException,SQLException;
	
	public ArrayList <KeepVO> listKeep(KeepVO vo1) throws ClassNotFoundException,SQLException;
	
	public void deleteKeep(KeepVO vo1) throws ClassNotFoundException,SQLException; 
	
	
	
	
}
