package com.clinic.web.validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clinic.web.form.CustomerForm;
import com.clinic.web.search.CustomerCriteria;

public class CustomerCriteriaValidator implements Validator {
	private static Logger logger = LoggerFactory.getLogger(CustomerCriteriaValidator.class);
	
	@Override
	public boolean supports(Class<?> clazz) {		
		return CustomerCriteria.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		CustomerCriteria customerCriteria = (CustomerCriteria)obj;
		
		if(customerCriteria.getName().isEmpty() && customerCriteria.getMobileNumber().isEmpty() && customerCriteria.getDocumentID().isEmpty() && customerCriteria.getGender().equals("-1") && customerCriteria.getEmail().isEmpty()){
			errors.rejectValue("name", "search.empty");
		}		
	}
	
}
