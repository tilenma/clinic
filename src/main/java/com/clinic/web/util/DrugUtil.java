package com.clinic.web.util;

import java.util.Arrays;
import java.util.List;

public class DrugUtil {
	private static final List<String> drugMedicineList = Arrays.asList("丸","方","藥","外");
	
	public static boolean isDrug(String aType){
		if(aType != null){
			if(drugMedicineList.contains(aType)){
				return true;
			}
		}		
		return false;
	}
	
	public static boolean isPoint(String aType){
		if(aType != null && "針".compareTo(aType)==0){
			return true;
		}
		return false;
	}
	
	public static boolean isFormula(String aType){
		if(aType != null && "方".compareTo(aType)==0){
			return true;
		}
		return false;
	}
}
