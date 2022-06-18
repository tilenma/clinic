package com.clinic.web.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="\"Customers\"")
public class Customers{
	
	private static final int LAST_DIGIT_NO = 4;
	
	@Id
	@Column(name="\"customerID\"")
	private Long customerID;
	
	@Column(name="\"mobileNumber\"")
	private String mobileNumber;
	
	@Column(name="name")
	private String name;
	
	@Column(name="name_en")
	private String nameEN;
	
	@Column(name="email")
	private String email;
	
	@Column(name="\"maritalStatus\"")
	private String maritalStatus;
	
	@Column(name="occupation")
	private String occupation;
	
	@Column(name="\"sickHistory\"")
	private String sickHistory;
	
	@Column(name="\"createDate\"")
	private Date createDate;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="\"dateOfBirth\"")
	private Date dateOfBirth;
	
	@Column(name="relationship")
	private String relationship;
	
	@Column(name="note")
	private String note;
	
	@Column(name="\"documentID\"")
	private String documentID;
	
	@Column(name="allergy")
	private String allergy;
	
	@Column(name="address")
	private String address;
	
	@Column(name="privacy")
	private Integer privacy;

	public Long getCustomerID() {
		return customerID;
	}

	public void setCustomerID(Long customerID) {
		this.customerID = customerID;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getSickHistory() {
		return sickHistory;
	}

	public void setSickHistory(String sickHistory) {
		this.sickHistory = sickHistory;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getDocumentID() {
		return documentID;
	}
	
	public String getMaskedDocumentID() {
		if(documentID != null){
			String maskChar="*";
			StringBuffer sb = new StringBuffer();
			int show = 4;
			
			if(documentID.length() > show){
				sb.append(documentID.substring(0, show));
				
				for(int i=show;i<documentID.length();i++){
					sb.append(maskChar);
				}
			}
			
			return sb.toString();
		}
		return documentID;
	}

	public void setDocumentID(String documentID) {
		this.documentID = documentID;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getPrivacy() {
		return privacy;
	}

	public void setPrivacy(Integer privacy) {
		this.privacy = privacy;
	}
	
	public String getNameWithMobile(){
		if(this.mobileNumber != null && this.mobileNumber.trim().length() >= this.LAST_DIGIT_NO){
			return this.name+" "+this.mobileNumber.substring(this.mobileNumber.length()-LAST_DIGIT_NO);
		}
		else{
			return this.name;
		}
	}

	public String getNameEN() {
		return nameEN;
	}

	public void setNameEN(String nameEN) {
		this.nameEN = nameEN;
	}
	
	
}
