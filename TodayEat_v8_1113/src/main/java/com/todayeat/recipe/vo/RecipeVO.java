package com.todayeat.recipe.vo;

public class RecipeVO {

	private String recipe_no_s;
	private int recipe_no;
	private String recipe_title;
	private String recipe_intro;
	private String recipe_category;
	private String recipe_tip;
	private String recipe_origin;
	private String nickname;
	private int recipe_good;
	private int recipe_bad;
	private String complete_img;
	private int reply_total;
	
	private String material_food;
	private String material_amo;
	
	private String st_no;
	private String st_content;
	private String st_image;
	
	//////////////////////////
	//댓글
	
	private int reply_no;
	private String reply_date;
	private String reply_content;
	private String reply_score;
	private String member_profile;
	

	public RecipeVO() {}
	

	public RecipeVO(int recipe_no, String recipe_title, String recipe_intro, String recipe_category, String recipe_tip,
			String recipe_origin, String nickname, int recipe_good, int recipe_bad, String material_food,
			String material_amo, String st_no, String st_content, String st_image, String complete_img) {
		this.recipe_no = recipe_no;
		this.recipe_title = recipe_title;
		this.recipe_intro = recipe_intro;
		this.recipe_category = recipe_category;
		this.recipe_tip = recipe_tip;
		this.recipe_origin = recipe_origin;
		this.nickname = nickname;
		this.recipe_good = recipe_good;
		this.recipe_bad = recipe_bad;
		this.material_food = material_food;
		this.material_amo = material_amo;
		this.st_no = st_no;
		this.st_content = st_content;
		this.st_image = st_image;
		this.complete_img = complete_img;
	}

	public RecipeVO(int recipe_no, String recipe_title, String recipe_intro, String recipe_category, String recipe_tip,
			String recipe_origin, String nickname, int recipe_good, int recipe_bad, String complete_img) {
		super();
		this.recipe_no = recipe_no;
		this.recipe_title = recipe_title;
		this.recipe_intro = recipe_intro;
		this.recipe_category = recipe_category;
		this.recipe_tip = recipe_tip;
		this.recipe_origin = recipe_origin;
		this.nickname = nickname;
		this.recipe_good = recipe_good;
		this.recipe_bad = recipe_bad;
		this.complete_img = complete_img;
	}

	public RecipeVO(String material_food, String meterial_amo) {
		super();
		this.material_food = material_food;
		this.material_amo = meterial_amo;
	}

	public RecipeVO(String st_no, String st_content, String st_image) {
		super();
		this.st_no = st_no;
		this.st_content = st_content;
		this.st_image = st_image;
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


	public String getRecipe_intro() {
		return recipe_intro;
	}


	public void setRecipe_intro(String recipe_intro) {
		this.recipe_intro = recipe_intro;
	}


	public String getRecipe_category() {
		return recipe_category;
	}


	public void setRecipe_category(String recipe_category) {
		this.recipe_category = recipe_category;
	}


	public String getRecipe_tip() {
		return recipe_tip;
	}


	public void setRecipe_tip(String recipe_tip) {
		this.recipe_tip = recipe_tip;
	}


	public String getRecipe_origin() {
		return recipe_origin;
	}


	public void setRecipe_origin(String recipe_origin) {
		this.recipe_origin = recipe_origin;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
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


	public String getMaterial_food() {
		return material_food;
	}


	public void setMaterial_food(String material_food) {
		this.material_food = material_food;
	}


	public String getMaterial_amo() {
		return material_amo;
	}


	public void setMaterial_amo(String material_amo) {
		this.material_amo = material_amo;
	}

	public String getSt_no() {
		return st_no;
	}


	public void setSt_no(String st_no) {
		this.st_no = st_no;
	}


	public String getSt_content() {
		return st_content;
	}


	public void setSt_content(String st_content) {
		this.st_content = st_content;
	}


	public String getSt_image() {
		return st_image;
	}


	public void setSt_image(String st_image) {
		this.st_image = st_image;
	}


	public String getComplete_img() {
		return complete_img;
	}


	public void setComplete_img(String complete_img) {
		this.complete_img = complete_img;
	}	
	
	public int getReply_no() {
		return reply_no;
	}


	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}


	public String getReply_date() {
		return reply_date;
	}


	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}


	public String getReply_content() {
		return reply_content;
	}


	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}


	public String getReply_score() {
		return reply_score;
	}


	public void setReply_score(String reply_score) {
		this.reply_score = reply_score;
	}


	public String getMember_profile() {
		return member_profile;
	}


	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}


	public int getReply_total() {
		return reply_total;
	}


	public void setReply_total(int reply_total) {
		this.reply_total = reply_total;
	}


	public String getRecipe_no_s() {
		return recipe_no_s;
	}


	public void setRecipe_no_s(String recipe_no_s) {
		this.recipe_no_s = recipe_no_s;
	}
	

	
}
