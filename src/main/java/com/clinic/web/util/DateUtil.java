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
		String temp = aWeatherDateStr.split("???")[0];
		int month = getNumberFromChinese(temp);
		
		return month;
	}
	
	public static int getNumberFromChinese(String aChineseText) {
		int no = 0;
		
		String text = aChineseText.trim().replaceAll(" ", "");
		
		switch(text) {
		case "???":
			no = 1;
			break;
		case "???":
			no = 2;
			break;
		case "???":
			no = 3;
			break;
		case "???":
			no = 4;
			break;
		case "???":
			no = 5;
			break;
		case "???":
			no = 6;
			break;
		case "???":
			no = 7;
			break;
		case "???":
			no = 8;
			break;
		case "???":
			no = 9;
			break;
		case "???":
			no = 10;
			break;			
		case "??????":
			no = 11;
			break;	
		case "??????":
			no = 12;
			break;	
		case "??????":
			no = 13;
			break;	
		case "??????":
			no = 14;
			break;	
		case "??????":
			no = 15;
			break;	
		case "??????":
			no = 16;
			break;	
		case "??????":
			no = 17;
			break;	
		case "??????":
			no = 18;
			break;	
		case "??????":
			no = 19;
			break;	
		case "??????":
			no = 20;
			break;	
		case "??????":
		case "?????????":
			no = 21;
			break;
		case "??????":
		case "?????????":
			no = 22;
			break;
		case "??????":
		case "?????????":
			no = 23;
			break;
		case "??????":
		case "?????????":
			no = 24;
			break;
		case "??????":
		case "?????????":
			no = 25;
			break;	
		case "??????":
		case "?????????":
			no = 26;
			break;
		case "??????":
		case "?????????":
			no = 27;
			break;
		case "??????":
		case "?????????":
			no = 28;
			break;
		case "??????":
		case "?????????":
			no = 29;
			break;	
		case "??????":
			no = 30;
			break;	
		case "?????????":
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
		String temp = aWeatherDateStr.split("???")[1];
		temp = temp.split("???")[0];
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
				output="???";
				break;
			case 2:
				output="???";
				break;
			case 3:
				output="???";
				break;
			case 4:
				output="???";
				break;
			case 5:
				output="???";
				break;
			case 6:
				output="???";
				break;
			case 7:
				output="???";
				break;
			case 8:
				output="???";
				break;
			case 9:
				output="???";
				break;
			case 0:
				output="???";
				break;				
		}
		return output;
	}
	
	private String getDi(int aOrder) {
		String output= "";
		
		switch(aOrder) {
			case 1:
				output=output+"???";
				break;
			case 2:
				output=output+"???";
				break;
			case 3:
				output=output+"???";
				break;
			case 4:
				output=output+"???";
				break;
			case 5:
				output=output+"???";
				break;
			case 6:
				output=output+"???";
				break;
			case 7:
				output=output+"???";
				break;
			case 8:
				output=output+"???";
				break;
			case 9:
				output=output+"???";
				break;
			case 10:
				output=output+"???";
				break;
			case 11:
				output=output+"???";
				break;				
			case 0:
				output=output+"???";
				break;				
		}
		return output;
	}
}
