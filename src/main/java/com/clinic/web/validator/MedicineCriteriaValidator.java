package com.clinic.web.validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clinic.web.form.CustomerForm;
import com.clinic.web.search.CustomerCriteria;
import com.clinic.web.search.MedicineCriteria;

public class MedicineCriteriaValidator implements Validator {
	private static Logger logger = LoggerFactory.getLogger(MedicineCriteriaValidator.class);
	
	@Override
	public boolean supports(Class<?> clazz) {		
		return MedicineCriteria.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		MedicineCriteria medicineCriteria = (MedicineCriteria)obj;
		
		if(medicineCriteria.getName2().isEmpty() && medicineCriteria.getType2().isEmpty() && medicineCriteria.getCode2().isEmpty() && medicineCriteria.getType2().equals("-1") && medicineCriteria.getPriceCategory2().isEmpty()){
			errors.rejectValue("name", "search.empty");
		}		
	}
	
}
