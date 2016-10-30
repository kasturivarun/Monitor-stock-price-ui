/**
 * 
 */
package com.stock.app.ui;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.stock.app.service.StockViewService;

/**
 * @author varun kasturi
 *
 */
@Controller
public class StockViewController {

	@Autowired
	StockViewService service;
	
	 	@RequestMapping("/getAllCompanies")
	   public String getAllCompanies(ModelMap model) {
	 		System.out.println("inside controller");
	 	model.addAttribute("result", service.getAllCompanies("getAllCompanies"));
	      return "home";
	   }
	 	
	 	@RequestMapping("/addCompany")
		   public String addNewCompany(@RequestParam(value="symbol") String symbol,ModelMap model) {
	 		
	 		model.addAttribute("resultOfAddition", service.addNewCompany("addCompany",symbol));
		 	model.addAttribute("result", service.getAllCompanies("getAllCompanies"));
		    return "home";
		   }
}
