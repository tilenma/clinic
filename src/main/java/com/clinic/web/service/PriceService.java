package com.clinic.web.service;

import java.math.BigDecimal;

import com.clinic.web.vo.PriceVo;

public interface PriceService {

	public abstract BigDecimal calculateDosePrice(Long aCaseId, String aPriceSystemName);
	
	public abstract PriceVo calculateTotalPrice(Long aCaseId, BigDecimal aDosePrice, Integer dosageCount, boolean consultFee, String aPriceSystemName);

}