package com.clinic.web.search;

import java.io.Serializable;
import java.util.Date;

public class CustomerCriteria implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5269120371081663534L;

	private String mobileNumber;	
	
	private String name;	
	
	private String email;
	
	private String gender;
	
	private String documentID;
	
	private Date createDate;

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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDocumentID() {
		return documentID;
	}

	public void setDocumentID(String documentID) {
		this.documentID = documentID;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}	
}
