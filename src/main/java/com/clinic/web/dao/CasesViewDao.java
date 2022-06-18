package com.clinic.web.dao;

import java.util.List;

import com.clinic.web.entity.Cases;
import com.clinic.web.entity.CasesView;
import com.clinic.web.search.CaseCriteria;

public interface CasesViewDao {

	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseDao#getCaseById(java.lang.Long)
	 */
	public abstract CasesView getCasesViewById(Long aCaseId);

	public abstract List<CasesView> searchCasesView(CaseCriteria aCriteria, Boolean aDescOrder);
	
	public abstract CasesView getLastCasesViewByCustomerId(Long aCurrentCaseId, Long aCustomerId);
	
	public abstract CasesView getLastSameProblemCasesView(Long aCurrentCaseId, Long aCustomerId, String aProblem);
	
	public abstract CasesView getLastSameSicknessCasesView(Long aCurrentCaseId, String aSickness);
	
	public abstract CasesView getLastSameCustomerNSicknessCasesView(Long aCurrentCaseId, Long aCustomerId, String aSickness);
	
	public List<CasesView> convertToCasesView(List<Cases> aCaseList);
	
	public List<CasesView> getLatestCaseList();
}