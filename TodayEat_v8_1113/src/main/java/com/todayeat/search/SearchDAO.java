package com.todayeat.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.todayeat.dbconn.TodayeatDBConn;
import com.todayeat.recipe.vo.RecipeVO;

@Repository
public class SearchDAO implements SearchService {
	//DB 속성
	private Connection con;
	private PreparedStatement stmt=null;
	private ResultSet rs=null;
	
	//SQL	
	private final String SEARCH1 = "SELECT * FROM RECIPE WHERE RECIPE_TITLE LIKE ? OR RECIPE_INTRO LIKE ? OR RECIPE_CATEGORY LIKE ? OR RECIPE_TIP LIKE ? OR NICKNAME LIKE ?";	
	private final String SEARCH5 = "SELECT * FROM RECIPE WHERE recipe_category = ?";
	private final String SEARCH4 = "SELECT * FROM RECIPE WHERE RECIPE_NO = ?";
	private final String SEARCH3 = "SELECT * FROM RECIPE_MATERIAL WHERE MATERIAL_FOOD LIKE ?";
	private final String SEARCH2 = "SELECT * FROM RECIPE_MATERIAL WHERE RECIPE_NO = ?";

	//생성자
	public SearchDAO() throws ClassNotFoundException, SQLException {
		con = new TodayeatDBConn().getConnection();
	}
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*검색어로 DB에서 recipe 빼기*/
	/* (non-Javadoc)
	 * @see com.todayeat.search.SearchServcie#getRecipeVO(java.util.ArrayList, java.util.ArrayList)
	 */
	
