package com.clinic.web.form;

import java.util.Date;

public class ReportForm {
	private Long caseID;
	
	private String lang;
	
	private String startDateStr;
	
	private String endDateStr;
	
	private Integer noOfDate;
	
	private String path;
	
	private String issueDateStr;

	public Long getCaseID() {
		return caseID;
	}

	public void setCaseID(Long caseID) {
		this.caseID = caseID;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	public Integer getNoOfDate() {
		return noOfDate;
	}

	public void setNoOfDate(Integer noOfDate) {
		this.noOfDate = noOfDate;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getIssueDateStr() {
		return issueDateStr;
	}

	public void setIssueDateStr(String issueDateStr) {
		this.issueDateStr = issueDateStr;
	}

	
	
}
