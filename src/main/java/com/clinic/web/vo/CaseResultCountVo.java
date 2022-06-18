package com.clinic.web.vo;

import java.io.Serializable;

import com.clinic.web.entity.Cases;

public class CaseResultCountVo implements Serializable, Comparable<CaseResultCountVo>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2085239159993824621L;
	
	private Long caseID;
	private Cases cases;
	private Integer resultCount;
	
	public Long getCaseID() {
		return caseID;
	}
	public void setCaseID(Long caseID) {
		this.caseID = caseID;
	}
	public Cases getCases() {
		return cases;
	}
	public void setCases(Cases cases) {
		this.cases = cases;
	}
	public Integer getResultCount() {
		return resultCount;
	}
	public void setResultCount(Integer resultCount) {
		this.resultCount = resultCount;
	}
	
	@Override
	public int compareTo(CaseResultCountVo otherCountVo) {
		return this.resultCount.compareTo(otherCountVo.resultCount);
	}

	
}
