package com.clinic.web.validator;

import java.text.ParseException;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clinic.web.form.SelectStatisticForm;
import com.clinic.web.util.DateUtil;

public class SelectStatisticFormValidator implements Validator{
	private static Logger logger = LoggerFactory.getLogger(SelectStatisticFormValidator.class);

	@Override
	public boolean supports(Class<?> arg0) {
		return SelectStatisticForm.class.equals(arg0);
	}

	@Override
	public void validate(Object arg0, Errors errors) {
		SelectStatisticForm form = (SelectStatisticForm)arg0;
		
		if(form.getType() == null || form.getType().trim().length() == 0) {
			//errors.rejectValue("type", "type.empty");
		}

		if(form.getStartDateStr() == null) {
			logger.error("validate(): startDateStr is null!");
			errors.rejectValue("startDateStr", "date.empty");			
		}
		if(form.getEndDateStr() == null) {
			logger.error("validate(): endDateStr is null!");
			errors.rejectValue("endDateStr", "date.empty");
		}
		if(form.getStartDateStr() != null && form.getEndDateStr() != null) {
			
			boolean dateIsValid= true;
			Date startDate = null;
			Date endDate = null;
			try {
				startDate = DateUtil.parseDate(form.getStartDateStr());
			}catch(ParseException e) {
				dateIsValid= false;
				logger.error("validate(): ParseException for startDateStr!");
				errors.rejectValue("startDateStr", "date.invalid");			
			}
			try {
				endDate = DateUtil.parseDate(form.getEndDateStr());
			}catch(ParseException e) {
				dateIsValid= false;
				logger.error("validate(): ParseException for endDateStr!");
				errors.rejectValue("endDateStr", "date.invalid");			
			}			
			if(dateIsValid) {
				logger.debug("date is valid.");
				if(endDate.before(startDate)) {
					logger.error("validate(): endDate is before startDate!");
					errors.rejectValue("endDateStr", "date.must.after");
				}
			}
			else {
				logger.error("date is invalid!");
			}
		}

	}
	
	
}
