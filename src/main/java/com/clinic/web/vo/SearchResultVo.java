package com.clinic.web.vo;

import java.io.Serializable;

public class SearchResultVo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1553711923303410153L;
	
	private Long id;
	private Long previousId;
	private Long nextId;
	private String type;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getPreviousId() {
		return previousId;
	}
	public void setPreviousId(Long previousId) {
		this.previousId = previousId;
	}
	public Long getNextId() {
		return nextId;
	}
	public void setNextId(Long nextId) {
		this.nextId = nextId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
