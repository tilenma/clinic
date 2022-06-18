package com.clinic.web.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="\"PriceSystem\"")
public class PriceSystem {
	
	@Id
	@Column(name="\"system_id\"")
	private Integer systemId;
	
	@Column(name="\"name\"")
	private String name;
	
	@Column(name="\"effective_date\"")
	private Date effectiveDate;
	
	@Column(name="\"consultation_fee\"")	
	private BigDecimal consultationFee;
	
	@Column(name="\"per_dose_price\"")
	private BigDecimal perDosePrice;

	@Column(name="\"extra_dose_fee\"")
	private BigDecimal extraDoseFee;	
	
	@Column(name="\"dosage_limit\"")
	private BigDecimal dosageLimit;
	
	@Column(name="\"enabled\"")
	private Boolean enabled;
	

	public Integer getSystemId() {
		return systemId;
	}

	public void setSystemId(Integer systemId) {
		this.systemId = systemId;
	}

	public BigDecimal getConsultationFee() {
		return consultationFee;
	}

	public void setConsultationFee(BigDecimal consultationFee) {
		this.consultationFee = consultationFee;
	}

	public BigDecimal getPerDosePrice() {
		return perDosePrice;
	}

	public void setPerDosePrice(BigDecimal preDosePrice) {
		this.perDosePrice = preDosePrice;
	}

	public BigDecimal getExtraDoseFee() {
		return extraDoseFee;
	}

	public void setExtraDoseFee(BigDecimal extraDoseFee) {
		this.extraDoseFee = extraDoseFee;
	}

	public BigDecimal getDosageLimit() {
		return dosageLimit;
	}

	public void setDosageLimit(BigDecimal dosageLimit) {
		this.dosageLimit = dosageLimit;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getEffectiveDate() {
		return effectiveDate;
	}

	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
}
