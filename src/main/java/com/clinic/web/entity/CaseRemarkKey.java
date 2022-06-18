package com.clinic.web.entity;

import java.io.Serializable;

import javax.persistence.Column;

public class CaseRemarkKey implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5405798555302630629L;

	@Column(name="\"caseID\"", nullable = false, updatable = false)
	private Long caseID;
	
	@Column(name="\"type\"")
	private String type;
	
	public CaseRemarkKey(){
		
	}
	
	public CaseRemarkKey(Long aCaseId, String aType){
		this.caseID = aCaseId;
		this.type = aType;
	}

	public Long getCaseID() {
		return caseID;
	}

	public void setCaseID(Long caseID) {
		this.caseID = caseID;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
}
