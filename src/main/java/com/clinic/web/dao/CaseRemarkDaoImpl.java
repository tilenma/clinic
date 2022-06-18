package com.clinic.web.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Property;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.entity.CaseRemark;
import com.clinic.web.entity.CaseRemarkKey;

public class CaseRemarkDaoImpl implements CaseRemarkDao {
	private static Logger logger = LoggerFactory.getLogger(CaseRemarkDaoImpl.class);
	
	private SessionFactory sessionFactory;
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseRemarkDao#delete(java.lang.Long, java.lang.String)
	 */
	@Override
	@Transactional
	public void delete(Long aCaseId, String aType){
		Session session = this.sessionFactory.getCurrentSession();
		
		CaseRemarkKey key = new CaseRemarkKey(aCaseId, aType);
		CaseRemark remark= new CaseRemark(key, "");
		
		session.delete(remark);
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseRemarkDao#getRemarksById(java.lang.Long)
	 */
	@Override
	@Transactional(readOnly=true)
	public List<CaseRemark> getRemarksById(Long aCaseId){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(CaseRemark.class);
		criteria.add(Property.forName("caseRemarkKey.caseID").eq(aCaseId));
		
		return (List<CaseRemark>)criteria.list();		
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseRemarkDao#saveOrUpdateRemark(java.lang.Long, java.lang.String, java.lang.String)
	 */
	@Override
	@Transactional
	public void saveOrUpdateRemark(Long aCaseId, String aType, String aDescription){
		Session session = this.sessionFactory.getCurrentSession();
		
		CaseRemarkKey key = new CaseRemarkKey(aCaseId, aType);
		CaseRemark remark = new CaseRemark(key,aDescription);
		
		session.saveOrUpdate(remark);
		
		/*
		CaseRemark remark = (CaseRemark)session.get(CaseRemark.class, key);
		
		//existed --> update
		if(remark != null){
			remark.setDescription(aDescription);
			session.update(remark);
		}
		else{
			
		}
		*/
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
