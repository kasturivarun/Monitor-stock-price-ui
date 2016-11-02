package com.stock.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stock.app.dao.StockViewDao;
import com.stock.app.pojo.StockObject;
import com.stock.app.pojo.StockPriceHistoryObject;

@Service
public class StockViewService {

	@Autowired
	StockViewDao dao;

	public List<StockObject> getAllCompanies(String action) {

		return dao.getAllCompanies(action);
	}

	public boolean addNewCompany(String action, String symbol) {

		return dao.addCompany(action, symbol);
	}

	public boolean deleteCompany(String action, String symbol) {
		// TODO Auto-generated method stub
		return dao.deleteCompany(action, symbol);
	}

	public List<StockPriceHistoryObject> getCompany(String action, String symbol) {
		// TODO Auto-generated method stub
		return dao.getCompany(action, symbol);
	}

}
