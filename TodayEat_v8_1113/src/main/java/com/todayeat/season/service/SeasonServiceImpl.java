package com.todayeat.season.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todayeat.recipe.vo.RecipeVO;
import com.todayeat.season.dao.SeasonDAO;
import com.todayeat.season.vo.SeasonVO;

@Service("SeasonService")
public class SeasonServiceImpl implements SeasonService {
	
	@Autowired
	private SeasonDAO seasonDAO;
	
	@Override
	public SeasonVO seasonOneInfo(String season) throws ClassNotFoundException, SQLException {
		return seasonDAO.seasonOneInfo(season);
	}
	
	@Override
	public int Season_Search(String f1, String f2, String f3)
			throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return seasonDAO.Season_Search(f1, f2, f3);
	}

	@Override
	public ArrayList<RecipeVO> paging(int startRow, int cntRow)
			throws ClassNotFoundException, SQLException {
		
		return seasonDAO.paging(startRow, cntRow);
	}

}
