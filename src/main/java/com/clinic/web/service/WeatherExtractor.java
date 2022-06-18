package com.clinic.web.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.clinic.web.exception.ClinicRuntimeException;
import com.clinic.web.vo.WeatherVo;


public class WeatherExtractor {
	private static final Logger logger = LoggerFactory.getLogger(WeatherExtractor.class);	
	
	public static final String SOURCE = "https://www.hko.gov.hk/textonly/v2/forecast/ndayc.htm";
	public static final String SOURCE_NOW = "https://www.hko.gov.hk/textonly/v2/forecast/chinesewx2.htm";
	public static final String IMAGE_PREFIX = "https://www.hko.gov.hk/images/HKOWxIconOutline/pic";	
	
	public static WeatherVo extractCurrentWeather() {
		String url = SOURCE_NOW;
		WeatherVo currentWeather = new WeatherVo();
		
		try{
			Document document = Jsoup.connect(url).get();
			//Document document = Jsoup.parse(new URL(url).openStream(), "UTF-8", url);
			
			if(document != null){				
				Element content = document.select("p").get(1).select("span").first();
				Element content2 = document.select("pre").first();
				
				String dateStr = content.text().replace("香 港 天 文 台 於 ", "");//香 港 天 文 台 於 2019 年 12 月 04 日 12 時 02 分 發 出 之 天 氣 報 告
				dateStr = dateStr.substring(dateStr.indexOf(" 年 ")+3);
				dateStr = dateStr.replace(" 發 出 之 天 氣 報 告", "");
				dateStr = dateStr.replaceAll(" ", "");
				
				currentWeather.setDate(dateStr);
				
				BufferedReader reader = new BufferedReader(new StringReader(content2.text()));
				String line = reader.readLine();
				while(line != null) {
					if(line.contains("氣 溫 ：")) {
						currentWeather.setTemperature(line.replace("氣 溫 ： ", ""));
					}
					else if(line.contains("相 對 濕 度 ：")) {
						currentWeather.setHumidity(line.replace("相 對 濕 度 ： ", ""));
					}
					else if(line.contains("天 氣 插 圖：")) {
						if(line.contains("編 號 ")) {
							if(line.contains(" - ")) {						
								currentWeather.setCode(line.substring(line.indexOf("編 號 ")+4,line.indexOf(" - ")));
								currentWeather.setDescription(line.substring(line.indexOf(" - ")+3));
								currentWeather.setImageUrl(IMAGE_PREFIX+currentWeather.getCode()+".png");
							}
							else if(line.contains("(編 號 ") && line.contains(")")){
								currentWeather.setCode(line.substring(line.indexOf("(編 號  ")+5,line.indexOf(")")));
								currentWeather.setDescription(line.substring(line.indexOf("天 氣 插 圖：")+9,line.indexOf("(")));
								currentWeather.setImageUrl(IMAGE_PREFIX+currentWeather.getCode()+".png");
							}
						}
						else {
							currentWeather.setDescription(line.substring(line.indexOf("天 氣 插 圖：")+9));
						}
						break;
					}
				
					//get next line
					line = reader.readLine();
				}				
			}
			
			return currentWeather;
		}catch(IOException e){
			throw new ClinicRuntimeException("Cannot connect to hko now source!",e);
		}
	}
	
	public static List<WeatherVo> extractHtml(){
		String url = SOURCE;
		
		try{
			//Document document = Jsoup.connect(url).get();
			Document document = Jsoup.parse(new URL(url).openStream(), "UTF-8", url);
			
			if(document != null){
				List<WeatherVo> weatherList = new ArrayList<WeatherVo>();
				Element content = document.select("pre").first();
				
				if(content != null) {
					String[] content2 = content.text().split("\n\n");
					logger.debug("content2 size ="+content2.length);
					BufferedReader reader = null;
					BufferedReader reader2 = null;
					WeatherVo tempVo = null;
					String tempLine = "";
					
					if(content2.length >=13) {
						//Extract 9 days content
						
						//Setup image content
						reader2 = new BufferedReader(new StringReader(content2[12]));
						reader2.readLine(); //九 天 天 氣 預 報 插 圖
						
						for(int i=2;i<11;i++) {
							tempVo = new WeatherVo();
							
							reader = new BufferedReader(new StringReader(content2[i]));
							tempVo.setDate(reader.readLine()); //十 二 月 十 日 ( 星 期 二 )
							reader.readLine(); //風 　 ： 東 至 東 北 風 3 至 4 級 。
							tempVo.setDescription(reader.readLine().replace("天 氣 ： ", "")); //天 氣 ： 大 致 天 晴 。 						
							tempVo.setTemperature(reader.readLine().replace("氣 溫 ： ", "").replace(" 。", "")); //氣 溫 ： 15 至 20 度 。
							tempVo.setHumidity(reader.readLine().replace("相 對 濕 度 ： ","").replace(" 。", "")); //相 對 濕 度 ： 百 分 之 55 至 80 。
							
							tempLine = reader2.readLine(); //第 一 天 插 圖 編 號 81 - 乾 燥 
							tempVo.setCode(tempLine.substring(tempLine.indexOf("編 號 ")+4,tempLine.indexOf(" - ")));
							tempVo.setImageUrl(IMAGE_PREFIX+tempVo.getCode()+".png");
							
							weatherList.add(tempVo);
						}
					}
					else {
						//length < 13
						throw new ClinicRuntimeException("Incorrect data length in weather table!");
					}
				}
				else {
					//unable to locate <pre>
					throw new ClinicRuntimeException("Cannot locate <pre> tag in weather table!");
				}
				
				return weatherList;
				
			}else{
				
				throw new ClinicRuntimeException("Cannot locate weather table!");
			}
		}catch(IOException e){
			throw new ClinicRuntimeException("Cannot connect to hko source!",e);
		}
	}
	
	
}
