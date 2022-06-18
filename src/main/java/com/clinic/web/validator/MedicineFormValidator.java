package com.clinic.web.validator;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clinic.web.dao.MedicineDao;
import com.clinic.web.entity.Medicine;
import com.clinic.web.form.MedicineForm;

public class MedicineFormValidator implements Validator {
	private static Logger logger = LoggerFactory.getLogger(MedicineFormValidator.class);
	
	@Resource
	private MedicineDao medicineDao;
	
	@Override
	public boolean supports(Class<?> clazz) {		
		return MedicineForm.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		MedicineForm form = (MedicineForm)obj;
		
		if(form.getCode().isEmpty()){
			errors.rejectValue("code", "code.empty");
		}
		else {
			Medicine med = medicineDao.getMedicineByCode(form.getCode());
			if(med != null) {
				errors.rejectValue("code", "code.duplicate");
			}
		}
				
		if(form.getName().isEmpty()){
			errors.rejectValue("name", "name.empty");
		}
		
		if(form.getType().isEmpty() || "-1".compareTo(form.getType())==0){
			errors.rejectValue("type", "type.empty");
		}
		
		if(form.getPriceCategory().isEmpty() || "-1".compareTo(form.getPriceCategory())==0){
			errors.rejectValue("priceCategory", "priceCategory.empty");
		}		
	}
	
}
