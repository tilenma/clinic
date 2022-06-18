package com.clinic.web.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.entity.Symptoms;

public interface SymptomDao {

	public abstract List<Symptoms> getSymptom(String aType, Integer aLevel);
	
	public Symptoms getParentSymptom(String aType, Integer aLevel);

}