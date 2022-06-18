package com.clinic.web.form;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;

import org.hibernate.validator.constraints.NotEmpty;

import com.clinic.web.entity.CaseMedicine;
import com.clinic.web.entity.CaseRemark;
import com.clinic.web.entity.CaseStatistic;


public class CaseForm {
	//For display only
	private Long caseID;
	private Date createTime;
	private List<CaseMedicine> medicines;
	private List<CaseRemark> remarks;
	private List<CaseStatistic> statistics;
	
	//For form input
	private Long customerID;
	
	private String customerName;
	private String dateStr;
	private String problem;
	private String sweat;
	private String coldHot;
	private String head;
	private String mouth;
	private String body;
	private String poo;
	private String pee;
	private String drink;
	private String eat;
	private String abdomen;
	private String hearing;
	private String sleep;
	private String tongueColor;
	private String tongueShape;
	private String tongueStatus;
	private String tongueLayer;
	private String pulse;
	private String skin;
	private String menstruation;
	private String sickness;
	private String diagnosis;
	private String theory;
	
	private Boolean consultationFee;
	
	private Integer dosage;
	private BigDecimal dosePrice;
	private BigDecimal price;
	private String expiryDateStr;
	private String dosageRemark;
	private String dosageMethod;
	private String dosageRecomment;
	private Integer redispense;
	
	private String receiptRemark;
	private String followupRemark;
	private String certRemark;
	private String reportRemark;
	
	//For storing action
	private String action;
	
	//For price system name
	private String priceSystem;
	
	//For medicine confirmation
	private Boolean confirm;
	private String confirmUser;
	
	public Long getCustomerID() {
		return customerID;
	}
	public void setCustomerID(Long customerID) {
		this.customerID = customerID;
	}
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getSweat() {
		return sweat;
	}
	public void setSweat(String sweat) {
		this.sweat = sweat;
	}
	public String getColdHot() {
		return coldHot;
	}
	public void setColdHot(String coldHot) {
		this.coldHot = coldHot;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getMouth() {
		return mouth;
	}
	public void setMouth(String mouth) {
		this.mouth = mouth;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getPoo() {
		return poo;
	}
	public void setPoo(String poo) {
		this.poo = poo;
	}
	public String getPee() {
		return pee;
	}
	public void setPee(String pee) {
		this.pee = pee;
	}
	public String getDrink() {
		return drink;
	}
	public void setDrink(String drink) {
		this.drink = drink;
	}
	public String getEat() {
		return eat;
	}
	public void setEat(String eat) {
		this.eat = eat;
	}
	public String getAbdomen() {
		return abdomen;
	}
	public void setAbdomen(String abdomen) {
		this.abdomen = abdomen;
	}
	public String getHearing() {
		return hearing;
	}
	public void setHearing(String hearing) {
		this.hearing = hearing;
	}
	public String getSleep() {
		return sleep;
	}
	public void setSleep(String sleep) {
		this.sleep = sleep;
	}
	public String getTongueColor() {
		return tongueColor;
	}
	public void setTongueColor(String tongueColor) {
		this.tongueColor = tongueColor;
	}
	public String getTongueShape() {
		return tongueShape;
	}
	public void setTongueShape(String tongueShape) {
		this.tongueShape = tongueShape;
	}
	public String getTongueStatus() {
		return tongueStatus;
	}
	public void setTongueStatus(String tongueStatus) {
		this.tongueStatus = tongueStatus;
	}
	public String getTongueLayer() {
		return tongueLayer;
	}
	public void setTongueLayer(String tongueLayer) {
		this.tongueLayer = tongueLayer;
	}
	public String getPulse() {
		return pulse;
	}
	public void setPulse(String pulse) {
		this.pulse = pulse;
	}
	public String getSkin() {
		return skin;
	}
	public void setSkin(String skin) {
		this.skin = skin;
	}
	public String getMenstruation() {
		return menstruation;
	}
	public void setMenstruation(String menstruation) {
		this.menstruation = menstruation;
	}
	public String getSickness() {
		return sickness;
	}
	public void setSickness(String sickness) {
		this.sickness = sickness;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	public String getTheory() {
		return theory;
	}
	public void setTheory(String theory) {
		this.theory = theory;
	}
	public Boolean getConsultationFee() {
		return consultationFee;
	}
	public void setConsultationFee(Boolean consultationFee) {
		this.consultationFee = consultationFee;
	}
	public Integer getDosage() {
		return dosage;
	}
	public void setDosage(Integer dosage) {
		this.dosage = dosage;
	}
	public BigDecimal getDosePrice() {
		return dosePrice;
	}
	public void setDosePrice(BigDecimal dosePrice) {
		this.dosePrice = dosePrice;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getExpiryDateStr() {
		return expiryDateStr;
	}
	public void setExpiryDateStr(String expiryDateStr) {
		this.expiryDateStr = expiryDateStr;
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
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public Long getCaseID() {
		return caseID;
	}
	public void setCaseID(Long caseID) {
		this.caseID = caseID;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public List<CaseMedicine> getMedicines() {
		return medicines;
	}
	public void setMedicines(List<CaseMedicine> medicines) {
		this.medicines = medicines;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public List<CaseRemark> getRemarks() {
		return remarks;
	}
	public void setRemarks(List<CaseRemark> remarks) {
		this.remarks = remarks;
	}
	public String getPriceSystem() {
		return priceSystem;
	}
	public void setPriceSystem(String priceSystem) {
		this.priceSystem = priceSystem;
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
	public List<CaseStatistic> getStatistics() {
		return statistics;
	}
	public void setStatistics(List<CaseStatistic> statistics) {
		this.statistics = statistics;
	}
	public Boolean getConfirm() {
		return confirm;
	}
	public void setConfirm(Boolean confirm) {
		this.confirm = confirm;
	}
	public String getConfirmUser() {
		return confirmUser;
	}
	public void setConfirmUser(String confirmUser) {
		this.confirmUser = confirmUser;
	}	
	
}
