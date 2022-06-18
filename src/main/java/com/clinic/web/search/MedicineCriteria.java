package com.clinic.web.search;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;

public class MedicineCriteria implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6734877732893775112L;
	
	private String code2;	
	
	private String type2;	
	
	private String name2;
	
	private String priceCategory2;

	public String getCode2() {
		return code2;
	}

	public void setCode2(String code2) {
		this.code2 = code2;
	}

	public String getType2() {
		return type2;
	}

	public void setType2(String type2) {
		this.type2 = type2;
	}

	public String getName2() {
		return name2;
	}

	public void setName2(String name2) {
		this.name2 = name2;
	}

	public String getPriceCategory2() {
		return priceCategory2;
	}

	public void setPriceCategory2(String priceCategory2) {
		this.priceCategory2 = priceCategory2;
	}


	
	
}
