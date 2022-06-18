package com.clinic.web.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="\"Cases\"")
public class Cases {
	
	@Transient
	private static final String DELIMITOR = ",";
	
	@Id
	@Column(name="\"caseID\"")
	private Long caseID;
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,orphanRemoval=true, mappedBy="cases")
	@Fetch(value = FetchMode.SUBSELECT)
	@OrderBy("type, name")
	private List<CaseMedicine> medicines = new ArrayList<CaseMedicine>();
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,orphanRemoval=true, mappedBy="cases")
	@Fetch(value = FetchMode.SUBSELECT)
	@OrderBy("type")
	private List<CaseStatistic> statistics = new ArrayList<CaseStatistic>();
	
	@Column(name="\"customerID\"")
	private Long customerID;
	
	@Column(name="date")
	private Date date;
	
	@Column(name="problem")
	private String problem;
	
	@Column(name="sweat")
	private String sweat;
	
	@Column(name="\"coldHot\"")
	private String coldHot;
	
	@Column(name="head")
	private String head;
	
	@Column(name="month")
	private String mouth;
	
	@Column(name="body")
	private String body;
	
	@Column(name="poo")
	private String poo;
	
	@Column(name="pee")
	private String pee;
	
	@Column(name="drink")	
	private String drink;
	
	@Column(name="eat")
	private String eat;
	
	@Column(name="abdomen")
	private String abdomen;
	
	@Column(name="hearing")
	private String hearing;
	
	@Column(name="sleep")
	private String sleep;
	
	@Column(name="\"tongueColor\"")
	private String tongueColor;
	
	@Column(name="\"tongueShape\"")
	private String tongueShape;
	
	@Column(name="\"tongueStatus\"")
	private String tongueStatus;
	
	@Column(name="\"tongueLayer\"")
	private String tongueLayer;
	
	@Column(name="\"pulse\"")
	private String pulse;
	
	@Column(name="\"skin\"")
	private String skin;
	
	@Column(name="menstruation")
	private String menstruation;
	
	@Column(name="\"sickness\"")
	private String sickness;
	
	@Column(name="\"diagnosis\"")
	private String diagnosis;
	
	@Column(name="\"theory\"")
	private String theory;
	
	@Column(name="\"consultationFee\"")
	private Boolean consultationFee;
	
	@Column(name="\"createTime\"")
	private Date createTime;
	
	@Column(name="\"dosage\"")
	private Integer dosage;
	
	@Column(name="\"dosePrice\"")
	private BigDecimal dosePrice;
	
	@Column(name="\"price\"")
	private BigDecimal price;	
	
	@Column(name="expirydate")
	private Date expiryDate;
	
	@Column(name="\"dosageRemark\"")
	private String dosageRemark;
	
	@Column(name="\"dosageMethod\"")
	private String dosageMethod;
	
	@Column(name="\"dosageRecomment\"")
	private String dosageRecomment;
	
	@Column(name="\"redispense\"")
	private Integer redispense;
	
	@Column(name="search_right")
	private String searchRight;
	
	@Column(name="view_right")
	private String viewRight;
	
	@Column(name="edit_right")
	private String editRight;	
	
	@Column(name="\"receiptRemark\"")
	private String receiptRemark;
	
	@Column(name="\"followupRemark\"")
	private String followupRemark;
	
	@Column(name="\"certRemark\"")
	private String certRemark;
	
	@Column(name="\"reportRemark\"")
	private String reportRemark;
	
	@Column(name="\"confirm\"")
	private Boolean confirm;
	
	@Column(name="\"confirm_user\"")
	private String confirmUser;	
	
	public Long getCustomerID() {
		return customerID;
	}
	public void setCustomerID(Long customerID) {
		this.customerID = customerID;
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
	public Long getCaseID() {
		return caseID;
	}
	public void setCaseID(Long caseID) {
		this.caseID = caseID;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	public List<CaseMedicine> getMedicines() {
		return medicines;
	}
	public void setMedicines(List<CaseMedicine> medicines) {
		this.medicines = medicines;
	}
	public List<CaseMedicine> getMedicinesList() {
		List<CaseMedicine> list = new ArrayList<CaseMedicine>();
		
		if(this.medicines != null && this.medicines.size() > 0){
			list.addAll(this.medicines);
		}
		
		Collections.sort(list);
		
		return list;
	}
	public String getSearchRight() {
		return searchRight;
	}
	public void setSearchRight(String searchRight) {
		this.searchRight = searchRight;
	}
	public String getViewRight() {
		return viewRight;
	}
	public void setViewRight(String viewRight) {
		this.viewRight = viewRight;
	}
	public String getEditRight() {
		return editRight;
	}
	public void setEditRight(String editRight) {
		this.editRight = editRight;
	}
	
	public String getMedicineListString(){
		
		if(this.medicines != null && this.medicines.size()>0){
			StringBuffer bs = new StringBuffer();
			
			for(CaseMedicine med: this.medicines){
				if(bs.length()==0){
					bs.append(med.getName());
				}
				else{
					bs.append(DELIMITOR);
					bs.append(med.getName());	
				}				
			}
			return bs.toString();
		}
		return "";
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
