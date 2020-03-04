package com.todayeat.season.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.todayeat.recipe.vo.RecipeVO;
import com.todayeat.season.vo.SeasonVO;

public interface SeasonService {
	public SeasonVO seasonOneInfo(String season) throws ClassNotFoundException, SQLException;
	
	public int Season_Search(String f1, String f2, String f3) throws ClassNotFoundException, SQLException;
	
	public ArrayList<RecipeVO> paging(int startRow, int cntRow) throws ClassNotFoundException, SQLException;
}
