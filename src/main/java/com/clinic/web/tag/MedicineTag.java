package com.clinic.web.tag;

public class MedicineTag {
	private Integer id;
	private String code;
	private String type;
	private String name;
	
	public MedicineTag(Integer aId, String aType, String aCode, String aName){
		this.id = aId;
		this.code = aCode;
		this.type = aType;
		this.name = aName;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}	
	
}
