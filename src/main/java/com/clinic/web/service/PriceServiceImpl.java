package com.clinic.web.service;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.clinic.web.dao.CasesDao;
import com.clinic.web.dao.MedicineDao;
import com.clinic.web.dao.PriceDao;
import com.clinic.web.entity.CaseMedicine;
import com.clinic.web.entity.Cases;
import com.clinic.web.entity.Medicine;
import com.clinic.web.entity.PriceSystem;
import com.clinic.web.util.DrugUtil;
import com.clinic.web.vo.PriceVo;

@Service
public class PriceServiceImpl implements PriceService {
	private static Logger logger = LoggerFactory.getLogger(PriceServiceImpl.class);
	
	private PriceDao priceDao;
	private CasesDao casesDao;
	private MedicineDao medicineDao;
	
	private final String UNCLASSIFY = "U";
	private final BigDecimal UNCLASSIFY_WEIGHT = new BigDecimal(1);
	private final BigDecimal ZERO_VALUE = new BigDecimal(0);
	
	//private final String UNIT_LIMIT_CATEGORY = "劑量限額";
	//private final String BASIC_DOSE_PRICE = "每劑基本";
	//private final String EXTRA_DOSE_PRICE = "額外劑量收費";
	private final String CONSULTATION_FEE = "診金";	
	
	public static final String DEFAULT_PRICE_SYSTEM_NAME = "標準收費";
	
	/* (non-Javadoc)
	 * @see com.clinic.web.service.PriceService#calculateDosePrice(java.lang.Long)
	 */
	
	public PriceSystem getPriceSystem(String aName) {		
		PriceSystem selectedSystem = null;
		
		if(aName != null && aName.length() > 0) {
			List<PriceSystem> systemList = this.priceDao.getEffectivePriceSystem();
			for(PriceSystem ps: systemList) {
				if(ps.getName().compareToIgnoreCase(aName)==0) {
					selectedSystem =  ps;
				}
			}
		}
		if(selectedSystem == null) {
			logger.warn("Use default price system as system name="+aName+" cannot be found!");
			
			List<PriceSystem> systemList = this.priceDao.getEffectivePriceSystem();			
			for(PriceSystem ps: systemList) {
				if(ps.getName().compareToIgnoreCase(DEFAULT_PRICE_SYSTEM_NAME)==0) {
					selectedSystem =  ps;
				}
			}
		}
		return selectedSystem;
	}
	
	public PriceVo calculateTotalPrice(Long aCaseId, BigDecimal aDosePrice, Integer dosageCount, boolean consultFee, String aPriceSystemName){
		
		PriceVo priceVo = new PriceVo();
		StringBuffer descrption = new StringBuffer();
		Cases cases = this.casesDao.getCaseById(aCaseId);
		List<CaseMedicine> medicineList = cases.getMedicines();
		
		PriceSystem priceSystem = this.getPriceSystem(aPriceSystemName);
		descrption.append("計法："+aPriceSystemName);
		
		//Group medicine according to type
		Map<String, String> medicineTypeMap = new HashMap<String, String>();		
		String type = null;
		for(CaseMedicine medic: medicineList){
			type = medic.getType();			
			
			if(!DrugUtil.isDrug(type)){	
				medicineTypeMap.put(type, medic.getName());
				
				logger.info("calculateTotalPrice(): put medic to map with type="+type);
			}			
		}
		
		//Calculate total price
		Map<String,BigDecimal> priceList = this.priceDao.getPriceList(priceSystem.getSystemId());
		
		BigDecimal totalPrice = aDosePrice.multiply(new BigDecimal(dosageCount));
		descrption.append(" 基本費用: "+aDosePrice.toBigInteger().toString()+"X"+dosageCount.toString());
		
		Iterator<String> it = medicineTypeMap.keySet().iterator();
		BigDecimal typePrice = null;
		while(it.hasNext()){
			type = it.next();
			typePrice = priceList.get(type);
			
			//Have price set
			if(typePrice != null){
				logger.info("calculateTotalPrice(): price for type="+type+" is "+typePrice);
				totalPrice = totalPrice.add(typePrice);
				descrption.append(" "+type+": "+typePrice.toBigInteger().toString());
			}
			else{
				//No price is set --> error
				logger.error("calculateTotalPrice(): Unable to search price for type="+type);
			}
		}
		
		//Add consultFee
		if(consultFee){
			//typePrice =  priceList.get(CONSULTATION_FEE);
			typePrice = priceSystem.getConsultationFee();
			totalPrice = totalPrice.add(typePrice);
			descrption.append(" "+CONSULTATION_FEE+": "+typePrice.toBigInteger().toString());
		}
		
		descrption.append(" 合共: "+totalPrice.toBigInteger().toString());
		
		priceVo.setPrice(totalPrice);
		priceVo.setDescription(descrption.toString());
		
		return priceVo;
	}
	
