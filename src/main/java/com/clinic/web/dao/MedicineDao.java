package com.clinic.web.dao;

import java.util.List;

import com.clinic.web.entity.Medicine;
import com.clinic.web.search.MedicineCriteria;

public interface MedicineDao {

	public abstract List<Medicine> searchMedicineByType(String aType);

	public abstract Medicine getMedicineByCode(String aCode);
	
	public abstract List<Medicine> searchMedicineByName(String aName);
	
	public abstract List<String> getTypeList();
	
	public abstract Medicine searchMedicineByExactName(String aName);
	
	public List<Medicine> searchMedicine(MedicineCriteria aCriteria);
	
	public void updateMedicine(Medicine aMedicine);
	
	public Integer getNextMedicineId();
	
	public Integer createNewMedicine(Medicine aMedicine);
	
	public Medicine getMedicineById(Integer aMedicineId);
	
	public void deleteMedicineById(Integer aMedicineId);
	
	
}