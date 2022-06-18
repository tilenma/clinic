package com.clinic.web.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.clinic.web.entity.PriceSystem;

public interface PriceDao {

	public abstract Map<String, BigDecimal> getPriceList(Integer aSystemId);

	public abstract Map<String, BigDecimal> getWeightList();
	
	public abstract List<String> getUnitList();
	
	public List<PriceSystem> getEffectivePriceSystem();
	
	public Set<String> getEffectiveOtherType();

}