package com.clinic.web.search;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class CaseCriteria implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3421374221666999541L;
	
	private Long caseID;
	
	private String customerName;
	
	private Date fromDate;
	
	private Date toDate;
	
	private String fromDateStr;
	
	private String toDateStr;
	
	private String problem;
	
	private String sickness;
	
	private BigDecimal fromPrice;
	
	private BigDecimal toPrice;
	
	private Long customerID;
	
	private String userName;
	
	private boolean isAdmin;

	public Long getCaseID() {
		return caseID;
	}

	public void setCaseID(Long caseID) {
		this.caseID = caseID;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	public String getSickness() {
		return sickness;
	}

	public void setSickness(String sickness) {
		this.sickness = sickness;
	}

	public BigDecimal getFromPrice() {
		return fromPrice;
	}

	public void setFromPrice(BigDecimal fromPrice) {
		this.fromPrice = fromPrice;
	}

	public BigDecimal getToPrice() {
		return toPrice;
	}

	public void setToPrice(BigDecimal toPrice) {
		this.toPrice = toPrice;
	}

	public String getFromDateStr() {
		return fromDateStr;
	}

	public void setFromDateStr(String fromDateStr) {
		this.fromDateStr = fromDateStr;
	}

	public String getToDateStr() {
		return toDateStr;
	}

	public void setToDateStr(String toDateStr) {
		this.toDateStr = toDateStr;
	}

	public Long getCustomerID() {
		return customerID;
	}

	public void setCustomerID(Long customerID) {
		this.customerID = customerID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

}
