package com.clinic.web.search;

import java.io.Serializable;

public class KeywordCriteria implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6223611128452633797L;
	/**
	 * 
	 */
	
	private String keyword;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
