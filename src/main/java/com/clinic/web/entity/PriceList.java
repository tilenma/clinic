package com.clinic.web.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="\"PriceList\"")
public class PriceList {
	@Id
	@Column(name="\"category\"")	
	private String category;
	
	@Column(name="\"price\"")
	private BigDecimal price;	
	
	@Column(name="\"system_id\"")
	private Integer systemId;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getSystemId() {
		return systemId;
	}

	public void setSystemId(Integer systemId) {
		this.systemId = systemId;
	}
	
}
