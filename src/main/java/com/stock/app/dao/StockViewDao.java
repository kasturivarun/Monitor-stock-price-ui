package com.stock.app.dao;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stock.app.pojo.StockObject;

@Service
public class StockViewDao {

	@Autowired
	StockRestConnection conn;

	public String getAllCompanies(String action) {
		
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
        	   System.out.println(line);
               sb.append(line + "\n");
           }
           outputString = sb.toString();
           in.close();
       } catch (Exception e) {
           System.out.println("Buffer Error"+ "Error converting result " + e.toString());
       }
	return outputString;
	}

}
