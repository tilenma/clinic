package com.clinic.web.constant;

import java.util.Locale;

public class ClinicConstant {
	public static final Integer STATISTIC_COUNT = 3;
	
	public static final String CONTENT_TYPE_PDF = "application/pdf";	
	public static final String CONTENT_TYPE_DOCX = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
	
	public static final String REPORT_FORMAT_PDF = "pdf";
	
	public static final String REPORT_FORMAT_XLSX = "xlsx";
	
	public static final String REPORT_FORMAT_CSV = "csv";
	
	public static final String REPORT_FORMAT_DOCX = "docx";
	
	public static final String REPORT_FORMAT_ZIP = "zip";
	
	public static final Locale LOCALE_EN = Locale.ENGLISH;
	
	public static final String PRICE_REMARK_TYPE = "計算";
	
	public static final String OTHER_REMARK_TYPE = "其他";
	
	public static final String MEDIC_TYPE = "藥";
	
	public static final String DEFAULT_DOCTER = "嚴允材";
	public static final String DEFAULT_DOCTER_EN = "Yim Wan Choi";
	public static final String DEFAULT_REGISTOR_NO = "005410";
	
	// Create new case
	public static final Integer DEFAULT_DOSAGE = 2;
	public static final String DEFAULT_DOSAGE_METHOD = "飯後一次，以溫水沖服";
	public static final String DEFAULT_DOSAGE_RECOMMEND = "忌肥膩、魚腥、發物、粘滯，調情志，善作息";
	
	// PDF META DATA
	public static final String RPT_AUTHOR = "JianZhi";
	public static final String RPT_CREATOR = "Web";
	public static final String RPT_SUBJECT = "REPORT";
	
	public static final String LANG_TC = "tc";
	public static final String LANG_EN = "en";
	
	public static final Integer DEFAULT_STATISTIC_PERIOD = 3;
	
	public static final Integer SEARCH_RESULT_LIMIT = 10;
	
	public static final Integer DEFAULT_STATISTIC_GROUP = 8;
	
	public static final String DEFAULT_UNIT2 = "g";
	
	public static final Boolean DEFAULT_CONFIRM = Boolean.FALSE;
}
