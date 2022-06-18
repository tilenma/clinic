package com.clinic.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class Users {
	@Id
	@Column(name="username")
	private String username;
	
	@Column(name="enabled")
	private Boolean enabled;
	
	@Column(name="report_name")
	private String reportName;
	
	@Column(name="report_name_en")
	private String reportNameEN;
	
	@Column(name="register_no")
	private String registerNo; 

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public String getReportNameEN() {
		return reportNameEN;
	}

	public void setReportNameEN(String reportNameEN) {
		this.reportNameEN = reportNameEN;
	}

	public String getRegisterNo() {
		return registerNo;
	}

	public void setRegisterNo(String registerNo) {
		this.registerNo = registerNo;
	}
	
}
