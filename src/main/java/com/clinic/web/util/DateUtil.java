package com.clinic.web.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import java.time.LocalDate;
import java.time.Period;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DateUtil {

	private static final Logger logger = LoggerFactory
			.getLogger(DateUtil.class);
	
	private static SimpleDateFormat inputDateFormat = new SimpleDateFormat(
			"dd/MM/yyyy");	
	
	private static SimpleDateFormat cacheDateFormat = new SimpleDateFormat(
			"dd/MM/yyyy HH");		
	
	private static SimpleDateFormat displayDateFormat = new SimpleDateFormat(
			"EEE, yyyy/MM/dd HH:mm:ss Z");
	
	private static SimpleDateFormat displayTimeFormat = new SimpleDateFormat(
			"HH:mm");
	
	private static SimpleDateFormat displayDateFormatWithMarker = new SimpleDateFormat(
			"dd/MM/yyyy a");
	
	private static SimpleDateFormat dateTimeFormat = new SimpleDateFormat(
			"dd/MM/yyyy HH:mm");	
	
	private static SimpleDateFormat dbDateFormat = new SimpleDateFormat(
			"yyyy-MM-dd");	

	private static TimeZone utc = TimeZone.getTimeZone("UTC");
	private static TimeZone hk = TimeZone.getTimeZone("Asia/Hong_Kong");
	
	public static String formatDBDate(Date aDate) {
		if(aDate != null){
			dbDateFormat.setTimeZone(hk);
			String dateStr = dbDateFormat.format(aDate);

			return dateStr;
		}
		return null;
	}
	
	public static int getYear(Date aDate) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeZone(hk);
		cal.setTime(aDate);
		
		return cal.get(Calendar.YEAR);
	}
	
	public static int getMonth(Date aDate) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeZone(hk);
		cal.setTime(aDate);
		
		return cal.get(Calendar.MONTH);
	}
	
	public static int getDay(Date aDate) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeZone(hk);
		cal.setTime(aDate);
		
		return cal.get(Calendar.DAY_OF_MONTH);
	}
	
	public static Date addTime(Date aDate, String aTimeString){
		String dateString = inputDateFormat.format(aDate);
		String newDateString = dateString+" "+aTimeString;
		
		try {
			return dateTimeFormat.parse(newDateString);
		}catch(ParseException e) {
			logger.error("Unable to add time:"+aTimeString+" to date:"+aDate);
			return aDate;
		}
	}
	
	public static String formatTime(Date aDate) {
		if(aDate != null){
			displayTimeFormat.setTimeZone(hk);
			String inputDateStr = displayTimeFormat.format(aDate);

			return inputDateStr;
		}
		return null;
	}
	
	public static String formatWithMarker(Date aDate){
		if(aDate != null){
			displayDateFormatWithMarker.setTimeZone(hk);
			String inputDateStr = displayDateFormatWithMarker.format(aDate);

			return inputDateStr;
		}
		return null;
	}

	public static Date parseDate(String aDate) throws ParseException {
		Date inputDate = inputDateFormat.parse(aDate);
		
		return inputDate;
	}
	
	public static String format(Date aDate) {
		if(aDate != null){
			String inputDateStr = inputDateFormat.format(aDate);
			return inputDateStr;
		}		
		return null;
	}
	
	public static String formatDisplay(Date aDate) {
		if(aDate != null){
			displayDateFormat.setTimeZone(hk);
			String inputDateStr = displayDateFormat.format(aDate);

			return inputDateStr;
		}
		return null;
	}
	
	public static String formatCacheDate(Date aDate) {
		if(aDate != null){
			cacheDateFormat.setTimeZone(hk);
			String inputDateStr = cacheDateFormat.format(aDate);

			return inputDateStr;
		}
		return null;
	}
	
	public static int getWeatherMonth(String aWeatherDateStr){
		String temp = aWeatherDateStr.split("月")[0];
		int month = getNumberFromChinese(temp);
		
		return month;
	}
	
	public static int getNumberFromChinese(String aChineseText) {
		int no = 0;
		
		String text = aChineseText.trim().replaceAll(" ", "");
		
		switch(text) {
		case "一":
			no = 1;
			break;
		case "二":
			no = 2;
			break;
		case "三":
			no = 3;
			break;
		case "四":
			no = 4;
			break;
		case "五":
			no = 5;
			break;
		case "六":
			no = 6;
			break;
		case "七":
			no = 7;
			break;
		case "八":
			no = 8;
			break;
		case "九":
			no = 9;
			break;
		case "十":
			no = 10;
			break;			
		case "十一":
			no = 11;
			break;	
		case "十二":
			no = 12;
			break;	
		case "十三":
			no = 13;
			break;	
		case "十四":
			no = 14;
			break;	
		case "十五":
			no = 15;
			break;	
		case "十六":
			no = 16;
			break;	
		case "十七":
			no = 17;
			break;	
		case "十八":
			no = 18;
			break;	
		case "十九":
			no = 19;
			break;	
		case "二十":
			no = 20;
			break;	
		case "廿一":
		case "二十一":
			no = 21;
			break;
		case "廿二":
		case "二十二":
			no = 22;
			break;
		case "廿三":
		case "二十三":
			no = 23;
			break;
		case "廿四":
		case "二十四":
			no = 24;
			break;
		case "廿五":
		case "二十五":
			no = 25;
			break;	
		case "廿六":
		case "二十六":
			no = 26;
			break;
		case "廿七":
		case "二十七":
			no = 27;
			break;
		case "廿八":
		case "二十八":
			no = 28;
			break;
		case "廿九":
		case "二十九":
			no = 29;
			break;	
		case "三十":
			no = 30;
			break;	
		case "三十一":
			no = 31;
			break;	
		default:
			no = Integer.parseInt(aChineseText.trim());
		}
		return no;
	}
	
	public String getChineseYear(int aChineseYear) {
		String output = null;
		if(aChineseYear > 3) {
			int temp = aChineseYear -3;
			int remainder = temp%10;
			
			output = getTian(remainder);
			
			int temp2 = aChineseYear -3;
			int remainder2 = temp2%12;
			
			output = output+ getDi(remainder2);			
		}
		return output;
	}
	
	public String getChineseMonth(int aChineseYear, int aChineseMonth) {
		String output = null;
		if(aChineseYear > 3) {
			int temp = aChineseYear -3;
			int remainder = temp%10;
			temp = remainder*2+aChineseMonth;
			remainder = temp%10;
			
			output = getTian(remainder);
			output = output+ getDi((aChineseMonth+2)%12);			
		}
		return output;
	}
	
	public static int getWeatherDay(String aWeatherDateStr){
		String temp = aWeatherDateStr.split("月")[1];
		temp = temp.split("日")[0];
		int day = getNumberFromChinese(temp);
		
		return day;
	}
	
	public static Date getTodayWithoutTime() {
		Calendar cal = Calendar.getInstance();
		cal.setTimeZone(hk);	
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		
		return cal.getTime();
	}
	
	public static Date getMonthBefore(Date aDate, int months){
		Calendar cal = Calendar.getInstance();
		cal.setTimeZone(hk);
		cal.setTime(aDate);
		cal.add(Calendar.MONTH, months*-1);
		cal.add(Calendar.DAY_OF_MONTH, -1);
		
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		
		return cal.getTime();
	}
	
	public static Integer calculateAge(Date aDOB, Date aToday) {
		if(aDOB != null && aToday != null) {
		
			LocalDate dob = new java.sql.Date(aDOB.getTime()).toLocalDate();
			LocalDate today = new java.sql.Date(aToday.getTime()).toLocalDate();
		
			if(dob != null && today != null) {
				return Period.between(dob, today).getYears();
			}
		}
		return null;
	}
	
	private String getTian(int aOrder) {
		String output = "";
		
		switch(aOrder) {
			case 1:
				output="甲";
				break;
			case 2:
				output="乙";
				break;
			case 3:
				output="丙";
				break;
			case 4:
				output="丁";
				break;
			case 5:
				output="戊";
				break;
			case 6:
				output="已";
				break;
			case 7:
				output="庚";
				break;
			case 8:
				output="辛";
				break;
			case 9:
				output="壬";
				break;
			case 0:
				output="癸";
				break;				
		}
		return output;
	}
	
	private String getDi(int aOrder) {
		String output= "";
		
		switch(aOrder) {
			case 1:
				output=output+"子";
				break;
			case 2:
				output=output+"丑";
				break;
			case 3:
				output=output+"寅";
				break;
			case 4:
				output=output+"卯";
				break;
			case 5:
				output=output+"辰";
				break;
			case 6:
				output=output+"巳";
				break;
			case 7:
				output=output+"午";
				break;
			case 8:
				output=output+"未";
				break;
			case 9:
				output=output+"申";
				break;
			case 10:
				output=output+"酉";
				break;
			case 11:
				output=output+"戌";
				break;				
			case 0:
				output=output+"亥";
				break;				
		}
		return output;
	}
}
