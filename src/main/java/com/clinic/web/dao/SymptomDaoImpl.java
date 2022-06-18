package com.clinic.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Property;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.entity.Symptoms;

@EnableCaching
public class SymptomDaoImpl implements SymptomDao {
	private static Logger logger = LoggerFactory.getLogger(SymptomDaoImpl.class);
	
	private SessionFactory sessionFactory;
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.SymptomDao#getSymptom(java.lang.String, java.lang.Integer)
	 */
	@Override
	@Transactional(readOnly=true)
	@Cacheable("symptomList")
	public List<Symptoms> getSymptom(String aType, Integer aLevel){
		Session session = this.sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Symptoms.class);
		
		Criterion c1 =  Property.forName("type").eq(aType);
		Criterion c2 =  Property.forName("level").eq(aLevel);
		
		criteria.add(c1);
		criteria.add(c2);
		
		List<Symptoms> symptomList = criteria.list();
		
		if(symptomList != null && symptomList.size()>0){
			return symptomList;
		}
		else{
			return new ArrayList<Symptoms>();
		}
			
	}
	
	@Override
	@Transactional(readOnly=true)
	@Cacheable("parentSymptom")
	public Symptoms getParentSymptom(String aType, Integer aLevel){
		if(aLevel==0){
			return null;
		}
		Session session = this.sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Symptoms.class);
		
		Criterion c1 =  Property.forName("description").eq(aType);
		Criterion c2 =  Property.forName("level").eq(aLevel-1);
		
		criteria.add(c1);
		criteria.add(c2);
		
		List<Symptoms> symptomList = criteria.list();	
		
		if(symptomList != null && symptomList.size()>0){
			logger.info("getParentSymptom():search parent for type="+aType+" and level="+aLevel+" and result list="+symptomList.size());
			
			return symptomList.get(0);
		}
		else{
			return null;
		}
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
