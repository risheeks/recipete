package com.nr.soggyapples;

public class Recipe {
	
	String label;
	String image_src;
	String uri;
	
	public Recipe(String label, String image_src, String uri) {
		this.label = label;
		this.image_src = image_src;
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
	
}
