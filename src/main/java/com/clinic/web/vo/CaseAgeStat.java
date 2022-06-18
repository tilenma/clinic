package com.clinic.web.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.clinic.web.util.DateUtil;
import com.clinic.web.constant.AgeGroup;

public class CaseAgeStat {
	private Date interval;
	private Map<AgeGroup,Integer> ageCountMap = new HashMap<AgeGroup,Integer>();
	
	public Date getInterval() {
		return interval;
	}

	public void setInterval(Date interval) {
		this.interval = interval;
	}

	public String getDisplayInterval() {
		return DateUtil.format(this.interval);
	}

	public void putAgeCount(AgeGroup aAgeGroup, Integer aCount) {
		this.ageCountMap.put(aAgeGroup, aCount);
	}
	
	public Integer getAgeCount(AgeGroup aAgeGroup) {
		return this.ageCountMap.get(aAgeGroup);
	}
	
	public List<Integer> getAgeCountList(){
		List<Integer> list = new ArrayList<Integer>();
		
		Integer count = 0;
		
		for(AgeGroup ag: AgeGroup.values()) {
			count = this.ageCountMap.get(ag);
			
			if(count == null) {
				list.add(0);			
			}
			else {
				list.add(count);
			}
		}
		
		return list;
	}
	
}
