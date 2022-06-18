package com.clinic.web.vo;

import java.util.Date;

import com.clinic.web.util.DateUtil;

public class CaseEffectVo {
	private Long caseID;
	
	private String type;
	
	private Integer effect;

	private Boolean reset;
	
	private Long customerID;
	
	private Date date;

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

	public Integer getEffect() {
		return effect;
	}

	public void setEffect(Integer effect) {
		this.effect = effect;
	}

	public Boolean getReset() {
		return reset;
	}

	public void setReset(Boolean reset) {
		this.reset = reset;
	}

	public Long getCustomerID() {
		return customerID;
	}

	public void setCustomerID(Long customerID) {
		this.customerID = customerID;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getDisplayDate() {
		return DateUtil.getYear(this.date)+","+(DateUtil.getMonth(this.date))+","+DateUtil.getDay(this.date);
	}
	
	
	
}
