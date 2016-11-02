/**
 * 
 */
package com.stock.app.ui;


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
	
	 	@RequestMapping("/")
	   public String getAllCompanies(ModelMap model) {
	 		
	 	model.addAttribute("result", service.getAllCompanies("getAllCompanies"));
	      return "home";
	   }
	 	
	 	@RequestMapping("/getAllCompanies")
		   public String getAllCompanies2(ModelMap model) {
		 		
		 	model.addAttribute("result", service.getAllCompanies("getAllCompanies"));
		      return "home";
		   }
	 	
	 	@RequestMapping("/addCompany")
		   public String addNewCompany(@RequestParam(value="symbol") String symbol,ModelMap model) {
	 		
	 		model.addAttribute("resultOfAddition", service.addNewCompany("addCompany",symbol));
		 	model.addAttribute("result", service.getAllCompanies("getAllCompanies"));
		    return "home";
		   }
	 	
	 	@RequestMapping("/deleteCompany")
		   public String deleteCompany(@RequestParam(value="IdToDelete") String symbol,ModelMap model) {
	 		
	 		model.addAttribute("resultOfDeletion", service.deleteCompany("deleteCompany",symbol));
		 	model.addAttribute("result", service.getAllCompanies("getAllCompanies"));
		    return "home";
		   }
	 	
	 	@RequestMapping("/getCompany")
		   public String getCompany(@RequestParam(value="IdToShow") String symbol,ModelMap model) {
	 		
	 		model.addAttribute("resultOfGetCompany", service.getCompany("getCompany",symbol));
	 		model.addAttribute("company", symbol);
		    return "companyDetail";
		   }
}
