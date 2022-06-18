package com.clinic.web.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.clinic.web.util.DateUtil;

public class PriceStat {
	private Date interval;
	
	private BigDecimal price;
	
	public Date getInterval() {
		return interval;
	}

	public void setInterval(Date interval) {
		this.interval = interval;
	}

	public String getDisplayInterval() {
		return DateUtil.format(this.interval);
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
	public Integer getIntPrice() {
		if(price == null) {
			return 0;
		}
		return price.toBigInteger().intValueExact();
	}
	
	
}
