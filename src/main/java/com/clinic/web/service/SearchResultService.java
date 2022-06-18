package com.clinic.web.service;

import java.util.List;

import com.clinic.web.entity.Cases;
import com.clinic.web.entity.CasesView;
import com.clinic.web.vo.SearchResultVo;

public interface SearchResultService {

	public List<SearchResultVo> convertResult(List<CasesView> caseList);
	
	public List<SearchResultVo> convertSingleResult(Cases aCase);
	
	public List<SearchResultVo> convertCaseResult(List<Cases> caseList);
	
	public List<SearchResultVo> convertCustomerResult(List<CasesView> caseList);

}