package com.todayeat.tip.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.todayeat.tip.vo.TipVO;

public interface TipService {
	public ArrayList <TipVO> tipAllInfo() throws ClassNotFoundException, SQLException; 
	
	public TipVO tipOneInfo(String tname) throws ClassNotFoundException, SQLException;
}
