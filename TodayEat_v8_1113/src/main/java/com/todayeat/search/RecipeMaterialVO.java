package com.todayeat.search;

public class RecipeMaterialVO {
	//
	private int		recipe_no;
	private String	material_food;
	private String	material_amo;
	//
	public String getMaterial_amo() {
		return material_amo;
	}
	public void setMaterial_amo(String material_amo) {
		this.material_amo = material_amo;
	}
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public String getMaterial_food() {
		return material_food;
	}
	public void setMaterial_food(String material_food) {
		this.material_food = material_food;
	}
	
}
