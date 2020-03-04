package com.todayeat.season.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.todayeat.dbconn.TodayeatDBConn;
import com.todayeat.recipe.vo.RecipeVO;
import com.todayeat.season.vo.SeasonVO;

@Repository
public class SeasonDAO {
	
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public SeasonDAO() throws ClassNotFoundException, SQLException {
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
	
	public SeasonVO seasonOneInfo(String season) throws SQLException {
		
		SeasonVO seasoninfo = null;
		String sql = "select * from season where season=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, season);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			seasoninfo = new SeasonVO();
			seasoninfo.setSeason(rs.getString("season"));
			seasoninfo.setSeason_img1(rs.getString("season_img1"));
			seasoninfo.setSeason_img2(rs.getString("season_img2"));
			seasoninfo.setSeason_img3(rs.getString("season_img3"));
		}
		
		return seasoninfo;
	}
	
	
	
	//계절별 레시피 검색 - 레시피 정보
		public int Season_Search(String f1, String f2, String f3) throws SQLException {
			
			ArrayList<RecipeVO> search_list = new ArrayList<RecipeVO>();
			
			String sql = "select distinct r.recipe_no, r.recipe_title, r.complete_img, r.recipe_good, r.recipe_bad from recipe r, recipe_material rm where r.recipe_no = rm.recipe_no and REGEXP_LIKE(material_food, ?) order by r.recipe_no desc";
			String sql2 = null;
			String foodhap = "";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, f1+ "|" + f2+ "|" +f3);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RecipeVO rv = new RecipeVO();
				rv.setRecipe_no(rs.getInt("recipe_no"));
				rv.setRecipe_title(rs.getString("recipe_title"));
				rv.setRecipe_good(rs.getInt("recipe_good"));
				rv.setRecipe_bad(rs.getInt("recipe_bad"));
				rv.setComplete_img(rs.getString("complete_img"));
				
				search_list.add(rv);
			}
			
			System.out.println("검색 결과1 : " + search_list.size());
			
			int circle = search_list.size()-1;
			//3->1번째, 2->2번째, 1->3번째
			for(int i=circle; i>=0; i--) {
						
				sql = "select material_food from recipe_material where recipe_no = ? order by recipe_no";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, search_list.get(i).getRecipe_no());
				
				rs = pstmt.executeQuery();
						
				while(rs.next()) {
					foodhap = foodhap + rs.getString("material_food") + ", ";	
				}
						
				foodhap = foodhap.substring(0, foodhap.length()-2);
				search_list.get(i).setMaterial_food(foodhap);
				
				foodhap = "";
				
				pstmtClose();
			}
			
			
			System.out.println("검색 결과2 : " + search_list.size());
			
			for(int i=0; i<search_list.size(); i++) {
				
				String sql3 = "insert into food_dumi values(?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql3);
				pstmt.setInt(1, search_list.get(i).getRecipe_no());
				pstmt.setString(2, search_list.get(i).getRecipe_title());
				pstmt.setInt(3, search_list.get(i).getRecipe_good());
				pstmt.setInt(4, search_list.get(i).getRecipe_bad());
				pstmt.setString(5, search_list.get(i).getMaterial_food());
				pstmt.setString(6, search_list.get(i).getComplete_img());
				
				System.out.println("쿼리 실행전");
				
				pstmt.executeUpdate();
				
				pstmtClose();
				System.out.println("여기서 에러가 나는 건가?");
			}
			
			String sql4 = "select count(*) as total from food_dumi";
			pstmt = con.prepareStatement(sql4);
			rs = pstmt.executeQuery();
			
			int total = 0;
			
			if(rs.next()) {
				total = rs.getInt("total");
			}
			pstmtClose();
			
			return total;
			
		}
		
		
			//게시글 5개씩 잘라서 가져오는 메소드
			public ArrayList<RecipeVO> paging(int startRow, int cntRow) throws SQLException {
				
				ArrayList<RecipeVO> page_array = new ArrayList<RecipeVO>();
				String sql = "select x.recipe_no, x.recipe_title, x.recipe_good, x.recipe_bad, x.material_food, x.complete_img from (select rownum as rnum, A.recipe_no, A.recipe_title, A.recipe_good, A.recipe_bad, A.material_food, A.complete_img from (select recipe_no, recipe_title, recipe_good, recipe_bad, material_food, complete_img from food_dumi order by recipe_no desc) A where rownum <= ?) x where x.rnum > ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, cntRow);
				pstmt.setInt(2,  startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					RecipeVO rv = new RecipeVO();
					rv.setRecipe_no(rs.getInt("recipe_no"));
					rv.setRecipe_title(rs.getString("recipe_title"));
					rv.setRecipe_good(rs.getInt("recipe_good"));
					rv.setRecipe_bad(rs.getInt("recipe_bad"));
					rv.setMaterial_food(rs.getString("material_food"));
					rv.setComplete_img(rs.getString("complete_img"));
					
					page_array.add(rv);
					
				}
				
				String sql5 = "TRUNCATE TABLE food_dumi";
				pstmt = con.prepareStatement(sql5);
				pstmt.executeUpdate();
				pstmtClose();
				
				return page_array;
			}
	
}
