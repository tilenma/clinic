package com.clinic.web.validator;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clinic.web.entity.CaseMedicine;
import com.clinic.web.entity.CaseStatistic;
import com.clinic.web.form.CaseForm;
import com.clinic.web.util.DateUtil;

public class CaseFormValidator implements Validator {
	private static Logger logger = LoggerFactory.getLogger(CaseFormValidator.class);
	
	@Override
	public boolean supports(Class<?> clazz) {		
		return CaseForm.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		
		logger.info("start validate case form object...");
		
		CaseForm form = null;
		
		if(obj instanceof CaseForm) {		
			form = (CaseForm)obj;
			
			if(form.getCustomerID()==null){
				errors.rejectValue("customerID", "customerID.empty");
			}
			
			if(form.getProblem()==null || form.getProblem().trim().length() == 0){
				errors.rejectValue("problem", "problem.empty");
			}
			
			if(form.getSickness()==null || form.getSickness().trim().length() == 0){
				errors.rejectValue("sickness", "sickness.empty");
			}
			
			//Check dateStr
			String aDateStr = form.getDateStr();
			if(form.getDateStr()==null || form.getDateStr().length()==0){
				errors.rejectValue("dateStr", "date.empty");
			}	
			else {
				try {
					Date date = DateUtil.parseDate(aDateStr);
				}catch(ParseException e) {
					errors.rejectValue("dateStr", "date.invalid");
					logger.error("Date format of dateStr is invalid.");
				}
			}
			
			//Check expiryDateStr
			aDateStr = form.getExpiryDateStr();
			try {
				Date date = DateUtil.parseDate(aDateStr);
			}catch(ParseException e) {
				errors.rejectValue("expiryDateStr", "date.invalid");
				logger.error("Date format of expiryDateStr is invalid.");
			}
			
			//Check duplicate medicine name
			this.checkMedicine(form, errors);
		
			logger.info("validate case form object is done.");
		}
		else {
			logger.error("validate unknown object!");
		}
	}
	
	private void checkMedicine(CaseForm aCaseForm,Errors errors) {
		List<CaseMedicine> medicineList = aCaseForm.getMedicines();
		
		logger.info("CheckMedicine starts...");
		
		Map<String,Integer> medicineMap = new HashMap<String,Integer>();
		if(medicineList != null && medicineList.size()>0) {		
			logger.debug("Form medicine list size="+medicineList.size());
			Integer index = 0;
			
			for(CaseMedicine cm: medicineList) {				
				String name = cm.getName();
				//logger.debug("medicine name="+name);
				if(name == null || name.length()==0) {
					//do nothing to ignore empty name
				}
				else if(medicineMap.containsKey(name)) {
					Integer thisIndex = medicineMap.get(name);
					errors.rejectValue("medicines", "name.duplicate");
					errors.rejectValue("medicines["+thisIndex+"].name", "name.duplicate");
					errors.rejectValue("medicines["+index+"].name", "name.duplicate");
					logger.error("checkMedicine():duplicated medicine name="+name+" index="+thisIndex);						
				}
				else {
					//logger.debug("put medicine name="+name);
					medicineMap.put(name, index);					
				}
				index = index+1;
			}
		}
		
		logger.info("CheckMedicine done.");
	}
	
}
