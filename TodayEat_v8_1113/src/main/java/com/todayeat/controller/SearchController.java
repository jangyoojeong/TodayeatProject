package com.todayeat.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.todayeat.recipe.vo.RecipeVO;
import com.todayeat.search.RecipeMaterialVO;
import com.todayeat.search.SearchService;
import com.todayeat.search.SearchVO;

@Controller
public class SearchController {
	
/*	@Resource(name = "SearchService")
	
	private RecipeService searchService;*/
	@Autowired
	private SearchService searchService;
	

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*test.do */
		@RequestMapping(value = "test.do", method = { RequestMethod.POST , RequestMethod.GET}) 
		public String recipeSearch(SearchVO searchVO,  Model model) throws SQLException {
			
//			System.out.println("~~> CONTROLLER로 recipeSearch() 기능 처리");
//			System.out.println("^^"+searchVO);
//			System.out.println("^^"+searchService);
//			System.out.println("^^"+model);
			// main -> "" null -> main
			// 검색어 -> "" null -> main
			int p = 0;
			if(searchVO.getQuery()==null || searchVO.getQuery().equals("")) {
				return "search/Search";
			}else {
				// 검색어 VO 정리 (검색어가 있을때)
				ArrayList<SearchVO> list_searchVO_query = new ArrayList<SearchVO>();
				if(searchVO.getQuery().length()>0) {
					//중복제거
					String query1 = searchVO.getQuery();
	//System.out.println("-"+query1+"-");
					query1 = query1.trim();
					String[] q = query1.split(",");
					query1 = " ";
					for(int i=0;i<q.length;i++) {
						query1 += q[i];
						query1 += " ";
					}
					query1 = query1.trim();
	System.out.println("--"+query1+"--");
					String[] qq = query1.split(" +");
					ArrayList<String> list_query = new ArrayList<String>(Arrays.asList(qq));
//잘했나?
//for(int i=0;i<list_query.size();i++) {
//System.out.println("*-1*검색어:"+list_query.get(i));
//}
					if(list_query.size()>1) {
						for(int i=0;i<list_query.size()-1;i++) {
//							if(!list_query.get(i).equals("") || list_query.get(i)!=null) {
								for(int j=i+1;j<list_query.size();j++) {
									if(list_query.get(i).equals(list_query.get(j))) {
										list_query.remove(j);
										j--;
									}
								}
//							}else {
//								list_query.remove(i);
//								i--;
//							}
						}
					}
					// list_searchVO_query 에 넣기
					for(int i=0;i<list_query.size();i++) {
						SearchVO vo = new SearchVO();
						vo.setI(i);
						vo.setQuery(qq[i]);
						list_searchVO_query.add(vo);
					}
				}
	// 잘했나?
//	if(list_searchVO_query.size()>0) {
//		for(int i=0;i<list_searchVO_query.size();i++) {
//			System.out.println("*1*검색어:"+list_searchVO_query.get(i).getQuery());
//		}
//	}
				
				// 구욱적 VO 정리
				ArrayList<SearchVO> list_searchVO_country = new ArrayList<SearchVO>();
				String[] c =null;
				if(searchVO.getCountry()!=null) {
					String country1 = searchVO.getCountry();
//	System.out.println("-"+country1+"-");
					country1 = country1.trim();
					 c = country1.split(",");
					if(c.length>0) {
						for(int i=0;i<c.length;i++) {
							if(!c[i].equals("") || c[i]!=null) {
								SearchVO vo = new SearchVO();
								vo.setI(i);
								vo.setCountry(c[i]);
								list_searchVO_country.add(vo);
							}
						}
					}
	// 잘했나?
//	if(list_searchVO_query.size()>0) {
//		for(int i=0;i<list_searchVO_query.size();i++) {
//			System.out.println("*11*검색어:"+list_searchVO_query.get(i).getQuery());
//		}
//	}
					
				}
	// 잘했나?
//	if(list_searchVO_query.size()>0) {
//		for(int i=0;i<list_searchVO_query.size();i++) {
//			System.out.println("*111*검색어:"+list_searchVO_query.get(i).getQuery());
//		}
//	}
				ArrayList<RecipeVO> list_recipeVO = new ArrayList<RecipeVO>();
				ArrayList<RecipeMaterialVO> list_recipeMaterialVO = new ArrayList<RecipeMaterialVO>();
				if(list_searchVO_query.size()>0 || list_searchVO_country.size()>0) {
					
					list_recipeVO = searchService.getRecipeVO(list_searchVO_query,list_searchVO_country);
					if(list_recipeVO.size()>0) {
						list_recipeMaterialVO = searchService.getRecipeMaterial(list_recipeVO);
					}
				}
				//recipe 중복 체크는 DAO에서
				if(list_recipeVO.size()==0) {
					model.addAttribute("no_recipe",p);
				}
				model.addAttribute("list_recipeVO",list_recipeVO);
				model.addAttribute("list_recipeMaterialVO",list_recipeMaterialVO);
				model.addAttribute("list_searchVO",list_searchVO_query);
				model.addAttribute("list_country",c);
				
				
				
				return "search/Search";
			}
		}
		
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*먹지들의 레시피*/
		@RequestMapping(value = "my_recipe_search.do", method = {RequestMethod.POST ,RequestMethod.GET} ) 
		public String meokjiSearch2(SearchVO searchVO, Model model) throws SQLException {

//			System.out.println("~~> CONTROLLER로 recipeSearch() 기능 처리");
//			System.out.println("^^"+searchVO);
//			System.out.println("^^"+searchService);
//			System.out.println("^^"+model);
			// main -> "" null -> main
			// 검색어 -> "" null -> main
			int p = 0;
			if(searchVO.getQuery()==null || searchVO.getQuery().equals("")) {
				return "search/Search2";
			}else {
				// 검색어 VO 정리 (검색어가 있을때)
				ArrayList<SearchVO> list_searchVO_query = new ArrayList<SearchVO>();
				if(searchVO.getQuery().length()>0) {
					//중복제거
					String query1 = searchVO.getQuery();
	//System.out.println("-"+query1+"-");
					query1 = query1.trim();
					String[] q = query1.split(",");
					query1 = " ";
					for(int i=0;i<q.length;i++) {
						query1 += q[i];
						query1 += " ";
					}
					query1 = query1.trim();
	System.out.println("--"+query1+"--");
					String[] qq = query1.split(" +");
					ArrayList<String> list_query = new ArrayList<String>(Arrays.asList(qq));
//잘했나?
//for(int i=0;i<list_query.size();i++) {
//System.out.println("*-1*검색어:"+list_query.get(i));
//}
					if(list_query.size()>1) {
						for(int i=0;i<list_query.size()-1;i++) {
//							if(!list_query.get(i).equals("") || list_query.get(i)!=null) {
								for(int j=i+1;j<list_query.size();j++) {
									if(list_query.get(i).equals(list_query.get(j))) {
										list_query.remove(j);
										j--;
									}
								}
//							}else {
//								list_query.remove(i);
//								i--;
//							}
						}
					}
					// list_searchVO_query 에 넣기
					for(int i=0;i<list_query.size();i++) {
						SearchVO vo = new SearchVO();
						vo.setI(i);
						vo.setQuery(qq[i]);
						list_searchVO_query.add(vo);
					}
				}
	// 잘했나?
//	if(list_searchVO_query.size()>0) {
//		for(int i=0;i<list_searchVO_query.size();i++) {
//			System.out.println("*1*검색어:"+list_searchVO_query.get(i).getQuery());
//		}
//	}
				
				// 구욱적 VO 정리
				ArrayList<SearchVO> list_searchVO_country = new ArrayList<SearchVO>();
				String[] c =null;
				if(searchVO.getCountry()!=null) {
					String country1 = searchVO.getCountry();
//	System.out.println("-"+country1+"-");
					country1 = country1.trim();
					 c = country1.split(",");
					if(c.length>0) {
						for(int i=0;i<c.length;i++) {
							if(!c[i].equals("") || c[i]!=null) {
								SearchVO vo = new SearchVO();
								vo.setI(i);
								vo.setCountry(c[i]);
								list_searchVO_country.add(vo);
							}
						}
					}
	// 잘했나?
//	if(list_searchVO_query.size()>0) {
//		for(int i=0;i<list_searchVO_query.size();i++) {
//			System.out.println("*11*검색어:"+list_searchVO_query.get(i).getQuery());
//		}
//	}
					
				}
	// 잘했나?
//	if(list_searchVO_query.size()>0) {
//		for(int i=0;i<list_searchVO_query.size();i++) {
//			System.out.println("*111*검색어:"+list_searchVO_query.get(i).getQuery());
//		}
//	}
				ArrayList<RecipeVO> list_recipeVO = new ArrayList<RecipeVO>();
				ArrayList<RecipeMaterialVO> list_recipeMaterialVO = new ArrayList<RecipeMaterialVO>();
				if(list_searchVO_query.size()>0 || list_searchVO_country.size()>0) {
					
					list_recipeVO = searchService.getRecipeVO(list_searchVO_query,list_searchVO_country);
					if(list_recipeVO.size()>0) {
						list_recipeMaterialVO = searchService.getRecipeMaterial(list_recipeVO);
					}
				}
				//recipe 중복 체크는 DAO에서
				if(list_recipeVO.size()==0) {
					model.addAttribute("no_recipe",p);
				}
				model.addAttribute("list_recipeVO",list_recipeVO);
				model.addAttribute("list_recipeMaterialVO",list_recipeMaterialVO);
				model.addAttribute("list_searchVO",list_searchVO_query);
				model.addAttribute("list_country",c);
				
				
				
				return "search/Search2";
			}
		}
	
	
	
	
	
	// 먹지들의 레서피  ***님의 레서피 상세 화면
//	@RequestMapping(value = "recipe_view.do", method = RequestMethod.GET) 
//	public String recipe_view() {
//		
//		return "recipe_view";
//	}

}
