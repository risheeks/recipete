package com.nr.soggyapples;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HomeController {
  
  //List containing all the ingredients added to the search
  List<String> ingredients = new ArrayList<String>();
  List<String> health = new ArrayList<String>();
  List<Recipe> recipes;
  
  @RequestMapping(value = { "/" }, method = RequestMethod.GET)
  public String welcome(Map<String, Object> model, HttpServletRequest request) throws IOException {
	  HttpSession session = request.getSession();
	  ingredients.clear();
	  health.clear();
      session.setAttribute("ingredients", ingredients);
      return "/home";
  }
  
  
  //Called when the user attempts to add ingredients to the list of ingredients
  @RequestMapping(value = { "/" }, method = RequestMethod.POST)
  public String welcome(@RequestParam("ingredient") String ingredient, HttpServletRequest request) throws IOException {
	  if(!ingredient.trim().equals("") && !ingredients.contains(ingredient.trim())) {
		  HttpSession session = request.getSession();
		  ingredients.add(ingredient);
	  	  session.setAttribute("ingredients", ingredients);
	  }
	  return "/home";
  }
  
  
  //Called when the user attempts to add ingredients to the list of ingredients
  @RequestMapping(value = { "/remove-{ingredient}" }, method = RequestMethod.GET)
  public String remove(HttpServletRequest request, @PathVariable String ingredient) throws IOException {
	  HttpSession session = request.getSession();
	  String p="";
	  for (String s: ingredients) {
		  if(s.equals(ingredient)) p=s;
	  }
	  System.out.println("Removing " + p);
	  ingredients.remove(p);
      session.setAttribute("ingredients", ingredients);
	  return "/home";
  }
  
  
  //Called when the user searches for recipes using a main ingredient
  @RequestMapping(value = { "/api" }, method = RequestMethod.GET)
  public String api(@RequestParam("main") String mainIng, @RequestParam("type") String type, HttpServletRequest request) throws Exception {
	  HttpSession session = request.getSession();
	  session.setAttribute("main", mainIng);
	  System.out.println(request.getParameterMap().containsKey("vegan"));
	  System.out.println(request.getParameterMap().containsKey("veg"));
	  System.out.println(request.getParameterMap().containsKey("peanut"));
	  
	  if(request.getParameterMap().containsKey("vegan")) {
		  health.add("vegan");
	  }
	  if(request.getParameterMap().containsKey("veg")) {
		  health.add("vegetarian");
	  }
	  if(request.getParameterMap().containsKey("peanut")) {
		  health.add(URLEncoder.encode("peanut-free", "UTF-8"));
	  }
	  
	  String api = APIcall(mainIng, type);
	  recipes = new ArrayList<Recipe>();
	  JSONObject obj = new JSONObject(api);
	  JSONArray arr = obj.getJSONArray("hits");
      for (int i = 0; i < arr.length(); i++)
      {
    	  JSONObject item = arr.getJSONObject(i);
    	  JSONObject arr1 = item.getJSONObject("recipe");
    	  JSONArray ingredients = arr1.getJSONArray("ingredients");
    	  String[] aing = new String[ingredients.length()];
    	  for (int j = 0; j < ingredients.length(); j++)
          {
    		  JSONObject ingredient = ingredients.getJSONObject(j);
    		  aing[j] = ingredient.getString("text");
          }
    	  
          recipes.add(new Recipe(arr1.getString("label"), arr1.getString("image"), arr1.getString("uri"), aing));
      }
      ingredients.add(mainIng);
      //System.out.println(mainIng);
	  recipes = sort(recipes);
	  Collections.sort(recipes, new SortbyExtraIng());
      session.setAttribute("recipes", recipes);
      return "/recipes";
  }
  
//Called when the user searches for recipes using a main ingredient
  @RequestMapping(value = { "/pick-{recipe}" }, method = RequestMethod.GET)
  public String pickRecipe(@PathVariable String recipe, HttpServletRequest request) throws Exception {
	  HttpSession session = request.getSession();
	  Recipe rec = new Recipe();
	  for(Recipe p: recipes) {
		  if(p.uri.equals(recipe)) {
			  rec = p;
		  }
	  }
	  System.out.println("image_src: " + rec.label);
	  session.setAttribute("rec", rec);
	  return "/pick";
  }
  
  //The service for the API call with gets the recipes list based on the main ingredient "main"
  private String APIcall(String main, String type) throws Exception {
	  if(type.equals("1")) {
		  type = "low-sodium";
	  } else if(type.equals("2")) {
		  type = "low-carb";
	  } else if(type.equals("3")) {
		  type = "low-fat";
	  } else if(type.equals("4")) {
		  type = "balanced";
	  } else if(type.equals("5")) {
		  type = "high-protein";
	  } else if(type.equals("6")) {
		  type = "high-fiber";
	  }
	  
      String url = "https://api.edamam.com/search?app_id=a67c62b7&app_key=0c10d50f0e83492d03daffb8f64347d1&to=30&q=" + URLEncoder.encode(main, "UTF-8") + "&diet=" + type;
      
      for(String s: health) {
    	  url += "&health=" + s;
      }
      
      URL obj = new URL(url);
      HttpURLConnection con = (HttpURLConnection) obj.openConnection();

      // optional, default is GET
      con.setRequestMethod("GET");

      //add request header
      int responseCode = con.getResponseCode();
      System.out.println("\nSending 'GET' request to URL : " + url);
      System.out.println("Response Code : " + responseCode);

      BufferedReader in = new BufferedReader(
              new InputStreamReader(con.getInputStream()));
      String inputLine;
      StringBuffer response = new StringBuffer();

      while ((inputLine = in.readLine()) != null) {
          response.append(inputLine);
      }
      in.close();
      return response.toString();
  }
  
  private List<Recipe> sort(List<Recipe> recipes) {
	  List<Recipe> sr = new ArrayList<Recipe>();
	  for(int i=0; ; i++) {
		  for(Recipe r: recipes) {
			  if(sr.contains(r)) continue;
			  containsAll(r);
			  if(r.extraIng.size() > i) {
				  sr.add(r);
			  }
		  }
		  
		  if(sr.size() == recipes.size()) {
			  break;
		  }
		  
	  }	  
	  return sr;
  }
  
  private void containsAll(Recipe r) {
	  boolean check = false;
	  //int leave = 0;
	  //System.out.println(left + r.extraIng);
	  for(String s: r.ingredients) {
		  check = false;
		  for(String t: ingredients) {
			  if(s.contains(t) || t.contains(s)) {
				  //System.out.println(r.label + ": " + s + ", size: " + r.ingredients.length);
				  check = true;
				  r.have.add(s);
			  }
		  }
		  if(check == false) {
			  //leave++;
			  r.extraIng.add(s);
		  }
	  }
	  //System.out.println("Leaving: " + r.extraIng.size());
	  //if(leave == left) return false;
	  //return true;
  }
  
  @RequestMapping(value = { "/error" }, method = RequestMethod.GET)
  public String error() throws IOException {
	  return "/error";
  }
  
}

class SortbyExtraIng implements Comparator<Recipe> 
{ 
    // Used for sorting in ascending order of 
    // roll number 
    public int compare(Recipe a, Recipe b) 
    { 
        return a.extraIng.size() - b.extraIng.size(); 
    } 
} 