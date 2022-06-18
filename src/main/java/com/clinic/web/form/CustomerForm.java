package com.clinic.web.form;

import java.util.Date;

import com.clinic.web.entity.Customers;
import com.clinic.web.util.DateUtil;

public class CustomerForm extends Customers {
	
	private String createDateStr;
	private String dateOfBirthStr;	

	public CustomerForm() {
		super();
	}

	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

	public String getDateOfBirthStr() {
		return dateOfBirthStr;
	}

	public void setDateOfBirthStr(String dateOfBirthStr) {
		this.dateOfBirthStr = dateOfBirthStr;
	}

	public Integer getAge() {
		if(this.getDateOfBirth() != null) {
			Date today = new Date();
			return DateUtil.calculateAge(this.getDateOfBirth(), today);
		}
		return null;
	}
	
}
