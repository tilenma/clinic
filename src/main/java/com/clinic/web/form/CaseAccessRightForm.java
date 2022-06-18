package com.clinic.web.form;

import java.util.Date;
import java.util.List;

public class CaseAccessRightForm {
	//For display only
	private Long caseID;
	private Date createTime;
	
	private Long customerID;
	
	private List<String> viewRightList;
	private List<String> searchRightList;
	private List<String> editRightList;

	private boolean isViewRightAll;
	private boolean isSearchRightAll;
	private boolean isEditRightAll;
	
	private String newUser;
	private String accessRightType;
	
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
	public Long getCustomerID() {
		return customerID;
	}
	public void setCustomerID(Long customerID) {
		this.customerID = customerID;
	}
	public boolean isViewRightAll() {
		return isViewRightAll;
	}
	public void setViewRightAll(boolean isViewRightAll) {
		this.isViewRightAll = isViewRightAll;
	}
	public boolean isSearchRightAll() {
		return isSearchRightAll;
	}
	public void setSearchRightAll(boolean isSearchRightAll) {
		this.isSearchRightAll = isSearchRightAll;
	}
	public boolean isEditRightAll() {
		return isEditRightAll;
	}
	public void setEditRightAll(boolean isEditRightAll) {
		this.isEditRightAll = isEditRightAll;
	}
	public List<String> getViewRightList() {
		return viewRightList;
	}
	public void setViewRightList(List<String> viewRightList) {
		this.viewRightList = viewRightList;
	}
	public List<String> getSearchRightList() {
		return searchRightList;
	}
	public void setSearchRightList(List<String> searchRightList) {
		this.searchRightList = searchRightList;
	}
	public List<String> getEditRightList() {
		return editRightList;
	}
	public void setEditRightList(List<String> editRightList) {
		this.editRightList = editRightList;
	}
	public String getNewUser() {
		return newUser;
	}
	public void setNewUser(String newUser) {
		this.newUser = newUser;
	}
	public String getAccessRightType() {
		return accessRightType;
	}
	public void setAccessRightType(String accessRightType) {
		this.accessRightType = accessRightType;
	}
	
}
