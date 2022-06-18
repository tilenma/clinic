package com.clinic.web.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;

import com.clinic.web.util.DateUtil;

public class ReportVo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4592572060072980960L;

	private Long caseID;
	
	private String wrappedCaseID;
	
	private Long customerID;
	
	private String customerName;
	
	private Date date;
	
	private String diagnosis;
	
	private String sickness;
	
	private Integer dosage;
	
	private BigDecimal price;
	
	private List<MedicineVo> medicines;
	
	private String dosageRemark;
	
	private String dosageMethod;
	
	private String dosageRecomment;
	
	private Integer redispense;
	
	private Date expiryDate;
	
	private String doctor;
	
	private String registerNo;
	
	private String receiptRemark;	
	
	private String followupRemark;
	
	private String certRemark;
	
	private String reportRemark;
	
	private String startDateStr;
	
	private String endDateStr;
	
	private Integer noOfDate;
	
	private Date issueDate;

	public Long getCaseID() {
		return caseID;
	}

	public void setCaseID(Long caseID) {
		this.caseID = caseID;
	}

	public String getWrappedCaseID() {
		return wrappedCaseID;
	}

	public void setWrappedCaseID(String wrappedCaseID) {
		this.wrappedCaseID = wrappedCaseID;
	}

	public Long getCustomerID() {
		return customerID;
	}

	public void setCustomerID(Long customerID) {
		this.customerID = customerID;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public Date getDate() {
		return date;
	}
	
	public String getDisplayDate(){
		return DateUtil.format(this.date);
	}
	
	public String getDisplayDateWithMarker(){
		return DateUtil.formatWithMarker(this.date);
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getDosage() {
		return dosage;
	}

	public void setDosage(Integer dosage) {
		this.dosage = dosage;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public List<MedicineVo> getMedicines() {
		return medicines;
	}

	public void setMedicines(List<MedicineVo> medicines) {
		this.medicines = medicines;
	}

	public String getDosageRemark() {
		return dosageRemark;
	}

	public void setDosageRemark(String dosageRemark) {
		this.dosageRemark = dosageRemark;
	}

	public String getDosageMethod() {
		return dosageMethod;
	}

	public void setDosageMethod(String dosageMethod) {
		this.dosageMethod = dosageMethod;
	}

	public String getDosageRecomment() {
		return dosageRecomment;
	}

	public void setDosageRecomment(String dosageRecomment) {
		this.dosageRecomment = dosageRecomment;
	}

	public Integer getRedispense() {
		return redispense;
	}

	public void setRedispense(Integer redispense) {
		this.redispense = redispense;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}
	public String getDisplayExpiryDate(){
		return DateUtil.format(this.expiryDate);
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}

	public String getRegisterNo() {
		return registerNo;
	}

	public void setRegisterNo(String registerNo) {
		this.registerNo = registerNo;
	}

	public String getDiagnosis() {
		return diagnosis;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

	public String getSickness() {
		return sickness;
	}
	public void setSickness(String sickness) {
		this.sickness = sickness;
	}

	public String getReceiptRemark() {
		return receiptRemark;
	}

	public void setReceiptRemark(String receiptRemark) {
		this.receiptRemark = receiptRemark;
	}

	public String getFollowupRemark() {
		return followupRemark;
	}

	public void setFollowupRemark(String followupRemark) {
		this.followupRemark = followupRemark;
	}

	public String getCertRemark() {
		return certRemark;
	}

	public void setCertRemark(String certRemark) {
		this.certRemark = certRemark;
	}

	public String getReportRemark() {
		return reportRemark;
	}

	public void setReportRemark(String reportRemark) {
		this.reportRemark = reportRemark;
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

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}	
	
}
