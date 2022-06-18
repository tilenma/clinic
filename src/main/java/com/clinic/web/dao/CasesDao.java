package com.clinic.web.dao;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.entity.Cases;

public interface CasesDao {

	public abstract Cases getCaseById(Long aCaseId);

	public abstract void updateCases(Cases aCase);

	public abstract Long createNewCase(Cases aCase);

	public abstract Long getNextCaseId();
	
	public abstract void deleteCasesMedicine(Cases aCase);
	
	public abstract Cases getLatestCase();
	
	public abstract Long getCaseSequenceOfDay(Long aCaseId);
	
	public abstract void deleteCasesById(Long aCaseId);
	
	public abstract List<Cases> searchCasesByMedicine(List<String> medicineName, Boolean aDescOrder);
	
	public Cases getLatestEditableCase(String username);
	
	public abstract void confirmCases(Long aCaseId, String aUsername);
}