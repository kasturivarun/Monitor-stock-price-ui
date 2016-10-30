/**
 * 
 */
package com.stock.app.pojo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


/**
 * @author varun kasturi
 *
 */

public class StockObject {
	
	private long stockId;
	private String symbol;
	private String companyName;
	
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	private BigDecimal price;
    private List<StockPriceHistoryObject> priceHistoryRecords = new ArrayList<StockPriceHistoryObject>(0);
	
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String companyName) {
		this.symbol = companyName;
	}
	public List<StockPriceHistoryObject> getPriceHistoryRecords() {
		return priceHistoryRecords;
	}
	public void setPriceHistoryRecords(
			List<StockPriceHistoryObject> priceHistoryRecords) {
		this.priceHistoryRecords = priceHistoryRecords;
	}
}
