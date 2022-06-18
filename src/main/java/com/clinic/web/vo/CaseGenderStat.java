package com.clinic.web.vo;

import java.util.Date;

import com.clinic.web.util.DateUtil;

public class CaseGenderStat {
	private Date interval;
	private Integer male;
	private Integer female;
	private Integer other;
	
	public Date getInterval() {
		return interval;
	}

	public void setInterval(Date interval) {
		this.interval = interval;
	}

	public String getDisplayInterval() {
		return DateUtil.format(this.interval);
	}
	public Integer getMale() {
		return male;
	}
	public void setMale(Integer male) {
		this.male = male;
	}
	public Integer getFemale() {
		return female;
	}
	public void setFemale(Integer female) {
		this.female = female;
	}
	public Integer getOther() {
		return other;
	}
	public void setOther(Integer other) {
		this.other = other;
	}
	
	
}
