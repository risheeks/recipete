package com.nr.soggyapples;

import java.util.ArrayList;
import java.util.List;

public class Recipe {
	
	String label;
	String image_src;
	String uri;
	String url;
	String[] ingredients;
	List<String> extraIng;
	List<String> have;
	
	public Recipe() {
		
	}
	
	public Recipe(String label, String image_src, String uri, String url, String[] ingredients) {
		this.label = label;
		this.image_src = image_src;
		this.uri = uri.split("#")[1];
		this.url = url;
		this.ingredients = ingredients;
		extraIng = new ArrayList<String>();
		have = new ArrayList<String>();
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

	public List<String> getHave() {
		return have;
	}

	public void setHave(List<String> have) {
		this.have = have;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}
