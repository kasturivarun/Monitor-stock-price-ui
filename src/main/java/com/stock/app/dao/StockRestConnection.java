package com.stock.app.dao;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Service;

@Service
public class StockRestConnection {

	static String baseUrl = "http://localhost:8080/";
	
	public HttpURLConnection getConnection(String action, String requestMethod){
		HttpURLConnection urlConnection = null;
		URL url;
		try {
			url = new URL(baseUrl+action);
			urlConnection = (HttpURLConnection) url.openConnection();
	        urlConnection.setRequestMethod(requestMethod);
	        urlConnection.setRequestProperty("Accept", "application/json");
	        
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return urlConnection;
	}
}
