/**
 * 
 */
package com.stock.app.ui;

import java.awt.print.Book;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author varun kasturi
 *
 */



@Controller
public class StockViewController {

	
	static String baseUrl = "http://localhost:8080/";
	
	String getAllCompanies = "getAllCompanies";
	
	
	 	@RequestMapping("/getAllCompanies")
	   public String getAllCompanies(ModelMap model) {
	 		model.addAttribute("result", getResponse(getAllCompanies));
	      return "home";
	   }
	 
	 public String getResponse(String action){
		 
		 String resultToDisplay = "";
		 
	       InputStream in = null;
	       
	       
	       // HTTP Get
	       try {
	 
	           URL url = new URL(baseUrl+action);
	 
	           HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();

	           urlConnection.setRequestMethod("GET");
	           urlConnection.setRequestProperty("Accept", "application/json");
	           urlConnection.connect();
	           
	    
	   		if (urlConnection.getResponseCode() != 200) {
	   			System.out.println("Failed : HTTP error code : "
	   					+ urlConnection.getResponseCode());
	   		}
	    
	           in = new BufferedInputStream(urlConnection.getInputStream());
	 
	        } catch (Exception e ) {
	 
	           System.out.println(e.getMessage());
	 
	           return e.getMessage();
	 
	        }    
	       
	       
	       try{
	           BufferedReader reader = new BufferedReader(new InputStreamReader(
	        		   in, "iso-8859-1"), 8);
	           StringBuilder sb = new StringBuilder();
	           String line = null;
	           while ((line = reader.readLine()) != null) {
	               sb.append(line + "\n");
	           }
	           in.close();
	           resultToDisplay = sb.toString();
	       } catch (Exception e) {
	           System.out.println("Buffer Error"+ "Error converting result " + e.toString());
	       }
		return resultToDisplay;
		 
	 }
	
	
	
}
