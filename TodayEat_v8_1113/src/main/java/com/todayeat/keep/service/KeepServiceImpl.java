package com.todayeat.keep.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todayeat.keep.dao.KeepDAO;
import com.todayeat.keep.vo.KeepVO;
import com.todayeat.recipe.vo.RecipeVO;

@Service("KeepService")
public class KeepServiceImpl implements KeepService{
	
	@Autowired
	private KeepDAO keepDAO;

	
	@Override
	public KeepVO searchOneKeep(KeepVO vo1) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return keepDAO.searchOneKeep(vo1);
	} 

	@Override
	public int insertKeep(KeepVO vo1) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return keepDAO.insertKeep(vo1);
	}

	@Override
	public void deleteKeep(KeepVO vo1) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		keepDAO.deleteKeep(vo1);
	}

	@Override
	public ArrayList<KeepVO> listKeep(KeepVO vo1) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return keepDAO.listKeep(vo1);
	}
	
}
