package com.clinic.web.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.entity.CaseRemark;

public interface CaseRemarkDao {

	public abstract void delete(Long aCaseId, String aType);

	public abstract List<CaseRemark> getRemarksById(Long aCaseId);

	public abstract void saveOrUpdateRemark(Long aCaseId, String aType,
			String aDescription);

}