package com.clinic.web.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="\"CaseRemark\"")
public class CaseRemark implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -816062264447675235L;

	@EmbeddedId
	private CaseRemarkKey caseRemarkKey = new CaseRemarkKey();
	
	@Column(name="\"description\"")
	private String description;
	
	public CaseRemark(){
		//dull constructor
	}
	
	public CaseRemark(CaseRemarkKey aKey, String aDescription){
		this.caseRemarkKey = aKey;
		this.description = aDescription;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public CaseRemarkKey getCaseRemarkKey() {
		return caseRemarkKey;
	}

	public void setCaseRemarkKey(CaseRemarkKey caseRemarkKey) {
		this.caseRemarkKey = caseRemarkKey;
	}
	
	public String getType() {
		return this.caseRemarkKey.getType();
	}

	public void setType(String type) {
		this.caseRemarkKey.setType(type);
	}
}
