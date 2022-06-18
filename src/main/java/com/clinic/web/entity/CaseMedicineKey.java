package com.clinic.web.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CaseMedicineKey implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 9082280041317230622L;

	@Column(name="\"caseID\"", nullable = false, updatable = false)
	private Long caseID;
	
	@Column(name="\"name\"")
	private String name;
	
	@Column(name="\"type\"")
	private String type;
	
	public CaseMedicineKey(){		
	}
	
	public CaseMedicineKey(Long aCaseID, String aType, String aName){
		this.caseID = aCaseID;
		this.name = aName;
		this.type = aType;
	}

	public Long getCaseID() {
		return caseID;
	}

	public void setCaseID(Long caseID) {
		this.caseID = caseID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
}
