package com.clinic.web.tag;

public class CustomerTag {
	private Long id;
	private String name;
	
	public CustomerTag(Long aId, String aName){
		this.id = aId;
		this.name = aName;		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
