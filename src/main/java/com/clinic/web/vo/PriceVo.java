package com.clinic.web.vo;

import java.io.Serializable;
import java.math.BigDecimal;

public class PriceVo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1051066359670014035L;
	
	private BigDecimal price;
	private String description;
	
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
