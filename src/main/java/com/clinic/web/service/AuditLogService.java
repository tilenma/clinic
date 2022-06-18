package com.clinic.web.service;

import java.util.Date;

import javax.annotation.Resource;

import com.clinic.web.constant.Action;
import com.clinic.web.dao.AuditLogDao;

public interface AuditLogService {

	void logCheckPrescription(String aUserName, Integer aCaseId, Integer checkedMedicineNo, Integer totalMedicineNo);
	
	public void logDirectConfirmPrescription(String aUserName, Integer aCaseId, Integer checkedMedicineNo, Integer totalMedicineNo);

	void logPrintDocument(String aUserName, Integer aCaseId, Action aAction);

	void logPrintCert(String aUserName, Integer aCaseId, Date aStartDate, Date aEndDate);

	void setAuditLogDao(AuditLogDao auditLogDao);

}