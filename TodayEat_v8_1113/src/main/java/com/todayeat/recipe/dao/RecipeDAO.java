package com.todayeat.recipe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.todayeat.dbconn.TodayeatDBConn;
import com.todayeat.recipe.vo.RecipeVO;

@Repository
public class RecipeDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public RecipeDAO() throws ClassNotFoundException, SQLException {
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
	
	//레시피 한개 추출
	public RecipeVO searchOneRecipe (RecipeVO vo1) throws SQLException {
		
		RecipeVO recipevo = null;
		
		String sql = "select * from recipe where recipe_no = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo1.getRecipe_no());
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			recipevo = new RecipeVO();
			recipevo.setRecipe_no(rs.getInt("recipe_no"));
			recipevo.setRecipe_title(rs.getString("recipe_title"));
			recipevo.setRecipe_intro(rs.getString("recipe_intro"));
			recipevo.setRecipe_category(rs.getString("recipe_category"));
			recipevo.setRecipe_tip(rs.getString("recipe_tip"));
			recipevo.setRecipe_origin(rs.getString("recipe_origin"));
			recipevo.setNickname(rs.getString("nickname"));
			recipevo.setRecipe_good(rs.getInt("recipe_good"));
			recipevo.setRecipe_bad(rs.getInt("recipe_bad"));
			recipevo.setComplete_img(rs.getString("complete_img"));
			recipevo.setReply_total(rs.getInt("reply_total"));
		}
		return recipevo;
	}
	
	//레시피 한개 추출(재료)
	public ArrayList <RecipeVO> searchOneRecipe_material (RecipeVO vo1) throws SQLException {
		
		ArrayList <RecipeVO> rarray = new ArrayList <RecipeVO>();
				
		String sql = "select * from recipe_material where recipe_no = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo1.getRecipe_no());
		
		rs = pstmt.executeQuery();
		while(rs.next()) {
			RecipeVO recipevo = new RecipeVO();
			recipevo.setMaterial_food(rs.getString("material_food"));
			recipevo.setMaterial_amo(rs.getString("material_amo"));
			rarray.add(recipevo);
		}
		return rarray;
	}
	
	//레시피 한개 추출(요리순서)
	public ArrayList <RecipeVO> searchOneRecipe_step (RecipeVO vo1) throws SQLException {
		
		ArrayList <RecipeVO> rarray = new ArrayList <RecipeVO>();
		
		String sql = "select * from recipe_step where recipe_no = ? order by st_no";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo1.getRecipe_no());
		
		rs = pstmt.executeQuery();
		while(rs.next()) {
			RecipeVO recipevo = new RecipeVO();
			recipevo.setSt_no(rs.getString("st_no"));
			recipevo.setSt_content(rs.getString("st_content"));
			recipevo.setSt_image(rs.getString("st_image"));
			rarray.add(recipevo);
		}
		return rarray;
	}
	
	public String[] searchOneRecipe_step_img (RecipeVO vo1) throws SQLException {
		
		String[] stepImgList = new String[30];
				
		String sql = "select st_image from recipe_step where recipe_no = ? order by st_no";		
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo1.getRecipe_no());
		
		rs = pstmt.executeQuery();
		
		int i = 0;
		
		while(rs.next()) {
			stepImgList[i] = rs.getString("st_image");
			System.out.println(stepImgList[i]);
			i++;
		}
		
		
		return stepImgList;
		
	}
	
