package com.clinic.web.constant;

public enum AgeGroup {
	FROM_0_TO_5("0-5"),
	FROM_6_TO_10("6-10"),
	FROM_11_TO_15("11-15"),
	FROM_16_TO_20("16-20"),
	FROM_21_TO_25("21-25"),
	FROM_26_TO_30("26-30"),
	FROM_31_TO_35("31-35"),
	FROM_36_TO_40("36-40"),
	FROM_41_TO_45("41-45"),
	FROM_46_TO_50("46-50"),
	FROM_51_TO_55("51-55"),
	FROM_56_TO_60("56-60"),
	FROM_61_TO_65("61-65"),
	ABOVE_66("66+");
	
	private final String name;
	
	private AgeGroup(String aName) {		
		this.name= aName;
	}
	
	public String getName(){
		return this.name;
	}
}
