package com.clinic.web.validator;

import java.text.ParseException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clinic.web.search.CaseCriteria;
import com.clinic.web.util.DateUtil;

public class ReportCaseCriteriaValidator implements Validator {
	private static Logger logger = LoggerFactory.getLogger(ReportCaseCriteriaValidator.class);
	
	@Override
	public boolean supports(Class<?> clazz) {		
		return CaseCriteria.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		CaseCriteria caseCriteria = (CaseCriteria)obj;
		
		if((caseCriteria.getCaseID()==null||caseCriteria.getCaseID()==0)&&caseCriteria.getCustomerName().trim().isEmpty()
				&&(caseCriteria.getFromDateStr() == null || caseCriteria.getFromDateStr().trim().isEmpty())){
			errors.rejectValue("customerName", "search.empty");
		}
		
		if(caseCriteria.getFromDate() !=null && !caseCriteria.getFromDateStr().trim().isEmpty()){
			try{
				DateUtil.parseDate(caseCriteria.getFromDateStr());
			}catch(ParseException e){
				errors.rejectValue("fromDateStr", "date.invalid");
			}
		}		
	}
	
}
