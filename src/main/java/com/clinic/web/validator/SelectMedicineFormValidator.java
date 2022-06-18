package com.clinic.web.validator;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clinic.web.form.SelectMedicineForm;

public class SelectMedicineFormValidator implements Validator{
	private static Logger logger = LoggerFactory.getLogger(SelectMedicineFormValidator.class);

	@Override
	public boolean supports(Class<?> arg0) {
		return SelectMedicineForm.class.equals(arg0);
	}

	@Override
	public void validate(Object arg0, Errors errors) {
		SelectMedicineForm form = (SelectMedicineForm)arg0;
		
		List<String> medicineNames = form.getMedicineNames();
		List<String> filteredNames = new ArrayList<String>();
		for(String name: medicineNames){
			if(name != null && name.trim().length()>0){
				filteredNames.add(name);
			}
		}
		if(filteredNames.size()==0){
			errors.rejectValue("medicineNames", "medicine.empty");
		}	
	}
	
	
}
