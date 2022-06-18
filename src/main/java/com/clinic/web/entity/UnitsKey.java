package com.clinic.web.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class UnitsKey implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6828175864814335785L;

	@Column(name="\"type\"")
	private String type;
	
	@Column(name="\"value\"")
	private BigDecimal value;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public BigDecimal getValue() {
		return value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}
}
