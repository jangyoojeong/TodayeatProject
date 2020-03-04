package com.todayeat.keep.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.todayeat.dbconn.TodayeatDBConn;
import com.todayeat.keep.vo.KeepVO;
import com.todayeat.recipe.vo.RecipeVO;


@Repository
public class KeepDAO {
	
	private Connection con;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	// 커네셕풀 
	public KeepDAO() throws ClassNotFoundException, SQLException {
		con = new TodayeatDBConn().getConnection();
	}
	
	public void pstmtClose() throws SQLException {
		if(pstmt != null) {
			pstmt.close();
		}
	}
	
	// 모든 자료 닫아주기 ( rs, pstmt, con close ) 
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
	
	// keep 한개의 레시피 정보 가져오기   
	public KeepVO searchOneKeep(KeepVO vo1) throws SQLException {
		KeepVO keepvo=null;
		
		String sql = "select * from tbl_keep where keep_id =?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo1.getKeep_id());
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			keepvo = new KeepVO();
			keepvo.setNickname(rs.getString("nickname"));
//			keepvo.setKeep_id(rs.getInt("keep_id"));
			keepvo.setRecipe_no(rs.getInt("recipe_no"));
			
		}
		return keepvo;
		
/*		String sql2 ="select * from recipe where recipe_no =?";
*/	}
	
	
	// keep insert
	public int insertKeep(KeepVO vo1) throws SQLException {

		String sql = "select count(*) from tbl_keep where recipe_no = ? and nickname = ?";
		int sw = 0;
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo1.getRecipe_no());
		pstmt.setString(2, vo1.getNickname());
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			sw = rs.getInt("count(*)");
			if(sw == 1) {
			
			} else {
				String sql2 = "insert into tbl_keep values(keep_seq.nextVal,?,?)";
				pstmt = con.prepareStatement(sql2);
				pstmt.setString(1, vo1.getNickname()); 
				pstmt.setInt(2, vo1.getRecipe_no());
				pstmt.executeUpdate();
			}
		}	
		return sw;
	}
	
	// keep list
	public ArrayList <KeepVO> listKeep(KeepVO vo1) throws SQLException{
		
		ArrayList <KeepVO> array = new ArrayList <KeepVO>();
		
		String sql ="select k.keep_id, r.nickname, k.recipe_no, r.recipe_title, r.recipe_good, r.recipe_bad, r.complete_img from" + 
				" (select * from tbl_keep where nickname like ?) k join recipe r" + 
				" on r.recipe_no = k.recipe_no" + 
				" order by k.keep_id desc";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, vo1.getNickname());
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			KeepVO keepvo = new KeepVO();
			keepvo.setKeep_id(rs.getInt("keep_id"));
			keepvo.setNickname(rs.getString("nickname"));
			keepvo.setRecipe_no(rs.getInt("recipe_no"));
			keepvo.setRecipe_title(rs.getString("recipe_title"));
			keepvo.setRecipe_good(rs.getInt("recipe_good"));
			keepvo.setRecipe_bad(rs.getInt("recipe_bad"));
			keepvo.setComplete_img(rs.getString("complete_img"));
			
			
			String sql2 = "select recipe_no, listagg(material_food, ', ')within group (order by recipe_no) material_food" +
							" from recipe_material group by recipe_no having recipe_no = ?";
			
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, keepvo.getRecipe_no());
			
			rs2 = pstmt.executeQuery();
			
			if(rs2.next()) {
				keepvo.setMaterial_food(rs2.getString("material_food"));
			}
			
			array.add(keepvo);
		}
		return array;
	}
	
	// keep delete 
	public void deleteKeep(KeepVO vo1) throws SQLException {
		String sql = "delete tbl_keep where keep_id =?";
		
		pstmt =con.prepareStatement(sql);

		String[] keep_id = vo1.getKeep_id_s().split(",");
		for(int i=0;i<keep_id.length;i++) {
			//System.out.println("&&"+keep_id[i]);
			pstmt.setInt(1, Integer.parseInt(keep_id[i]));
			pstmt.executeUpdate();
		} 

		
	}
}