/*	public RecipeVO searchOneRecipe_complete (RecipeVO vo1) throws SQLException {
		
		RecipeVO recipevo = null;
		
		String sql = "select * from recipe_complete where recipe_no = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo1.getRecipe_no());
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			recipevo = new RecipeVO();
			recipevo.setComplete_img(rs.getString("complete_img"));
		}
		return recipevo;
	}*/
	
	//레시피 삽입
	public void insertRecipe (RecipeVO vo1, String imsi_complete_img) throws SQLException {
		
		String sql = "insert into recipe  (recipe_no, recipe_title, recipe_intro, recipe_category, recipe_tip, recipe_origin, nickname, complete_img) values(re_seq.nextval, ?, ?, ?, ?, 'https://blog.naver.com/yejin1108', ?, ?)";
				
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, vo1.getRecipe_title());
		pstmt.setString(2, vo1.getRecipe_intro());
		pstmt.setString(3, vo1.getRecipe_category());
		pstmt.setString(4, vo1.getRecipe_tip());
		pstmt.setString(5, vo1.getNickname());
		pstmt.setString(6, imsi_complete_img);
		
		pstmt.executeUpdate();
	}
	
	//레시피 no 추출 (나머지 테이블 데이터 넣기 위함)
	public int searchRecipe_no () throws SQLException {
		
		String sql = "select max(recipe_no) from recipe";
		int r_no = 0;
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			r_no = rs.getInt("max(recipe_no)");
			System.out.println(r_no);			
		}
		
		return r_no;

	}
	
	//레시피 재료 삽입
	public void insertRecipe_material (RecipeVO vo1, int r_no, String[] m_food, String[] m_amo, int fo_nu) throws SQLException {
		
		for(int i=0;i<fo_nu;i++) {
			
			String sql = "insert into recipe_material values(?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_no);
			pstmt.setString(2, m_food[i]);
			pstmt.setString(3, m_amo[i]);
			
			pstmt.executeUpdate();
		}
		System.out.println(r_no);	
	}
	
	//레시피 순서 삽입
	public void insertRecipe_step (RecipeVO vo1, int r_no, String[] s_no, String[] s_content, String[] s_image, int st_nu) throws SQLException {
		
		for(int i=0;i<st_nu;i++) {
			
			String sql = "insert into recipe_step values(?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_no);
			pstmt.setString(2, s_no[i]);
			pstmt.setString(3, s_content[i]);
			pstmt.setString(4, s_image[i]);
			
			pstmt.executeUpdate();
		}
		System.out.println(r_no);	
	}
	
	
	//레시피 삭제
	public void deleteRecipe (RecipeVO vo1) throws SQLException {
		
		String sql = "delete recipe where recipe_no = ?";
		String sql2 = "delete recipe_material where recipe_no = ?";
		String sql3 = "delete recipe_step where recipe_no = ?";
		
		String[] no_l = vo1.getRecipe_no_s().split(",");
		for(int i=0;i<no_l.length;i++) {
			
		
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(no_l[i]));
		
		pstmt.executeUpdate();
		
		pstmt = con.prepareStatement(sql2);
		pstmt.setInt(1, Integer.parseInt(no_l[i]));
		
		pstmt.executeUpdate();
		
		pstmt = con.prepareStatement(sql3);
		pstmt.setInt(1,Integer.parseInt(no_l[i]));
		
		pstmt.executeUpdate();
		
		System.out.println(Integer.parseInt(no_l[i]) + "번 recipe delete");
		}
	}
	
	//레시피 업데이트
	public void updateRecipe (RecipeVO vo1, String imsi_complete_img) throws SQLException {
		
		String sql = "update recipe set recipe_title=?, recipe_intro=?, recipe_category=?, recipe_tip=?, complete_img=? where recipe_no = ?";
	
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, vo1.getRecipe_title());
		pstmt.setString(2, vo1.getRecipe_intro());
		pstmt.setString(3, vo1.getRecipe_category());
		pstmt.setString(4, vo1.getRecipe_tip());
		pstmt.setString(5, imsi_complete_img);
		pstmt.setInt(6, vo1.getRecipe_no());
		
		pstmt.executeUpdate();
	
	}
	
	//레시피 재료 업데이트
	public void updateRecipe_material (RecipeVO vo1, String[] m_food, String[] m_amo, int fo_nu) throws SQLException {
		
		String sql = "delete recipe_material where recipe_no = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo1.getRecipe_no());
		
		pstmt.executeUpdate();
		
		for(int i=0;i<fo_nu;i++) {
			
			String sql2 = "insert into recipe_material values(?, ?, ?)";
				
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, vo1.getRecipe_no());
			pstmt.setString(2, m_food[i]);
			pstmt.setString(3, m_amo[i]);
				
			pstmt.executeUpdate();
		}
	}
	
	//레시피 순서 업데이트
	public void updateRecipe_step (RecipeVO vo1, String[] s_no, String[] s_content, String[] s_image, int st_nu) throws SQLException {
		
		String sql = "delete recipe_step where recipe_no = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo1.getRecipe_no());
		
		pstmt.executeUpdate();
		
		for(int i=0;i<st_nu;i++) {
			
			String sql2 = "insert into recipe_step values(?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, vo1.getRecipe_no());
			pstmt.setString(2, s_no[i]);
			pstmt.setString(3, s_content[i]);
			pstmt.setString(4, s_image[i]);
			
			pstmt.executeUpdate();
		}
		
	}
	
	///////////////////////////////////////////////////////
	//댓글
	
	//레시피에 따른 댓글 list 추출 (페이징)
	public ArrayList <RecipeVO> searchOneReply_Paging (RecipeVO vo1) throws SQLException {
		
		ArrayList <RecipeVO> rarray = new ArrayList <RecipeVO>();
		
		String sql = "select * from (select rownum rn, aa.* from (select * from recipe_reply where recipe_no = ? order by reply_no desc) aa) where rn>=1 and rn<=3";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo1.getRecipe_no());
		
		rs = pstmt.executeQuery();
		while(rs.next()) {
			RecipeVO recipevo = new RecipeVO();
			recipevo.setReply_no(rs.getInt("reply_no"));
			recipevo.setReply_date(rs.getString("reply_date"));
			recipevo.setReply_content(rs.getString("reply_content"));
			recipevo.setReply_score(rs.getString("reply_score"));
			recipevo.setRecipe_no(rs.getInt("recipe_no"));
			recipevo.setNickname(rs.getString("nickname"));
			recipevo.setMember_profile(rs.getString("member_profile"));
			rarray.add(recipevo);
		}
		return rarray;
	}
	
	//레시피뷰에서 전체보기 눌렀을때
	public ArrayList <RecipeVO> searchOneReply (RecipeVO vo1) throws SQLException {
		
		ArrayList <RecipeVO> rarray = new ArrayList <RecipeVO>();
		
		String sql = "select * from recipe_reply where recipe_no = ? order by reply_no desc";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo1.getRecipe_no());
		
		System.out.println(vo1.getRecipe_no());
		
		rs = pstmt.executeQuery();
		while(rs.next()) {
			RecipeVO recipevo = new RecipeVO();
			recipevo.setReply_no(rs.getInt("reply_no"));
			recipevo.setReply_date(rs.getString("reply_date"));
			recipevo.setReply_content(rs.getString("reply_content"));
			recipevo.setReply_score(rs.getString("reply_score"));
			recipevo.setRecipe_no(rs.getInt("recipe_no"));
			recipevo.setNickname(rs.getString("nickname"));
			recipevo.setMember_profile(rs.getString("member_profile"));
			rarray.add(recipevo);
		}
		return rarray;
	}
	
	//댓글 insert (댓글 insert, recipe 테이블 reply_total 업데이트, recipe 스코어 업데이트)
	public void insertReply (RecipeVO vo1, String score) throws SQLException {
		
		String sql = "select * from todayeatmember where nickname = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, vo1.getNickname());
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			vo1.setMember_profile(rs.getString("member_profile"));
		}
		
		String sql1 = "insert into recipe_reply (reply_no, reply_content, reply_score, recipe_no, nickname, member_profile) values(reply_seq.nextval, ?, ?, ?, ?, ?)";
			
		pstmt = con.prepareStatement(sql1);
		pstmt.setString(1, vo1.getReply_content());
		pstmt.setString(2, score);
		pstmt.setInt(3, vo1.getRecipe_no());
		pstmt.setString(4, vo1.getNickname());
		pstmt.setString(5, vo1.getMember_profile());
		
		pstmt.executeUpdate();
		
		String sql2 = "update recipe set reply_total = reply_total+1 where recipe_no = ?";
		
		pstmt = con.prepareStatement(sql2);
		pstmt.setInt(1, vo1.getRecipe_no());
		
		pstmt.executeUpdate();
		
		
		if(score.equals("good_icon.svg")) {
			
			String sql3 = "update recipe set recipe_good = recipe_good+1 where recipe_no = ?";
			
			pstmt = con.prepareStatement(sql3);
			pstmt.setInt(1, vo1.getRecipe_no());
			
			pstmt.executeUpdate();
		} else {
			
			String sql3 = "update recipe set recipe_bad = recipe_bad+1 where recipe_no = ?";
			
			pstmt = con.prepareStatement(sql3);
			pstmt.setInt(1, vo1.getRecipe_no());
			
			pstmt.executeUpdate();
		}
		
	}	
	
	//댓글 delete (댓글 delete, recipe 테이블 reply_total 업데이트, recipe 스코어 업데이트)
	public void deleteReply (RecipeVO vo1, int reply_no) throws SQLException {
		
		String sql1 = "select * from recipe_reply where reply_no = ?";
		String score = null;
		
		pstmt = con.prepareStatement(sql1);		
		pstmt.setInt(1, reply_no);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			score = rs.getString("reply_score");
		}
		
		String sql2 = "delete recipe_reply where reply_no = ?";
			
		pstmt = con.prepareStatement(sql2);
		pstmt.setInt(1, reply_no);
		
		pstmt.executeUpdate();
		
		String sql3 = "update recipe set reply_total = reply_total-1 where recipe_no = ?";
		
		pstmt = con.prepareStatement(sql3);
		pstmt.setInt(1, vo1.getRecipe_no());
		
		pstmt.executeUpdate();
		
		if(score.equals("good_icon.svg")) {
			
			String sql4 = "update recipe set recipe_good = recipe_good-1 where recipe_no = ?";
			
			pstmt = con.prepareStatement(sql4);
			pstmt.setInt(1, vo1.getRecipe_no());
			
			pstmt.executeUpdate();
		} else {
			
			String sql4 = "update recipe set recipe_bad = recipe_bad-1 where recipe_no = ?";
			
			pstmt = con.prepareStatement(sql4);
			pstmt.setInt(1, vo1.getRecipe_no());
			
			pstmt.executeUpdate();
		}
		
	}
	
	//마이페이지 (나의레시피)
	public ArrayList <RecipeVO> myRecipe_Search (RecipeVO vo1, String nickname) throws SQLException {
		
		ArrayList <RecipeVO> rarray = new ArrayList <RecipeVO>();
				
		String sql = "select * from recipe where nickname like ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, nickname);
		
		
		rs = pstmt.executeQuery();
		while(rs.next()) {
			RecipeVO recipevo = new RecipeVO();
			recipevo.setRecipe_no(rs.getInt("recipe_no"));
			recipevo.setRecipe_title(rs.getString("recipe_title"));
			recipevo.setNickname(rs.getString("nickname"));
			recipevo.setRecipe_good(rs.getInt("recipe_good"));
			recipevo.setRecipe_bad(rs.getInt("recipe_bad"));
			recipevo.setComplete_img(rs.getString("complete_img"));
			rarray.add(recipevo);
		}
		return rarray;
	}
	
}