	@Override
	public ArrayList<RecipeVO>  getRecipeVO(ArrayList<SearchVO> list_searchVO_query, ArrayList<SearchVO> list_searchVO_country) throws SQLException{
		System.out.println("\n--> JDBC로 getRecipeVO() 기능 처리");
		ArrayList<RecipeVO> list_recipeVO = new ArrayList<RecipeVO>();
		if(list_searchVO_query.size()>0 || list_searchVO_country.size()>0) {

			for(int i=0;i<list_searchVO_query.size();i++) {
				String query1 = list_searchVO_query.get(i).getQuery();
				String sql = "%"+query1+"%";
				
					stmt = con.prepareStatement(SEARCH1);
					stmt.setString(1, sql);
					stmt.setString(2, sql);
					stmt.setString(3, sql);
					stmt.setString(4, sql);
					stmt.setString(5, sql); 
					rs = stmt.executeQuery();
					while(rs.next()) {
						RecipeVO recipe = new RecipeVO();
						recipe.setRecipe_no(rs.getInt("recipe_no"));
						recipe.setRecipe_title(rs.getString("recipe_title"));
						recipe.setRecipe_intro(rs.getString("recipe_intro"));
						recipe.setRecipe_category(rs.getString("recipe_category"));
						recipe.setRecipe_tip(rs.getString("recipe_tip"));
						recipe.setRecipe_origin(rs.getString("recipe_origin"));
						recipe.setNickname(rs.getString("nickname"));
						recipe.setRecipe_good(rs.getInt("recipe_good"));
						recipe.setRecipe_bad(rs.getInt("recipe_bad"));
						recipe.setComplete_img(rs.getNString("complete_img"));
						list_recipeVO.add(recipe);
					}
					
					
				
			}
			// query로 for문 끝나고 얻은 list_recipeVO
			// 중복제거
			if(list_recipeVO.size()>1) {
				for(int i=0;i<list_recipeVO.size()-1;i++) {
					for(int j=i+1;j<list_recipeVO.size();j++) {
						if(list_recipeVO.get(i).getRecipe_no()==list_recipeVO.get(j).getRecipe_no()) {
							list_recipeVO.remove(j);
							j--;
						}
					}
				}
			}
			// query로 material 돌리기
			ArrayList<RecipeVO> l_r = new ArrayList<RecipeVO>();
			for(int i=0;i<list_searchVO_query.size();i++) {

				String query1 = list_searchVO_query.get(i).getQuery();
				String sql = "%"+query1+"%";
				try {
					stmt = con.prepareStatement(SEARCH3);
					stmt.setString(1, sql);
					rs = stmt.executeQuery();
					while(rs.next()) {
						RecipeVO vo = new RecipeVO();
						vo.setRecipe_no(rs.getInt("recipe_no"));
						l_r.add(vo);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			// l_r 중복 제거
			if(l_r.size()>1) {
				for(int n=0;n<l_r.size()-1;n++) {
					for(int m=n+1;m<l_r.size();m++) {
						if(l_r.get(n).getRecipe_no()==l_r.get(m).getRecipe_no()) {
							l_r.remove(m);
							m--;
						}
					}
				}
			}
			// l_r중에서 list_recipeVO가 없는 recipe_no 찾아서 추가
			if(list_recipeVO.size()>0 && l_r.size()>0) {
				for(int n=0;n<list_recipeVO.size();n++) {
					for(int m=0;m<l_r.size();m++) {
						if(list_recipeVO.get(n).getRecipe_no()==l_r.get(m).getRecipe_no()) {
							l_r.remove(m);
							m--;
						}
					}
				}
			}
			//추가
			if(l_r.size()>0) {
				for(int n=0;n<l_r.size();n++) {
					int sql = l_r.get(n).getRecipe_no();
				
						stmt = con.prepareStatement(SEARCH4);
						stmt.setInt(1, sql);
						rs = stmt.executeQuery();
						while(rs.next()) {
							RecipeVO recipe = new RecipeVO();
							recipe.setRecipe_no(rs.getInt("recipe_no"));
							recipe.setRecipe_title(rs.getString("recipe_title"));
							recipe.setRecipe_intro(rs.getString("recipe_intro"));
							recipe.setRecipe_category(rs.getString("recipe_category"));
							recipe.setRecipe_tip(rs.getString("recipe_tip"));
							recipe.setRecipe_origin(rs.getString("recipe_origin"));
							recipe.setNickname(rs.getString("nickname"));
							recipe.setRecipe_good(rs.getInt("recipe_good"));
							recipe.setRecipe_bad(rs.getInt("recipe_bad"));
							recipe.setComplete_img(rs.getNString("complete_img"));
							list_recipeVO.add(recipe);
						}
	
				}
			}
			
			
			// country 있는지 확인부터하고
			// country로 for문 돌리는데 list_recipeVO로 돌리기 
			if(list_searchVO_country.size()>0) {
				for(int j=0;j<list_recipeVO.size();j++) {
					int a =0;
						for(int i=0;i<list_searchVO_country.size();i++) {
							
							if(list_recipeVO.get(j).getRecipe_category().equals(list_searchVO_country.get(i).getCountry())) {
								a=1;
								break;
							}
						}
					if(a==0) {
						list_recipeVO.remove(j);
						j--;
					}else if(a==1) {
						continue;
					}
				}
			}
//for(int i=0;i<list_recipeVO.size();i++) {
//	System.out.println("*1*레시피:"+list_recipeVO.get(i).getRecipe_no());
//}
			
			return list_recipeVO;
		}
		return list_recipeVO;
	}
	

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*찾은 레서피로 재로 가져오기*/
	/* (non-Javadoc)
	 * @see com.todayeat.search.SearchServcie#getRecipeMaterial(java.util.ArrayList)
	 */
	@Override
	public ArrayList<RecipeMaterialVO> getRecipeMaterial(ArrayList<RecipeVO> all_list_recipeVO) throws SQLException{
		System.out.println("\n--> JDBC로 getRecipeMaterial() 기능 처리");

//System.out.println("*~*"+all_list_recipeVO.get(0).getRecipe_no());
		
		ArrayList<RecipeMaterialVO> list_recipeMaterialVO = new ArrayList<RecipeMaterialVO>();
		for(int i=0;i<all_list_recipeVO.size();i++) {
			//String sql = Integer.toString(all_list_recipeVO.get(i).getRecipe_no()); //숫자를 문자로
			String sql = all_list_recipeVO.get(i).getRecipe_no()+""; //숫자를 문자로
			
				stmt = con.prepareStatement(SEARCH2);	//sql문을 실행공장에 넣우주기
				stmt.setInt(1,Integer.parseInt(sql));	//sql에 필요한 인자값 전달
				rs = stmt.executeQuery();	//실행 결과 담는 박스
				while(rs.next()) {	//박스에 있는 데이터 VO에 담고 , VO List 에 저장
					/*
					RECIPE_MATERIAL
					    recipe_no 	number(10),
					    material_food	varchar2(100),        	--레시피 재료
					    material_amo 	varchar2(100)          	--레시피 양
				    */
					RecipeMaterialVO vo = new RecipeMaterialVO();
					vo.setRecipe_no(rs.getInt("recipe_no"));
					vo.setMaterial_food(rs.getString("material_food"));
					vo.setMaterial_amo(rs.getString("material_amo"));
					list_recipeMaterialVO.add(vo);
				}
		
		}
		return list_recipeMaterialVO;
	}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*멕지들의 레시피*/
	/* (non-Javadoc)
	 * @see com.todayeat.search.SearchServcie#getMeokjiRecipeVO(java.util.ArrayList)
	 */
	@Override
	public ArrayList<RecipeVO> getMeokjiRecipeVO( ArrayList<SearchVO> list_searchVO_country) throws SQLException{
		System.out.println("\n--> JDBC로  getMeokjiRecipeVO() 기능 처리");
		ArrayList<RecipeVO> list_recipeVO = new ArrayList<RecipeVO>();
		if(list_searchVO_country.size()>0) {
			for(int i=0;i<list_searchVO_country.size();i++) {
				String sql = list_searchVO_country.get(i).getCountry();
			
					stmt = con.prepareStatement(SEARCH5);
					stmt.setString(1, sql);
					rs = stmt.executeQuery();
					while(rs.next()) {
						RecipeVO recipe = new RecipeVO();
						recipe.setRecipe_no(rs.getInt("recipe_no"));
						recipe.setRecipe_title(rs.getString("recipe_title"));
						recipe.setRecipe_intro(rs.getString("recipe_intro"));
						recipe.setRecipe_category(rs.getString("recipe_category"));
						recipe.setRecipe_tip(rs.getString("recipe_tip"));
						recipe.setRecipe_origin(rs.getString("recipe_origin"));
						recipe.setNickname(rs.getString("nickname"));
						recipe.setRecipe_good(rs.getInt("recipe_good"));
						recipe.setRecipe_bad(rs.getInt("recipe_bad"));
						recipe.setComplete_img(rs.getNString("complete_img"));
						list_recipeVO.add(recipe);
					}
					
	
				
			}
		}
		return list_recipeVO;
	}
	
	
	
	
	
	
	
	
	
}
