package com.nr.soggyapples;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HomeController {
    
  List<String> ingredients = new ArrayList<String>();
	
  @RequestMapping(value = { "/" }, method = RequestMethod.GET)
  public String welcome(Map<String, Object> model, HttpServletRequest request) throws IOException {
	  HttpSession session = request.getSession();
	  ingredients.clear();
	  
      session.setAttribute("ingredients", ingredients);
      return "/home";
  }
  
  @RequestMapping(value = { "/" }, method = RequestMethod.POST)
  public String welcome(@RequestParam("ingredient") String ingredient, HttpServletRequest request) throws IOException {
	  if(!ingredient.equals("")) {
		  HttpSession session = request.getSession();
	  	  ingredients.add(ingredient);
	  	  session.setAttribute("ingredients", ingredients);
	  }
	  return "/home";
  }
  
  @RequestMapping(value = { "/api" }, method = RequestMethod.GET)
  public String api(Map<String, Object> model, HttpServletRequest request) throws Exception {
	  //ingredients.clear();
	  HttpSession session = request.getSession();
	  
	  String api = APIcall("chicken");
	  List<Recipe> recipes = new ArrayList<Recipe>();
	  JSONObject obj = new JSONObject(api);
	  JSONArray arr = obj.getJSONArray("hits");
      //arr = obj.getJSONArray("recipe");
      for (int i = 0; i < arr.length(); i++)
      {
    	  JSONObject item = arr.getJSONObject(i);
    	  //System.out.println(item.toString());
    	  
    	  JSONObject arr1 = item.getJSONObject("recipe");
    	  //System.out.println(arr1.toString());
          System.out.println(arr1.getString("label"));
          recipes.add(new Recipe(arr1.getString("label"), arr1.getString("image"), arr1.getString("uri")));
      }
	  
      session.setAttribute("recipes", recipes);
      return "/recipes";
  }
  
  private String APIcall(String main) throws Exception {
      String url = "https://api.edamam.com/search?app_id=a67c62b7&app_key=0c10d50f0e83492d03daffb8f64347d1&q=" + main;//movie_url + URLEncoder.encode(id, "UTF-8")+suffix;
      
      URL obj = new URL(url);
      HttpURLConnection con = (HttpURLConnection) obj.openConnection();

      // optional default is GET
      con.setRequestMethod("GET");

      //add request header
      //con.setRequestProperty("User-Agent", USER_AGENT);

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
      //System.out.println(response.toString());

  }
  
  
}