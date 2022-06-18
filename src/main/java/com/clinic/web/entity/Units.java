package com.clinic.web.entity;

import java.math.BigDecimal;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="\"Units\"")
public class Units {	
	@EmbeddedId
	private UnitsKey unitsKey=new UnitsKey();	
	
	public UnitsKey getUnitsKey() {
		return unitsKey;
	}

	public void setUnitsKey(UnitsKey unitsKey) {
		this.unitsKey = unitsKey;
	}

	public String getType() {
		return unitsKey.getType();
	}

	public void setType(String type) {
		this.unitsKey.setType(type);
	}

	public BigDecimal getValue() {
		return this.unitsKey.getValue();
	}

	public void setValue(BigDecimal value) {
		this.unitsKey.setValue(value);
	}
}
