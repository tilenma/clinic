package com.clinic.web.dao;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.vo.CaseAgeStat;
import com.clinic.web.vo.CaseEffectVo;
import com.clinic.web.vo.CaseGenderStat;
import com.clinic.web.vo.CaseStat;
import com.clinic.web.vo.GenderStat;
import com.clinic.web.vo.MedicStat;
import com.clinic.web.vo.PriceStat;

public interface StatisticDao {

	GenderStat getGenderStat();
	
	public List<CaseStat> getCaseStatByWeek(int months);
	
	public List<CaseStat> getCaseStatByRange(Date aStartDate, Date aEndDate, int aInterval);
	
	public List<MedicStat> getTopMedic(int months, String type);
	
	public List<MedicStat> getTopMedicByRange(String type, Date aStartDate, Date aEndDate);
	
	public List<CaseEffectVo> getEffectByType(Long aCustomerID, String aType);
	
	public List<CaseEffectVo> getGroupEffect(Long aCustomerID, String aType, Date aDate);
	
	public List<PriceStat> getPriceStatByRange(Date aStartDate, Date aEndDate, int aInterval);
	
	public List<CaseGenderStat> getCaseGenderStatByRange(Date aStartDate, Date aEndDate, int aInterval);
	
	public List<CaseAgeStat> getCaseAgeStatByRange(Date aStartDate, Date aEndDate, int aInterval);

}