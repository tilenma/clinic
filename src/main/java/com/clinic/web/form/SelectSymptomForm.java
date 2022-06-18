package com.clinic.web.form;

public class SelectSymptomForm {
	private String currentType;
	private Integer currentLevel;
	
	private String nextType;
	private Integer nextLevel;
	
	private String previousType;
	private Integer previousLevel;
	
	public String getCurrentType() {
		return currentType;
	}
	public void setCurrentType(String currentType) {
		this.currentType = currentType;
	}
	public Integer getCurrentLevel() {
		return currentLevel;
	}
	public void setCurrentLevel(Integer currentLevel) {
		this.currentLevel = currentLevel;
	}
	public String getNextType() {
		return nextType;
	}
	public void setNextType(String nextType) {
		this.nextType = nextType;
	}
	public Integer getNextLevel() {
		return nextLevel;
	}
	public void setNextLevel(Integer nextLevel) {
		this.nextLevel = nextLevel;
	}
	public String getPreviousType() {
		return previousType;
	}
	public void setPreviousType(String previousType) {
		this.previousType = previousType;
	}
	public Integer getPreviousLevel() {
		return previousLevel;
	}
	public void setPreviousLevel(Integer previousLevel) {
		this.previousLevel = previousLevel;
	}
	
	
}
