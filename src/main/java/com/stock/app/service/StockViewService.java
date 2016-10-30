package com.stock.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stock.app.dao.StockViewDao;
import com.stock.app.pojo.StockObject;

@Service
public class StockViewService {
	
	@Autowired
	StockViewDao dao;
	
	public String getAllCompanies(String action) {
		System.out.println("inside service");
		return dao.getAllCompanies(action);
	}

}