	@Override
	public BigDecimal calculateDosePrice(Long aCaseId, String aPriceSystemName){
		Cases cases = this.casesDao.getCaseById(aCaseId);
		List<CaseMedicine> medicineList = cases.getMedicines();
		PriceSystem priceSystem = this.getPriceSystem(aPriceSystemName);
		
		//Group medicine according to category
		Map<String, BigDecimal> categoryAmountMap = new HashMap<String, BigDecimal>();
		
		String name = null;
		String category = null;
		BigDecimal amount = null;
		String type = null;
		for(CaseMedicine medic: medicineList){
			type = medic.getType();
			name = medic.getName();
			
			//only count medicines for drugs
			if(DrugUtil.isDrug(type)){				
				//Search for medicine table
				Medicine medicine = this.medicineDao.searchMedicineByExactName(name);
				
				//Match
				if(medicine != null){
					category = medicine.getPriceCategory();
				}
				else{ //No match
					category = UNCLASSIFY;
				}
				
				logger.debug("calculateDosePrice(): search for medicine="+name+". Result category="+category);
				
				//Add to categoryAmountMap
				if(categoryAmountMap.containsKey(category)){
					amount = categoryAmountMap.get(category);
					if(medic.getUnit() != null) {
						categoryAmountMap.put(category, amount.add(medic.getUnit())); //add to existing
					}
					else {
						logger.warn("calculateDosePrice(): Unit of medic= "+medic.getName()+" is null! Set to 0.");
						categoryAmountMap.put(category, amount.add(ZERO_VALUE)); //add to existing
					}
				}
				else{
					if(medic.getUnit() != null) {
						categoryAmountMap.put(category, medic.getUnit());
					}
					else {
						logger.warn("calculateDosePrice(): Unit of medic= "+medic.getName()+" is null! Set to 0.");
						categoryAmountMap.put(category, new BigDecimal(0));
					}
				}		
			}
			else{
				logger.debug("calculateDosePrice(): skip medicine="+name+" and type="+type);
			}	
		}
		
		//Calculate weighted amount
		BigDecimal weightedAmount = new BigDecimal(0);
		BigDecimal totalWeightedAmount = new BigDecimal(0);
		Map<String,BigDecimal> weightList = this.priceDao.getWeightList();
		Iterator<String> it = categoryAmountMap.keySet().iterator();
		BigDecimal weight = null;
		
		while(it.hasNext()){
			category = it.next();
			
			if(UNCLASSIFY.equalsIgnoreCase(category)){
				weight = UNCLASSIFY_WEIGHT;
				weightedAmount = categoryAmountMap.get(UNCLASSIFY).multiply(weight);
				totalWeightedAmount = totalWeightedAmount.add(weightedAmount);
			}
			else{
				weight = weightList.get(category);
				if(weight != null) {					
					weightedAmount = categoryAmountMap.get(category).multiply(weight);
				}
				else {
					weightedAmount = ZERO_VALUE;
					logger.warn("calculateDosePrice(): weight is null! Set weightedAmount="+weightedAmount);
				}
				totalWeightedAmount = totalWeightedAmount.add(weightedAmount);
			}
			logger.debug("calculateDosePrice(): calculating category ="+category+" ... WeightedAmount="+weightedAmount+" totalWeightedAmount="+totalWeightedAmount);
		}
		
		//Calculate dose price
		//Map<String,BigDecimal> priceList = this.priceDao.getPriceList();
		BigDecimal dosePrice = priceSystem.getPerDosePrice(); //priceList.get(BASIC_DOSE_PRICE);
		BigDecimal doseLimit = priceSystem.getDosageLimit(); //priceList.get(UNIT_LIMIT_CATEGORY);
		BigDecimal extraAmount = null;
		
		//If total amount exceeds dose limit
		if(totalWeightedAmount.compareTo(doseLimit)>0){
			BigDecimal extraDosePrice = priceSystem.getExtraDoseFee(); //priceList.get(EXTRA_DOSE_PRICE);
			
			extraAmount = totalWeightedAmount.subtract(doseLimit);
			
			//Add extra amount price
			dosePrice = dosePrice.add(extraAmount.multiply(extraDosePrice));
		}	
		
		return dosePrice;
	}

	@Resource
	public void setPriceDao(PriceDao priceDao) {
		this.priceDao = priceDao;
	}
	@Resource
	public void setCasesDao(CasesDao casesDao) {
		this.casesDao = casesDao;
	}
	@Resource
	public void setMedicineDao(MedicineDao medicineDao) {
		this.medicineDao = medicineDao;
	}
	
}
