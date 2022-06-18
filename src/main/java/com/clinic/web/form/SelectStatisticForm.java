package com.clinic.web.form;

import java.io.Serializable;
import java.util.Date;

public class SelectStatisticForm implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2344122213732039219L;
	
	private String type;
	
	private int interval;
	
	private Date startDate;
	
	private Date endDate;
	
	private String startDateStr;
	
	private String endDateStr;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
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

	public int getInterval() {
		return interval;
	}

	public void setInterval(int interval) {
		this.interval = interval;
	}
}
