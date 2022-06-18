package com.clinic.web.vo;

import java.util.Date;

import com.clinic.web.util.DateUtil;

public class CaseStat {
	private Date interval;
	
	private Integer count;

	public Date getInterval() {
		return interval;
	}

	public void setInterval(Date interval) {
		this.interval = interval;
	}

	public String getDisplayInterval() {
		return DateUtil.format(this.interval);
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	
}
