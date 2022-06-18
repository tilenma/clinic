package com.clinic.web.form;

import java.io.Serializable;
import java.util.List;

public class SelectMedicineForm implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6167990452635398677L;

	private List<String> medicineNames;

	public List<String> getMedicineNames() {
		return medicineNames;
	}

	public void setMedicineNames(List<String> medicineNames) {
		this.medicineNames = medicineNames;
	}
}
