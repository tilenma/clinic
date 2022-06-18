package com.clinic.web.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="\"CaseStatistic\"")
public class CaseStatistic implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8317852606542749392L;
	
	@EmbeddedId
	private CaseRemarkKey caseRemarkKey = new CaseRemarkKey();
		
	@Column(name="\"effect\"")
	private Integer effect;
	
	@Column(name="\"reset\"")
	private Boolean reset;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="\"caseID\"", insertable = false, updatable = false)
	private Cases cases;
	
	public CaseStatistic() {
		//dummy constructor
	}
	
	public CaseStatistic(CaseRemarkKey aKey) {
		this.caseRemarkKey = aKey;
	}

	public CaseRemarkKey getCaseRemarkKey() {
		return caseRemarkKey;
	}

	public void setCaseRemarkKey(CaseRemarkKey caseRemarkKey) {
		this.caseRemarkKey = caseRemarkKey;
	}

	public Integer getEffect() {
		return effect;
	}

	public void setEffect(Integer effect) {
		this.effect = effect;
	}
	
	public Cases getCases() {
		return cases;
	}

	public void setCases(Cases cases) {
		this.cases = cases;
	}
	
	public String getType() {
		return this.caseRemarkKey.getType();
	}

	public void setType(String type) {
		this.caseRemarkKey.setType(type);
	}

	public Boolean getReset() {
		return reset;
	}

	public void setReset(Boolean reset) {
		this.reset = reset;
	}
	
}
