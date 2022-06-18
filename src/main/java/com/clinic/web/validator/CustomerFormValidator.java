package com.clinic.web.validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clinic.web.form.CustomerForm;

public class CustomerFormValidator implements Validator {
	private static Logger logger = LoggerFactory.getLogger(CustomerFormValidator.class);
	
	@Override
	public boolean supports(Class<?> clazz) {		
		return CustomerForm.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		CustomerForm form = (CustomerForm)obj;
				
		if(form.getName().isEmpty()){
			errors.rejectValue("name", "name.empty");
		}
		
	}
	
}
