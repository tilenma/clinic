package com.clinic.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="\"Symptoms\"")
public class Symptoms {
	@Id
	@Column(name="\"symptomID\"")	
	private Integer symptomID;	
	
	@Column(name="type")
	private String type;
	
	@Column(name="level")
	private Integer level;
	
	@Column(name="description")
	private String description;	
	
	@Transient
	private boolean nextLevel;	//used by frontend
	
	public Integer getSymptomID() {
		return symptomID;
	}
	public void setSymptomID(Integer symptomID) {
		this.symptomID = symptomID;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isNextLevel() {
		return nextLevel;
	}
	public void setNextLevel(boolean nextLevel) {
		this.nextLevel = nextLevel;
	}	
}
