package com.clinic.web.constant;

public enum Action {
	PRINT_CERT("列印病假紙"),
	PRINT_FOLLOWUP("列印到診紙"),
	PRINT_RECEIPT("列印收據"),
	CHECK_PRESCRIPTION("處方確認"),
	CONFIRM_PRESCRIPTION("一鍵處方確認"),
	PRINT_PRESCRIPTION("列印處方報表"),
	PRINT_CUSTOMER_REPORT("列印客戶報表"),
	CREATE_CASE("新增病案"),
	UPDATE_CASE("更新病案"),
	CREATE_CUSTOMER("新增客戶"),
	UPDATE_CUSTOMER("更新客戶")
	;
	
	private String code;
	
	Action(String aCode){
		this.code = aCode;
	}

	public String getCode() {
		return code;
	}
}
