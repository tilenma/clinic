package com.clinic.web.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class NumberUtil {	
	private static DecimalFormat df = new DecimalFormat("#######0.00");
	
	private static DecimalFormat unitdf = new DecimalFormat("####0.0");
	
	public static String formatPrice(BigDecimal aNumber){
		return df.format(aNumber);
	}
	
	public static String formatUnit(BigDecimal aNumber){
		return unitdf.format(aNumber);
	}
}
