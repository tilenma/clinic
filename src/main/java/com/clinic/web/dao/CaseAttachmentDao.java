package com.clinic.web.dao;

import java.util.List;

import com.clinic.web.entity.CaseAttachment;

public interface CaseAttachmentDao {

	Integer saveAttachment(CaseAttachment aCaseAttachment);

	CaseAttachment getAttachment(Integer aFileId);

	void deleteAttachment(Integer aFileId);

	List<CaseAttachment> getAttachmentList(Integer aCaseId);
	
	public Integer getNextFileId();

}