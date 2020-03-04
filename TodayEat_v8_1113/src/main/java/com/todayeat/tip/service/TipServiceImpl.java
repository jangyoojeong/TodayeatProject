package com.todayeat.tip.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todayeat.tip.dao.TipDAO;
import com.todayeat.tip.vo.TipVO;

@Service("TipService")
public class TipServiceImpl implements TipService {
	
	@Autowired
	private TipDAO tipDAO;
	
	@Override
	public ArrayList<TipVO> tipAllInfo() throws ClassNotFoundException, SQLException {
		return tipDAO.tipAllInfo();
	}

	@Override
	public TipVO tipOneInfo(String tname) throws ClassNotFoundException, SQLException {
		return tipDAO.tipOneInfo(tname);
	}
	
}
