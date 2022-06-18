package com.clinic.web.vo;

import java.util.ArrayList;
import java.util.List;

public class GroupEffectVo {
	private String startDateStr;
	
	private String endDateStr;
	
	private Integer count;

	private List<CaseEffectVo> effectList = new ArrayList<CaseEffectVo>();

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	public void addEffect(CaseEffectVo aCaseEffectVo) {
		this.effectList.add(aCaseEffectVo);
	}

	public List<CaseEffectVo> getEffectList() {
		return effectList;
	}

	public void setEffectList(List<CaseEffectVo> effectList) {
		this.effectList = effectList;
	}	
	
	
}
