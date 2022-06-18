package com.clinic.web.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Junction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate4.SessionFactoryUtils;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.constant.ClinicConstant;
import com.clinic.web.entity.Cases;
import com.clinic.web.entity.CasesView;
import com.clinic.web.search.CaseCriteria;
import com.clinic.web.vo.CaseResultCountVo;

public class CasesDaoImpl implements CasesDao {
	private static Logger logger = LoggerFactory.getLogger(CasesDaoImpl.class);
	
	private SessionFactory sessionFactory;	
	
	@Override
	@Transactional
	public void confirmCases(Long aCaseId, String aUsername) {
		Cases cases = this.getCaseById(aCaseId);
		cases.setConfirm(Boolean.TRUE);
		cases.setConfirmUser(aUsername);
		
		this.updateCases(cases);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<Cases> searchCasesByMedicine(List<String> medicineName, Boolean aDescOrder){
		
		logger.info("searchCasesByMedicine() start...");
		
		if(medicineName == null || medicineName.size() <= 0){
			return null;
		}
		
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Cases.class);
		Criteria medicinesCrt = criteria.createCriteria("medicines");
		Junction conditionGroup = Restrictions.disjunction();
		
		for(String medicine: medicineName){
			conditionGroup.add(Restrictions.like("caseMedicineKey.name", "%"+medicine+"%"));
		}
		medicinesCrt.add(conditionGroup);
		
		if(aDescOrder){
			criteria.addOrder(Order.desc("date"));
			criteria.addOrder(Order.desc("caseID"));
		}
		else{
			criteria.addOrder(Order.asc("date"));
			criteria.addOrder(Order.asc("caseID"));
		}
		
		logger.info("searchCasesByMedicine() end.");
		
		List<Cases> firstResultList = criteria.list();
		
		//Count the number of match results
		Map<Long, CaseResultCountVo> resultCountMap = new HashMap<Long, CaseResultCountVo>();
		
		CaseResultCountVo countVo = null;
		for(Cases cases: firstResultList){
			countVo = resultCountMap.get(cases.getCaseID());
			if(countVo == null){
				countVo = new CaseResultCountVo();
				countVo.setCaseID(cases.getCaseID());
				countVo.setCases(cases);
				countVo.setResultCount(1);
				
				resultCountMap.put(cases.getCaseID(), countVo);
			}
			else{
				countVo.setResultCount(countVo.getResultCount()+1);
			}
		}
		
		List<CaseResultCountVo> resultCountlist = new ArrayList<CaseResultCountVo>(resultCountMap.values());
		//Collections.sort(resultCountlist);
		
		List<Cases> finalResultList = new ArrayList<Cases>();
		for(CaseResultCountVo vo: resultCountlist){
			if(vo.getResultCount() != null && vo.getResultCount().intValue()>=medicineName.size()){
				finalResultList.add(vo.getCases());
			}
		}
		
		return finalResultList;
	}
	
	@Override
	@Transactional(readOnly=true)
	public Cases getLatestCase(){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Cases.class);
		criteria.setMaxResults(1);
		criteria.setProjection(Projections.max("date"));		
		
		if(criteria.list() != null && criteria.list().size()>0){
			Date maxDate = (Date)criteria.list().get(0);
			
			Criteria criteria2 = session.createCriteria(Cases.class);
			criteria2.setMaxResults(1);
			criteria2.add(Property.forName("date").eq(maxDate));			
			criteria2.addOrder(Order.desc("caseID"));
			
			return (Cases)criteria2.list().get(0);
		}
		else{
			return null;
		}
	}
	
	@Override
	@Transactional(readOnly=true)
	public Cases getLatestEditableCase(String username){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Cases.class);
		criteria.setMaxResults(1);
		criteria.add(Restrictions.or(Restrictions.like("editRight", username+"%"),Restrictions.like("editRight", "%;"+username+"%"),Restrictions.eq("editRight", "ALL")));
		criteria.add(Restrictions.isNotNull("date"));
		criteria.addOrder(Order.desc("date"));
		criteria.addOrder(Order.desc("caseID"));
		
		if(criteria.list() != null && criteria.list().size()>0){
			return (Cases)criteria.list().get(0);
		}
		else{
			return null;
		}
	}
	
	@Override
	@Transactional(readOnly=true)
	public Long getCaseSequenceOfDay(Long aCaseId){
		Cases thisCase = this.getCaseById(aCaseId);
		
		Session session = this.sessionFactory.getCurrentSession();		
		Criteria criteria = session.createCriteria(Cases.class);
		criteria.add(Property.forName("date").eq(thisCase.getDate()));
		criteria.addOrder(Order.asc("caseID"));
		
		Long sequence = 1001l;
		if(criteria.list() != null){
			List<Cases> caseList = (List<Cases>)(criteria.list());	
			for(Cases vo: caseList){
				if(vo.getCaseID().intValue()==thisCase.getCaseID().intValue()){
					break;
				}
				else{
					sequence = sequence + 1;
				}
			}
		}
		
		return sequence;		
	}
	
	
	@Override
	@Transactional(readOnly=true)
	public Cases getCaseById(Long aCaseId){		
		Session session = this.sessionFactory.getCurrentSession();
		Cases cases = (Cases)session.get(Cases.class, aCaseId);
		
		return cases;
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseDao#updateCases(com.clinic.web.entity.Cases)
	 */
	@Override
	@Transactional
	public void updateCases(Cases aCase){		
		Session session = this.sessionFactory.getCurrentSession();
		
		session.update(aCase);		
		session.flush();
	}
	
	@Override
	@Transactional
	public void deleteCasesById(Long aCaseId){
		Cases cases = this.getCaseById(aCaseId);
		
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(cases);	
		
		session.flush();
	}
	
	@Override
	@Transactional
	public void deleteCasesMedicine(Cases aCase){		
		Session session = this.sessionFactory.getCurrentSession();
		
		aCase.getMedicines().clear();
		session.update(aCase);
		
		session.flush();
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseDao#createNewCase(com.clinic.web.entity.Cases)
	 */
	@Override
	@Transactional
	public Long createNewCase(Cases aCase){
		Session session = this.sessionFactory.getCurrentSession();
		
		Long caseId = (Long)session.save(aCase);
		
		session.flush();
		
		return caseId; 
	}	
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseDao#getNextCaseId()
	 */
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public synchronized Long getNextCaseId(){
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "SELECT NEXTVAL('\""+"case_id_seq"+"\"')";
		
		Long nextCustomerId = jdbcTemplate.queryForObject(sql, Long.class);
		
		return nextCustomerId;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
