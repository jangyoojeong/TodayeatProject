package com.todayeat.season.vo;

import java.util.ArrayList;

import com.todayeat.recipe.vo.RecipeVO;

public class SeasonPage {
	private int total; //진짜 총 페이지수
	private int currentPage; //현재 페이지	
	private ArrayList<RecipeVO> rvo; //댓글 리스트를 가져오기 위해 
	private int totalPages;	//페이지가 보여지는 총 페이지 수
	private int startPage; //시작 페이지
	private int endPage; //끝 페이지
	

	public SeasonPage(int total, int currentPage, int size, ArrayList<RecipeVO> rvo) {
		this.total = total;
		this.currentPage = currentPage;
		this.rvo = rvo;
		
		if(total == 0) {	
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {			
			totalPages = total / size;
				
			if(total % size>0) {
				totalPages++;
			}
			
			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			
			if(modVal == 0) {
				startPage -=5;
			}
				
			endPage = startPage + 4;
				
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
			
	}
		

	public int getTotal() {
		return total;
	}

	public boolean hasNoArticles() {
		return total == 0;
	}
	
	public boolean hasArticles() {
		return total > 0;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}
	
	public ArrayList<RecipeVO> getRvo() {
		return rvo;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}

}