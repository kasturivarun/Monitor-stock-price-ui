/**
 * 
 */
package com.stock.app.pojo;

import java.math.BigDecimal;
import java.util.Date;


/**
 * @author varun kasturi
 *
 */
public class StockPriceHistoryObject {
    private Long id;
	private StockObject stockId;
	 
	private BigDecimal lastTradePrice;
	 
	private Date lastUpdateTime;

	public StockObject getStockId() {
		return stockId;
	}

	public void setStockId(StockObject stockObject) {
		this.stockId = stockObject;
	}

	public BigDecimal getLastTradePrice() {
		return lastTradePrice;
	}

	public void setLastTradePrice(BigDecimal lastTradePrice) {
		this.lastTradePrice = lastTradePrice;
	}

	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

}
