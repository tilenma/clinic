package com.clinic.web.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.entity.PriceCategory;
import com.clinic.web.entity.PriceList;
import com.clinic.web.entity.PriceSystem;
import com.clinic.web.entity.Units;
import com.clinic.web.util.NumberUtil;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

@EnableCaching
public class PriceDaoImpl implements PriceDao {
	private static Logger logger = LoggerFactory.getLogger(PriceDaoImpl.class);
	
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional(readOnly=true)
	public Set<String> getEffectiveOtherType(){
		List<PriceSystem> systemList = this.getEffectivePriceSystem();
		
		Map<String,String> specialTypeMap = new HashMap<String,String>();
		for(PriceSystem ps:systemList) {
			Map<String,BigDecimal> priceListMap = this.getPriceList(ps.getSystemId());
			
			Set<String> typeNames = priceListMap.keySet();
			Iterator<String> it = typeNames.iterator();
			while(it.hasNext()) {
				String type = it.next();
				specialTypeMap.put(type, type);
			}
		}
		
		return specialTypeMap.keySet();
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<PriceSystem> getEffectivePriceSystem(){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(PriceSystem.class,"ps");
		
		//Only select enabled
		Criterion c =  Property.forName("enabled").eq(true);		
		criteria.add(c);
	
		//Only select name with latest effective date
		DetachedCriteria maxQuery = DetachedCriteria.forClass( PriceSystem.class, "ps2");
		maxQuery.setProjection(Property.forName("effectiveDate").max());
		maxQuery.add(Property.forName("ps2.name").eqProperty("ps.name"));
				
		criteria.add(Property.forName("effectiveDate").eq(maxQuery));
		criteria.addOrder(Order.asc("name"));
		
		return (List<PriceSystem>)criteria.list();		
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.PriceDao#getPriceList()
	 */
	@Override
	@Transactional(readOnly=true)
	public Map<String,BigDecimal> getPriceList(Integer aSystemId){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(PriceList.class);		
		Criterion c =  Property.forName("systemId").eq(aSystemId);
		criteria.add(c);
		criteria.addOrder(Order.asc("category"));
		
		List<PriceList> priceList = criteria.list();
		
		Map<String,BigDecimal> priceMap = new HashMap<String,BigDecimal>();
		
		for(PriceList price: priceList){
			priceMap.put(price.getCategory(), price.getPrice());
		}
		
		return priceMap;		
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.PriceDao#getWeightList()
	 */
	@Override
	@Transactional(readOnly=true)
	@Cacheable("weightList")
	public Map<String,BigDecimal> getWeightList(){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(PriceCategory.class);		
		criteria.addOrder(Order.asc("category"));
		
		List<PriceCategory> weightList = criteria.list();
		
		Map<String,BigDecimal> weightMap = new HashMap<String,BigDecimal>();
		
		for(PriceCategory vo: weightList){
			weightMap.put(vo.getCategory(), vo.getWeight());
		}
		
		return weightMap;		
	}
	
	@Override
	@Transactional(readOnly=true)
	@Cacheable("unitList")
	public List<String> getUnitList(){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Units.class);		
		//criteria.addOrder(Order.asc("value"));
		Criterion c =  Property.forName("unitsKey.type").eq("amount");		
		criteria.add(c);
		
		List<Units> unitList = criteria.list();
		List<String> outputList = new ArrayList<String>();
		
		for(Units vo: unitList){
			outputList.add(NumberUtil.formatPrice(vo.getValue()));
		}
		
		return outputList;		
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}	
