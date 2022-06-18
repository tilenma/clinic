package com.clinic.web.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="audit_log")
public class AuditLog {
	@Id
	@Column(name = "log_id")
	@SequenceGenerator(allocationSize=1, initialValue=1, sequenceName="log_id_seq", name="log_id_gen")
	@GeneratedValue(generator="log_id_gen", strategy = GenerationType.SEQUENCE)
	private Long logId;
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "action")
	private String action;
	
	@Column(name = "time")
	private Date time;
	
	@Column(name = "remark")
	private String remark;
	
	@Column(name = "case_id")
	private Integer caseId;
	
	@Column(name = "text1")
	private String text1;
	
	@Column(name = "text2")
	private String text2;
	
	@Column(name = "text3")
	private String text3;
	
	@Column(name = "date1")
	private Date date1;
	
	@Column(name = "date2")
	private Date date2;
	
	@Column(name = "date3")
	private Date date3;
	
	@Column(name = "number1")
	private BigDecimal number1;
	
	@Column(name = "number2")
	private BigDecimal number2;
	
	@Column(name = "number3")
	private BigDecimal number3;

	public Long getLogId() {
		return logId;
	}

	public void setLogId(Long logId) {
		this.logId = logId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getCaseId() {
		return caseId;
	}

	public void setCaseId(Integer caseId) {
		this.caseId = caseId;
	}

	public String getText1() {
		return text1;
	}

	public void setText1(String text1) {
		this.text1 = text1;
	}

	public String getText2() {
		return text2;
	}

	public void setText2(String text2) {
		this.text2 = text2;
	}

	public String getText3() {
		return text3;
	}

	public void setText3(String text3) {
		this.text3 = text3;
	}

	public Date getDate1() {
		return date1;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
	}

	public Date getDate2() {
		return date2;
	}

	public void setDate2(Date date2) {
		this.date2 = date2;
	}

	public Date getDate3() {
		return date3;
	}

	public void setDate3(Date date3) {
		this.date3 = date3;
	}

	public BigDecimal getNumber1() {
		return number1;
	}

	public void setNumber1(BigDecimal number1) {
		this.number1 = number1;
	}

	public BigDecimal getNumber2() {
		return number2;
	}

	public void setNumber2(BigDecimal number2) {
		this.number2 = number2;
	}

	public BigDecimal getNumber3() {
		return number3;
	}

	public void setNumber3(BigDecimal number3) {
		this.number3 = number3;
	}
	
	
}
