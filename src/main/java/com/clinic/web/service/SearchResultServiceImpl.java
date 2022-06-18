package com.clinic.web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.clinic.web.entity.Cases;
import com.clinic.web.entity.CasesView;
import com.clinic.web.entity.Customers;
import com.clinic.web.vo.SearchResultVo;

@Service
public class SearchResultServiceImpl implements SearchResultService {
	
	public static final String CASE_TYPE = "Case";
	public static final String CASE_VIEW_TYPE = "CaseView";
	public static final String CUSTOMER_TYPE = "Customer";
	
	
	@Override
	public List<SearchResultVo> convertSingleResult(Cases aCase){
		List<SearchResultVo> resultList = new LinkedList<SearchResultVo>();
		
		if(aCase == null){
			return null;
		}
		else{
			SearchResultVo resultVo = new SearchResultVo();
			resultVo.setId(aCase.getCaseID());
			resultVo.setPreviousId(null);
			resultVo.setNextId(null);
			resultVo.setType(CASE_TYPE);
			
			resultList.add(resultVo);
		}
		
		return resultList;
	}
	
	@Override
	public List<SearchResultVo> convertCustomerResult(List<CasesView> caseList){
		List<SearchResultVo> resultList = new ArrayList<SearchResultVo>();
		if(caseList == null){
			return null;
		}		
		
		//Use map to decuplicate
		Map<Long,CasesView> map = new HashMap<Long,CasesView>();
		CasesView casesView = null;
		for(int i=0;i< caseList.size(); i++){
			casesView = caseList.get(i);
			map.put(casesView.getCustomerID(),casesView);
		}				
		List<CasesView> caseList2 = new ArrayList<CasesView>(map.values());
		
		CasesView preCasesView = null;		
		CasesView nextCasesView = null;
		SearchResultVo resultVo = null;
		
		for(int i=0;i< caseList2.size(); i++){
			preCasesView = casesView;
			casesView = caseList2.get(i);
			
			resultVo = new SearchResultVo();
			resultVo.setType(CUSTOMER_TYPE);
			resultVo.setId(casesView.getCustomerID());
			
			if(i==0){
				resultVo.setPreviousId(null);				
			}
			else if(preCasesView != null){
				resultVo.setPreviousId(preCasesView.getCustomerID());	 
			}
			else{
				//Problem
			}
			
			if(i+1<caseList2.size()){
				nextCasesView = caseList2.get(i+1);
				resultVo.setNextId(nextCasesView.getCustomerID());
			}
			else{
				resultVo.setNextId(null);
			}			
			//Add to map			
			resultList.add(resultVo);			
		}		
		return resultList;
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.service.SearchResultService#convertResult(java.util.List)
	 */
	@Override
	public List<SearchResultVo> convertResult(List<CasesView> caseList){
		List<SearchResultVo> resultList = new LinkedList<SearchResultVo>();
		
		if(caseList == null){
			return null;
		}
		
		CasesView preCasesView = null;
		CasesView casesView = null;
		CasesView nextCasesView = null;
		SearchResultVo resultVo = null;
		for(int i=0;i< caseList.size(); i++){
			preCasesView = casesView;
			casesView = caseList.get(i);
			
			resultVo = new SearchResultVo();
			resultVo.setType(CASE_VIEW_TYPE);
			resultVo.setId(casesView.getCaseID());
			
			if(i==0){
				resultVo.setPreviousId(null);				
			}
			else if(preCasesView != null){
				resultVo.setPreviousId(preCasesView.getCaseID());	 
			}
			else{
				//Problem
			}
			
			if(i+1<caseList.size()){
				nextCasesView = caseList.get(i+1);
				resultVo.setNextId(nextCasesView.getCaseID());
			}
			else{
				resultVo.setNextId(null);
			}
			
			//Add to list
			resultList.add(resultVo);
		}
		return resultList;
	}
	
	@Override
	public List<SearchResultVo> convertCaseResult(List<Cases> caseList){
		List<SearchResultVo> resultList = new LinkedList<SearchResultVo>();
		
		if(caseList == null){
			return null;
		}
		
		Cases preCasesView = null;
		Cases casesView = null;
		Cases nextCasesView = null;
		SearchResultVo resultVo = null;
		for(int i=0;i< caseList.size(); i++){
			preCasesView = casesView;
			casesView = caseList.get(i);
			
			resultVo = new SearchResultVo();
			resultVo.setType(CASE_TYPE);
			resultVo.setId(casesView.getCaseID());
			
			if(i==0){
				resultVo.setPreviousId(null);				
			}
			else if(preCasesView != null){
				resultVo.setPreviousId(preCasesView.getCaseID());	 
			}
			else{
				//Problem
			}
			
			if(i+1<caseList.size()){
				nextCasesView = caseList.get(i+1);
				resultVo.setNextId(nextCasesView.getCaseID());
			}
			else{
				resultVo.setNextId(null);
			}
			
			//Add to list
			resultList.add(resultVo);
		}
		return resultList;
	}
}
