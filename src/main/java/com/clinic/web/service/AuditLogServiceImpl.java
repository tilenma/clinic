package com.clinic.web.service;

import java.math.BigDecimal;
import java.util.Date;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.clinic.web.constant.Action;
import com.clinic.web.dao.AuditLogDao;
import com.clinic.web.entity.AuditLog;

@Service
public class AuditLogServiceImpl implements AuditLogService {
	private static Logger logger = LoggerFactory.getLogger(AuditLogServiceImpl.class);
	
	private AuditLogDao auditLogDao;
	
	@Override
	public void logDirectConfirmPrescription(String aUserName, Integer aCaseId, Integer checkedMedicineNo, Integer totalMedicineNo) {
		AuditLog log = new AuditLog();
		log.setAction(Action.CONFIRM_PRESCRIPTION.getCode());
		log.setUsername(aUserName);
		log.setTime(new Date());
		log.setCaseId(aCaseId);
		log.setRemark(";;;;;;checkedMedicineNo;totalMedicineNo;");
		log.setNumber1(new BigDecimal(checkedMedicineNo));
		log.setNumber2(new BigDecimal(totalMedicineNo));
		
		logger.info("log action="+Action.CHECK_PRESCRIPTION.getCode()+" by user="+aUserName+" on case id="+aCaseId);
		
		this.auditLogDao.log(log);
	}
	
	@Override
	public void logCheckPrescription(String aUserName, Integer aCaseId, Integer checkedMedicineNo, Integer totalMedicineNo) {
		AuditLog log = new AuditLog();
		log.setAction(Action.CHECK_PRESCRIPTION.getCode());
		log.setUsername(aUserName);
		log.setTime(new Date());
		log.setCaseId(aCaseId);
		log.setRemark(";;;;;;checkedMedicineNo;totalMedicineNo;");
		log.setNumber1(new BigDecimal(checkedMedicineNo));
		log.setNumber2(new BigDecimal(totalMedicineNo));
		
		logger.info("log action="+Action.CHECK_PRESCRIPTION.getCode()+" by user="+aUserName+" on case id="+aCaseId);
		
		this.auditLogDao.log(log);
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.service.AuditLogService#logPrintDocument(java.lang.String, java.lang.Integer, com.clinic.web.constant.Action)
	 */
	@Override
	public void logPrintDocument(String aUserName, Integer aCaseId, Action aAction) {
		AuditLog log = new AuditLog();
		log.setAction(aAction.getCode());
		log.setUsername(aUserName);
		log.setTime(new Date());
		log.setCaseId(aCaseId);
		log.setRemark(";;;;;;;;");
		
		logger.info("log action="+aAction.getCode()+" by user="+aUserName+" on case id="+aCaseId);
		
		this.auditLogDao.log(log);
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.service.AuditLogService#logPrintCert(java.lang.String, java.lang.Integer, java.util.Date, java.util.Date)
	 */
	@Override
	public void logPrintCert(String aUserName, Integer aCaseId, Date aStartDate, Date aEndDate) {
		AuditLog log = new AuditLog();
		log.setAction(Action.PRINT_CERT.getCode());
		log.setUsername(aUserName);
		log.setTime(new Date());
		log.setCaseId(aCaseId);
		log.setRemark(";;;startDate;endDate;;;;");
		log.setDate1(aStartDate);
		log.setDate2(aEndDate);
		
		logger.info("log action="+Action.PRINT_CERT.getCode()+" by user="+aUserName+" on case id="+aCaseId);
		
		this.auditLogDao.log(log);
	}
	
	
	/* (non-Javadoc)
	 * @see com.clinic.web.service.AuditLogService#setAuditLogDao(com.clinic.web.dao.AuditLogDao)
	 */
	@Override
	@Resource
	public void setAuditLogDao(AuditLogDao auditLogDao) {
		this.auditLogDao = auditLogDao;
	}
}
