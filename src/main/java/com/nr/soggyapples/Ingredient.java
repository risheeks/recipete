package com.nr.soggyapples;

public class Ingredient {
	String ingredient;
	String weight;
	
	public Ingredient(String ingredient, String weight) {
		this.ingredient = ingredient;
		this.weight = weight;
	}
	
	
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
}
