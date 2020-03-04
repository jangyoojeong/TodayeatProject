package com.todayeat.search;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todayeat.recipe.vo.RecipeVO;

@Service("searchService")
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SearchDAO searchDAO1;

	@Override
	public ArrayList<RecipeVO> getRecipeVO(ArrayList<SearchVO> list_searchVO_query,
			ArrayList<SearchVO> list_searchVO_country) throws SQLException {
			
			System.out.println("^^"+searchDAO1);

		return searchDAO1.getRecipeVO(list_searchVO_query, list_searchVO_country);

	}

	@Override
	public ArrayList<RecipeMaterialVO> getRecipeMaterial(ArrayList<RecipeVO> all_list_recipeVO) throws SQLException {
		return searchDAO1.getRecipeMaterial(all_list_recipeVO);
	}

	@Override
	public ArrayList<RecipeVO> getMeokjiRecipeVO(ArrayList<SearchVO> list_searchVO_country) throws SQLException {
		return searchDAO1.getMeokjiRecipeVO(list_searchVO_country);
	}

}
