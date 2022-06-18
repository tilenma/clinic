package com.clinic.web.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import antlr.StringUtils;

import com.clinic.web.util.NumberUtil;

@Entity
@Table(name="\"CaseMedicine\"")
public class CaseMedicine implements Serializable, Comparable<CaseMedicine>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8672257064499161699L;

	@EmbeddedId
	private CaseMedicineKey caseMedicineKey=new CaseMedicineKey();
	
	@Column(name="\"unit\"")
	private BigDecimal unit;
	
	@Column(name="\"unit2\"")
	private String unit2;
	
	@Column(name="\"remark\"")
	private String remark;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="\"caseID\"", insertable = false, updatable = false)
	//@PrimaryKeyJoinColumn(name="\"caseID\"", referencedColumnName="\"caseID\"")
	//@PrimaryKeyJoinColumn(name="\"caseID\"", referencedColumnName="\"caseID2\"")
	private Cases cases;

	public CaseMedicine(){		
	}
	
	public Cases getCases() {
		return cases;
	}

	public void setCases(Cases cases) {
		this.cases = cases;
	}
	
	public Long getCaseID() {
		return caseMedicineKey.getCaseID();
	}

	public void setCaseID(Long caseID) {
		this.caseMedicineKey.setCaseID(caseID);
	}

	public String getName() {
		return caseMedicineKey.getName();
	}

	public void setName(String name) {
		this.caseMedicineKey.setName(name);
	}

	public String getType() {
		return this.caseMedicineKey.getType();
	}

	public void setType(String type) {
		this.caseMedicineKey.setType(type);
	}

	public CaseMedicine(CaseMedicineKey aCaseMedicineKey){
		this.caseMedicineKey = aCaseMedicineKey;
	}	

	public BigDecimal getUnit() {
		if(this.unit != null){
			this.unit = this.unit.setScale(2,RoundingMode.HALF_UP);
		}		
		return unit;
	}
	
	public String getDisplayUnit() {
		if(this.unit != null){
			return NumberUtil.formatPrice(this.unit);
		}
		return null;
	}

	public void setUnit(BigDecimal unit) {
		this.unit = unit;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public CaseMedicineKey getCaseMedicineKey() {
		return caseMedicineKey;
	}

	public void setCaseMedicineKey(CaseMedicineKey caseMedicineKey) {
		this.caseMedicineKey = caseMedicineKey;
	}	

	public String getUnit2() {
		return unit2;
	}

	public void setUnit2(String unit2) {
		this.unit2 = unit2;
	}

	@Override
	public int compareTo(CaseMedicine o) {
		//Sort by remark
		if(this.remark != null && o.getRemark() != null && !this.remark.isEmpty() && !o.getRemark().isEmpty() 
				&& Character.isDigit(this.remark.charAt(0)) && Character.isDigit(o.getRemark().charAt(0))){
			//System.err.println("comparing "+this.remark+" to "+o.getRemark()+" result="+this.remark.compareTo(o.getRemark()));			
			return this.remark.compareTo(o.getRemark());
		}
		else if(this.remark != null && o.getRemark() != null && !this.remark.isEmpty() && !o.getRemark().isEmpty() 
				&& Character.isDigit(this.remark.charAt(0)) && !Character.isDigit(o.getRemark().charAt(0))){
			return -10;
		}
		else if(this.remark != null && o.getRemark() != null && !this.remark.isEmpty() && !o.getRemark().isEmpty() 
				&& !Character.isDigit(this.remark.charAt(0)) && Character.isDigit(o.getRemark().charAt(0))){
			return 10;
		}
		else if(this.caseMedicineKey.getType() != null && o.caseMedicineKey.getType() != null 
				&& !this.caseMedicineKey.getType().isEmpty() && !o.caseMedicineKey.getType().isEmpty()){
			//Same type
			if(this.caseMedicineKey.getType().equalsIgnoreCase(o.caseMedicineKey.getType())){
				//Sort by name
				return this.getName().compareTo(o.getName());
			}
			else{
				//Different type --> sort by type
				return this.caseMedicineKey.getType().compareTo(o.caseMedicineKey.getType());
			}
		}
		
		return 0;
	}	
}
