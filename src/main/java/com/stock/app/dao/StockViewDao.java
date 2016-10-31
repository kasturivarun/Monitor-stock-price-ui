package com.stock.app.dao;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.Date;
import java.net.HttpURLConnection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stock.app.pojo.StockObject;
import com.stock.app.pojo.StockPriceHistoryObject;

@Service
public class StockViewDao {

	@Autowired
	StockRestConnection conn;
	

	public List<StockObject> getAllCompanies(String action) {
		
		System.out.println("inside dao");
		List<StockObject> output = new ArrayList<StockObject>();
		InputStream in = null;
		String outputString = "";
		try {
		HttpURLConnection urlConnection = conn.getConnection(action);
			urlConnection.connect();
			if (urlConnection.getResponseCode() != 200) {
	   			System.out.println("Failed : HTTP error code : "
	   					+ urlConnection.getResponseCode());
	   		}
	    
	           in = new BufferedInputStream(urlConnection.getInputStream());
		
        } catch (Exception e ) {
 
           System.out.println(e.getMessage());
 
           return null;
 
        }    
       
       
       try{
           BufferedReader reader = new BufferedReader(new InputStreamReader(in, "iso-8859-1"), 8);
           StringBuilder sb = new StringBuilder();
           String line = null;
           while ((line = reader.readLine()) != null) {
        	   //System.out.println(line);
               sb.append(line + "\n");
           }
           outputString = sb.toString();
           
           JSONArray jsonArray = JSONArray.fromObject(outputString);
           for(int i = 0; i < jsonArray.size(); i++){
        	   JSONObject jsonObject = (JSONObject) jsonArray.get(i);
        	   StockObject newObject = new StockObject();
        	   newObject.setSymbol(jsonObject.get("symbol").toString());
        	   double price = (Double) jsonObject.get("price");
        	   newObject.setPrice(BigDecimal.valueOf(price));
        	   newObject.setCompanyName(jsonObject.get("companyName").toString());
        	   //System.out.println(jsonObject.get("priceHistoryRecords"));
        	   output.add(newObject);
        	}
           
           in.close();
       } catch (Exception e) {
           System.out.println("Buffer Error"+ "Error converting result " + e.toString());
       }
	return output;
	}

	public boolean addCompany(String action, String symbol) {

		String outputString = "";
		String url = action+"?symbol="+symbol;
		InputStream in = null;
		try {
			HttpURLConnection urlConnection = conn.getConnection(url);
				urlConnection.connect();
				if (urlConnection.getResponseCode() != 200) {
		   			System.out.println("Failed : HTTP error code : "
		   					+ urlConnection.getResponseCode());
		   		}
		    
		           in = new BufferedInputStream(urlConnection.getInputStream());
			
	        } catch (Exception e ) {
	 
	           System.out.println(e.getMessage());
	 
	           return false;
	 
	        }
		 try{
	           BufferedReader reader = new BufferedReader(new InputStreamReader(in, "iso-8859-1"), 8);
	           StringBuilder sb = new StringBuilder();
	           String line = null;
	           while ((line = reader.readLine()) != null) {
	        	   //System.out.println(line);
	               sb.append(line + "\n");
	           }
	           outputString = sb.toString();
	           in.close();
	       } catch (Exception e) {
	           System.out.println("Buffer Error"+ "Error converting result " + e.toString());
	       }
		 if(outputString == "false"){
			 return false;
		 }
		 else{
			 return true;
		 }
	}
	
	public boolean deleteCompany(String action, String symbol) {

		String outputString = "";
		String url = action+"?symbol="+symbol;
		InputStream in = null;
		try {
			HttpURLConnection urlConnection = conn.getConnection(url);
				urlConnection.connect();
				if (urlConnection.getResponseCode() != 200) {
		   			System.out.println("Failed : HTTP error code : "
		   					+ urlConnection.getResponseCode());
		   		}
		    
		           in = new BufferedInputStream(urlConnection.getInputStream());
			
	        } catch (Exception e ) {
	 
	           System.out.println(e.getMessage());
	 
	           return false;
	 
	        }
		 try{
	           BufferedReader reader = new BufferedReader(new InputStreamReader(in, "iso-8859-1"), 8);
	           StringBuilder sb = new StringBuilder();
	           String line = null;
	           while ((line = reader.readLine()) != null) {
	        	   //System.out.println(line);
	               sb.append(line + "\n");
	           }
	           outputString = sb.toString();
	           in.close();
	       } catch (Exception e) {
	           System.out.println("Buffer Error"+ "Error converting result " + e.toString());
	       }
		 if(outputString == "false"){
			 return false;
		 }
		 else{
			 return true;
		 }
	}

	public List<StockPriceHistoryObject> getCompany(String action, String symbol) {
		
		List<StockPriceHistoryObject> output = new ArrayList<StockPriceHistoryObject>();
		InputStream in = null;
		String url = action+"?symbol="+symbol;
		String outputString = "";
		try {
		HttpURLConnection urlConnection = conn.getConnection(url);
			urlConnection.connect();
			if (urlConnection.getResponseCode() != 200) {
	   			System.out.println("Failed : HTTP error code : "
	   					+ urlConnection.getResponseCode());
	   		}
	    
	           in = new BufferedInputStream(urlConnection.getInputStream());
		
        } catch (Exception e ) {
 
           System.out.println(e.getMessage());
 
           return null;
 
        }    
       
       
       try{
           BufferedReader reader = new BufferedReader(new InputStreamReader(in, "iso-8859-1"), 8);
           StringBuilder sb = new StringBuilder();
           String line = null;
           while ((line = reader.readLine()) != null) {
        	   //System.out.println(line);
               sb.append(line + "\n");
           }
           outputString = sb.toString();
           
           JSONArray jsonArray = JSONArray.fromObject(outputString);
           for(int i = 0; i < jsonArray.size(); i++){
        	   JSONObject jsonObject = (JSONObject) jsonArray.get(i);
        	   StockPriceHistoryObject newObject = new StockPriceHistoryObject();
        	   double price = (Double) jsonObject.get("lastTradePrice");
        	   newObject.setLastTradePrice(BigDecimal.valueOf(price));
        	   System.out.println(newObject.getLastTradePrice());
        	   String dateInString = jsonObject.get("lastUpdateTime").toString();
        	   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	   System.out.println(dateInString);
        	   Date date = formatter.parse(dateInString);
        	   String outputDate = formatter.format(date);
        	   newObject.setLastUpdateTime(date);
        	   /*System.out.println(newObject.getLastUpdateTime());
        	   System.out.println("output:"+date);*/
        	   
        	   output.add(newObject);
        	}
           
           in.close();
       } catch (Exception e) {
           System.out.println("Buffer Error"+ "Error converting result " + e.toString());
       }
	return output;
	}

}
