package com.clinic.web.dao;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.clinic.web.entity.PriceSystem;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@ContextConfiguration("classpath:/spring_clinic.xml")
public class PriceDaoTest {
	
	@Resource
	private PriceDao priceDao;
	
	@Test
	public void testLoadContext() {
		Assert.notNull(priceDao);
	}
	
	@Test
	public void testPriceSystem() {
		List<PriceSystem> systemList = priceDao.getEffectivePriceSystem();
		
		System.out.println(systemList.size()+":"+systemList.get(0).getEffectiveDate());
		System.out.println(systemList.size()+":"+systemList.get(1).getEffectiveDate());
	}
}
