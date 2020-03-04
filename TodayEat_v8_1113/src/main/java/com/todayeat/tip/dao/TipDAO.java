package com.todayeat.tip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.todayeat.dbconn.TodayeatDBConn;
import com.todayeat.tip.vo.TipVO;

@Repository
public class TipDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public TipDAO() throws ClassNotFoundException, SQLException {
		con = new TodayeatDBConn().getConnection();
	}
	
	public void pstmtClose() throws SQLException {
		if(pstmt != null) {
			pstmt.close();
		}
	}
	
	public void getAllInfoClose() throws SQLException {
		if(rs != null) {
			rs.close();
		}
		if(pstmt != null) {
			pstmt.close();
		}
		if(con != null) {
			con.close();
		}
	}
	
	public ArrayList <TipVO> tipAllInfo() throws SQLException {
			
			ArrayList <TipVO> tarray = new ArrayList <TipVO>();
			
			String sql = "select * from TipTable";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TipVO tipinfo = new TipVO();
				tipinfo.setTname(rs.getString("tname"));
				tipinfo.setTimg(rs.getString("timg"));
				tipinfo.setTkinds(rs.getString("tkinds"));
				tipinfo.setTorign(rs.getString("torign"));
				tipinfo.setTproduction(rs.getString("tproduction"));
				tipinfo.setTcol(rs.getString("tcol"));
				tipinfo.setTkeep(rs.getString("tkeep"));
				tipinfo.setTdate(rs.getString("tdate"));
				tipinfo.setTsource(rs.getString("tsource"));
				
				tarray.add(tipinfo);
			}
			
			return tarray;
	}
	
	public TipVO tipOneInfo(String tname) throws SQLException {
		
		TipVO tipinfo = null;
		
		String sql = "select * from TipTable where tname=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, tname);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			tipinfo = new TipVO();
			
			tipinfo.setTname(rs.getString("tname"));
			tipinfo.setTimg(rs.getString("timg"));
			tipinfo.setTkinds(rs.getString("tkinds"));
			tipinfo.setTorign(rs.getString("torign"));
			tipinfo.setTproduction(rs.getString("tproduction"));
			tipinfo.setTcol(rs.getString("tcol"));
			tipinfo.setTkeep(rs.getString("tkeep"));
			tipinfo.setTdate(rs.getString("tdate"));
			tipinfo.setTsource(rs.getString("tsource"));
			
		}
		
		return tipinfo;
}
	
	
}
