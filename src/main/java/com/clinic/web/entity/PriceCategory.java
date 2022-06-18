package com.clinic.web.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="\"PriceCategory\"")
public class PriceCategory {
	@Id
	@Column(name="\"category\"")	
	private String category;
	
	@Column(name="\"weight\"")
	private BigDecimal weight;	

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	public BigDecimal getWeight() {
		return weight;
	}

	public void setWeight(BigDecimal weight) {
		this.weight = weight;
	}
}
