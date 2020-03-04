package com.todayeat.keep.vo;

public class KeepVO {
	
	// DB .. pk 
	private int keep_id;				// 장바구니 id ..
	private String nickname;			// nickname
	private int recipe_no; 			    // 레시피 id .. 
	
	private String keep_id_s;
	
	//recipe
	private String recipe_title;
	private int recipe_good;
	private int recipe_bad;
	private String complete_img;
	private String material_food;
	
	


	//default
	public KeepVO() {}
	
	// 전체를 가진 생성자.. 
	public KeepVO(int keep_id, int recipe_no, String nickname) {
		this.keep_id =keep_id;
		this.nickname = nickname;
		this.recipe_no = recipe_no;
	}

	// 게터세터 .. 
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public int getKeep_id() {
		return keep_id;
	}

	public void setKeep_id(int keep_id) {
		this.keep_id = keep_id;
	}
	
	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	
	public String getRecipe_title() {
		return recipe_title;
	}

	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}

	public int getRecipe_good() {
		return recipe_good;
	}

	public void setRecipe_good(int recipe_good) {
		this.recipe_good = recipe_good;
	}

	public int getRecipe_bad() {
		return recipe_bad;
	}

	public void setRecipe_bad(int recipe_bad) {
		this.recipe_bad = recipe_bad;
	}

	public String getComplete_img() {
		return complete_img;
	}

	public void setComplete_img(String complete_img) {
		this.complete_img = complete_img;
	}

	public String getMaterial_food() {
		return material_food;
	}

	public void setMaterial_food(String material_food) {
		this.material_food = material_food;
	}

	public String getKeep_id_s() {
		return keep_id_s;
	}

	public void setKeep_id_s(String keep_id_s) {
		this.keep_id_s = keep_id_s;
	}
}
