package com.clinic.web.service;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.clinic.web.exception.ClinicRuntimeException;
import com.clinic.web.util.DateUtil;
import com.clinic.web.vo.WeatherVo;


public class LunarExtractor {
	private static final Logger logger = LoggerFactory.getLogger(LunarExtractor.class);	
	
	public static final String SOURCE = "http://www.nongli.info/index.php?c=solar";
	
	public static final String SOURCE_GANZHI = "https://wannianrili.51240.com/";
	
	public static void setLunar(List<WeatherVo> aWeatherList){
		
		Calendar cal = Calendar.getInstance();
		if(aWeatherList.size()==10) { //the first one is current date/time
			WeatherVo currentVo = aWeatherList.get(0);
			
			int month = DateUtil.getWeatherMonth(currentVo.getDate());
			int day = DateUtil.getWeatherDay(currentVo.getDate());
			
			logger.debug("date str="+currentVo.getDate()+" month="+month+" day="+day);
			cal.set(Calendar.MONTH, month-1); //-1
			cal.set(Calendar.DAY_OF_MONTH, day);
			
			for(WeatherVo vo:aWeatherList){
				vo.setLunarDate(extractHtml(cal.getTime()));
				
				cal.add(Calendar.DAY_OF_MONTH, 1);
			}
		}
		else {
			for(WeatherVo vo:aWeatherList){
				String dateString = vo.getDate();
				
				cal.add(Calendar.DAY_OF_MONTH, 1);
				int year = cal.get(Calendar.YEAR);
				cal.set(Calendar.YEAR, year);
				cal.set(Calendar.MONTH, DateUtil.getWeatherMonth(dateString)-1); //-1
				cal.set(Calendar.DAY_OF_MONTH, DateUtil.getWeatherDay(dateString));
				
				vo.setLunarDate(extractHtml(cal.getTime()));			
			}
		}
	}
	
	public static String extractHtml(Date aSolarDate){
		String output = "";
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(aSolarDate);
		String url = SOURCE+"&year="+cal.get(Calendar.YEAR)+"&month="+(cal.get(Calendar.MONTH)+1)+"&date="+cal.get(Calendar.DAY_OF_MONTH);	
		
		logger.debug("extractHtml for lunar from url:"+url);
		try{
			Document document = Jsoup.connect(url).get();
			
			if(document != null){
			
				Element td = document.select("td[bgcolor]").first();
				Element span = td.select("span").first();

				output = span.text();				
			}else{				
				throw new ClinicRuntimeException("Cannot locate weather table!");
			}
		}catch(IOException e){
			throw new ClinicRuntimeException("Cannot connect to hko source!",e);
		}
		
		return output;
	}
	
	public static String extractGanzhi(int aDay){
		String output = "";		
		
		String url = SOURCE_GANZHI;
		
		logger.debug("extractGanzhi for lunar from url:"+url);
		try{
			Document document = Jsoup.connect(url).get();
			
			if(document != null){
				String divStr = "div#wnrl_k_you_id_"+(aDay-1);
				Element td = document.select(divStr).first();
				Element span = td.select("div.wnrl_k_you_id_wnrl_nongli_ganzhi").first();

				output = span.text();	
			}else{				
				throw new ClinicRuntimeException("Cannot locate ganzhi table!");
			}
		}catch(IOException e){
			throw new ClinicRuntimeException("Cannot connect to ganzhi source!",e);
		}catch(Exception e){
			throw new ClinicRuntimeException("Unexpected runtime exception",e);
		}
		
		return output;
	}
	
	
}
