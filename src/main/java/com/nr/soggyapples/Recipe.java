package com.nr.soggyapples;

import java.util.ArrayList;
import java.util.List;

public class Recipe {
	
	String label;
	String image_src;
	String uri;
	String[] ingredients;
	List<String> extraIng;
	
	public Recipe(String label, String image_src, String uri, String[] ingredients) {
		this.label = label;
		this.image_src = image_src;
		this.uri = uri.split("#")[1];
		this.ingredients = ingredients;
		extraIng = new ArrayList<String>();
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getImage_src() {
		return image_src;
	}

	public void setImage_src(String image_src) {
		this.image_src = image_src;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String[] getIngredients() {
		return ingredients;
	}

	public void setIngredients(String[] ingredients) {
		this.ingredients = ingredients;
	}

	public List<String> getExtraIng() {
		return extraIng;
	}

	public void setExtraIng(List<String> extraIng) {
		this.extraIng = extraIng;
	}
	
}
