package com.clinic.web.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.vo.WeatherVo;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@ContextConfiguration("classpath:/spring_clinic.xml")
public class WeatherExtratorTest {
	private static final Logger logger = LoggerFactory.getLogger(WeatherExtratorTest.class);	
	
	@Test
	public void testCurrentWeather() {
		WeatherVo vo = WeatherExtractor.extractCurrentWeather();
		
		logger.info("Date="+vo.getDate());
		
		Assert.assertNotNull(vo.getDate());
	}
	
	@Test
	public void testForecastWeather() throws MalformedURLException, IOException {
		List<WeatherVo> voList = WeatherExtractor.extractHtml();
		
		logger.info("Size="+voList.size());
		
		Assert.assertEquals(9, voList.size());
	}
}
