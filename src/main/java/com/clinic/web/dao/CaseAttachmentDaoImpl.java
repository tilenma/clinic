package com.clinic.web.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Property;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate4.SessionFactoryUtils;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.entity.CaseAttachment;

public class CaseAttachmentDaoImpl implements CaseAttachmentDao {
	private static Logger logger = LoggerFactory.getLogger(CaseAttachmentDaoImpl.class);
	
	private SessionFactory sessionFactory;
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseAttachmentDao#saveAttachment(com.clinic.web.entity.CaseAttachment)
	 */
	@Override
	@Transactional
	public Integer saveAttachment(CaseAttachment aCaseAttachment) {
		Session session = this.sessionFactory.getCurrentSession();		
		Integer fileId = (Integer)session.save(aCaseAttachment);
		
		return fileId;
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseAttachmentDao#getAttachment(java.lang.Long)
	 */
	@Override
	@Transactional(readOnly=true)
	public CaseAttachment getAttachment(Integer aFileId) {
		Session session = this.sessionFactory.getCurrentSession();		
		CaseAttachment caseAttachment = (CaseAttachment)session.get(CaseAttachment.class, aFileId);
		
		return caseAttachment;
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseAttachmentDao#deleteAttachment(java.lang.Long)
	 */
	@Override
	@Transactional
	public void deleteAttachment(Integer aFileId) {
		Session session = this.sessionFactory.getCurrentSession();		
		CaseAttachment caseAttachment = this.getAttachment(aFileId);		
		
		session.delete(caseAttachment);
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseAttachmentDao#getAttachmentList(java.lang.Integer)
	 */
	@Override
	@Transactional(readOnly=true)
	public List<CaseAttachment> getAttachmentList(Integer aCaseId){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(CaseAttachment.class);
		Criterion c =  Property.forName("caseId").eq(aCaseId);
		criteria.add(c);
		
		return (List<CaseAttachment>)criteria.list();
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public synchronized Integer getNextFileId(){
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "SELECT NEXTVAL('\""+"file_id_seq"+"\"')";
		
		Integer nextId = jdbcTemplate.queryForObject(sql, Integer.class);
		
		return nextId;
	}
}
