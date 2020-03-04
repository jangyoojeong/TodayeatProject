package com.todayeat.search;

import java.sql.SQLException;
import java.util.ArrayList;

import com.todayeat.recipe.vo.RecipeVO;


public interface SearchService {

	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	/*검색어로 DB에서 recipe 빼기*/
	ArrayList<RecipeVO> getRecipeVO(ArrayList<SearchVO> list_searchVO_query, ArrayList<SearchVO> list_searchVO_country) throws SQLException;


	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	/*찾은 레서피로 재로 가져오기*/
	ArrayList<RecipeMaterialVO> getRecipeMaterial(ArrayList<RecipeVO> all_list_recipeVO) throws SQLException;

	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	/*멕지들의 레시피*/
	ArrayList<RecipeVO> getMeokjiRecipeVO(ArrayList<SearchVO> list_searchVO_country) throws SQLException;
}
