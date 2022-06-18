package com.clinic.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.clinic.web.service.AccessControlService;
import com.clinic.web.service.LunarExtractor;
import com.clinic.web.service.WeatherExtractor;
import com.clinic.web.util.DatabaseUtil;
import com.clinic.web.util.DateUtil;
import com.clinic.web.vo.WeatherVo;

@Controller
public class ClinicController {
	private static final Logger logger = LoggerFactory.getLogger(ClinicController.class);	
	
	// Service
	@Resource
	private AccessControlService accessControlService;
	
	// Cache
	private Map<String,List<WeatherVo>> weatherMap = new HashMap<String,List<WeatherVo>>();
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		String formattedDate = DateUtil.formatDisplay(date);
		String cacheKey = DateUtil.formatCacheDate(date);

		model.addAttribute("serverTime", formattedDate);
		
		try {
			String jdbc = DatabaseUtil.getJdbcUrl2();
			model.addAttribute("jdbc", jdbc);
		}catch(Exception e) {
			logger.error("Unable to read system parameter!",e);
		}
		setUserName(model);		
		
		//Get weather
		List<WeatherVo> weatherTable = new ArrayList<WeatherVo>();		
		
		try{
			if(weatherMap.get(cacheKey)==null){
				//Extract current weather
				WeatherVo current = WeatherExtractor.extractCurrentWeather();
				
				if(current != null) {
					//Extract extractGanzhi
					try {
						String todayStr = current.getDate();
						int day = Integer.parseInt(todayStr.substring(todayStr.indexOf("月")+1,todayStr.indexOf("日")));
						String granzhi = LunarExtractor.extractGanzhi(day);
						logger.debug("Today's granzhi="+granzhi);
						current.setGranzhi(granzhi);						
					}catch(Exception e){
						logger.error("Unable to get Ganzhi!",e);
					}
					
					weatherTable.add(current);
				}
				
				//Extract 9 days forecast weather
				List<WeatherVo> forecast = WeatherExtractor.extractHtml();
				if(forecast != null && forecast.size()>0) {
					weatherTable.addAll(forecast);
				}
			
				//Extract lunar date
				LunarExtractor.setLunar(weatherTable);				
				weatherMap.put(cacheKey, weatherTable);
			}
			else{
				logger.info("weatherTable cache is loaded.");
				weatherTable = weatherMap.get(cacheKey);
			}

		}catch(Exception e){
			logger.error("Unable to get weather table!",e);
			weatherTable = new ArrayList<WeatherVo>();
		}
		finally{
			model.addAttribute("weatherTable", weatherTable);
		}
		
		return "home";
	}	

	private void setUserName(Model model) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		String name = "Guest";
		boolean isLogin = false;
		if (auth.isAuthenticated()
				&& !"anonymousUser".equalsIgnoreCase(auth.getName())) {
			isLogin = true;
			name = auth.getName();
			
			model.addAttribute("showAdmin", accessControlService.showAdminFunction(auth));
			model.addAttribute("showAdvanced", accessControlService.showAdvancedFunction(auth));
		}
		else {
			model.addAttribute("showAdvanced", false);
		}

		logger.info("isLogin=" + isLogin + " & username=" + name);

		model.addAttribute("isLogin", isLogin);
		model.addAttribute("username", name);
	}
}
