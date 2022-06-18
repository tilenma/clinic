package com.clinic.web.dao;

import com.clinic.web.entity.AuditLog;

public interface AuditLogDao {

	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseAttachmentDao#saveAttachment(com.clinic.web.entity.CaseAttachment)
	 */
	Long log(AuditLog aAuditLog);
	
	public Boolean confirmCheckPrescription(Integer aCaseId);

}