package com.clinic.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.constant.ClinicConstant;
import com.clinic.web.entity.Cases;
import com.clinic.web.entity.CasesView;
import com.clinic.web.search.CaseCriteria;
import com.clinic.web.service.AccessControlServiceImpl;

public class CasesViewDaoImpl implements CasesViewDao{
	private static Logger logger = LoggerFactory.getLogger(CasesViewDaoImpl.class);
	
	private SessionFactory sessionFactory;	
	
	@Override
	@Transactional(readOnly=true)
	public CasesView getCasesViewById(Long aCaseId){
		
		Session session = this.sessionFactory.getCurrentSession();		
		
		CasesView cases = (CasesView)session.get(CasesView.class, aCaseId);
		
		return cases;
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<CasesView> convertToCasesView(List<Cases> aCaseList){
		if(aCaseList == null || aCaseList.size()==0){
			return null;
		}
		
		List<CasesView> outputViewList = new ArrayList<CasesView>();
		CasesView casesView = null;
		for(Cases cases: aCaseList){
			casesView = this.getCasesViewById(cases.getCaseID());
			casesView.setMedicineListString(cases.getMedicineListString());
			outputViewList.add(casesView);
		}
		
		return outputViewList;
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<CasesView> getLatestCaseList(){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(CasesView.class);
		criteria.setMaxResults(ClinicConstant.SEARCH_RESULT_LIMIT);
		criteria.addOrder(Order.desc("caseID"));
		
		List<CasesView> initList = (List<CasesView>)criteria.list();
		
		return initList;
	}
	
	@Override
	@Transactional(readOnly=true)
	public CasesView getLastCasesViewByCustomerId(Long aCurrentCaseId, Long aCustomerId){
		if(aCustomerId != null && aCustomerId > 0){
			CaseCriteria caseCriteria = new CaseCriteria();		
			caseCriteria.setCustomerID(aCustomerId);
			
			List<CasesView> caseList = this.searchCasesView(caseCriteria, true);
			logger.info("getLastCasesViewByCustomerId(): searchCasesView with customerId="+aCustomerId+" .Result size="+caseList.size());
			
			if(aCurrentCaseId != null){
				if(caseList != null && caseList.size()>0){
					CasesView firstCase = caseList.get(0);
					
					//check current case is the first case
					if(firstCase.getCaseID().intValue()==aCurrentCaseId.intValue()){
						if(caseList.size()>1){
							return caseList.get(1); //return next case
						}
					}
					else{
						return firstCase;
					}
				}
			}
			else{ //No current case provided
				if(caseList != null && caseList.size()>0){
					return caseList.get(0);
				}				
			}			
		}
		
		return null;		
	}
	
	@Override
	@Transactional(readOnly=true)
	public CasesView getLastSameProblemCasesView(Long aCurrentCaseId, Long aCustomerId, String aProblem){
		if(aCustomerId != null && aCustomerId > 0 && aProblem != null && !aProblem.trim().isEmpty()){
			CaseCriteria caseCriteria = new CaseCriteria();		
			caseCriteria.setCustomerID(aCustomerId);
			caseCriteria.setProblem(aProblem);
			
			List<CasesView> caseList = this.searchCasesView(caseCriteria, true);
			logger.info("getLastCasesViewByCustomerId(): searchCasesView with customerId="+aCustomerId+" .Result size="+caseList.size());
			
			if(aCurrentCaseId != null){
				if(caseList != null && caseList.size()>0){
					CasesView firstCase = caseList.get(0);
					
					//check current case is the first case
					if(firstCase.getCaseID().intValue()==aCurrentCaseId.intValue()){
						if(caseList.size()>1){
							return caseList.get(1); //return next case
						}
					}
					else{
						return firstCase;
					}
				}
			}
			else{ //No current case provided
				if(caseList != null && caseList.size()>0){
					return caseList.get(0);
				}				
			}			
		}
		
		return null;		
	}
	
	@Override
	@Transactional(readOnly=true)
	public CasesView getLastSameSicknessCasesView(Long aCurrentCaseId, String aSickness){
		if(aSickness != null && !aSickness.trim().isEmpty()){
			CaseCriteria caseCriteria = new CaseCriteria();			
			caseCriteria.setSickness(aSickness);
			
			List<CasesView> caseList = this.searchCasesView(caseCriteria, true);
			logger.info("getLastSameCustomerNSicknessCasesView(): searchCasesView with sickness="+aSickness+" .Result size="+caseList.size());
			
			if(aCurrentCaseId != null){
				if(caseList != null && caseList.size()>0){
					CasesView firstCase = caseList.get(0);
					
					//check current case is the first case
					if(firstCase.getCaseID().intValue()==aCurrentCaseId.intValue()){
						if(caseList.size()>1){
							return caseList.get(1); //return next case
						}
					}
					else{
						return firstCase;
					}
				}
			}
			else{ //No current case provided
				if(caseList != null && caseList.size()>0){
					return caseList.get(0);
				}				
			}			
		}
		
		return null;		
	}
	
	@Override
	@Transactional(readOnly=true)
	public CasesView getLastSameCustomerNSicknessCasesView(Long aCurrentCaseId, Long aCustomerId, String aSickness){
		if(aCustomerId != null && aCustomerId > 0 && aSickness != null && !aSickness.trim().isEmpty()){
			CaseCriteria caseCriteria = new CaseCriteria();		
			caseCriteria.setCustomerID(aCustomerId);
			caseCriteria.setSickness(aSickness);
			
			List<CasesView> caseList = this.searchCasesView(caseCriteria, true);
			logger.info("getLastSameCustomerNSicknessCasesView(): searchCasesView with customerId="+aCustomerId+" .Result size="+caseList.size());
			
			if(aCurrentCaseId != null){
				if(caseList != null && caseList.size()>0){
					CasesView firstCase = caseList.get(0);
					
					//check current case is the first case
					if(firstCase.getCaseID().intValue()==aCurrentCaseId.intValue()){
						if(caseList.size()>1){
							return caseList.get(1); //return next case
						}
					}
					else{
						return firstCase;
					}
				}
			}
			else{ //No current case provided
				if(caseList != null && caseList.size()>0){
					return caseList.get(0);
				}				
			}			
		}
		
		return null;		
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CasesViewDao#searchCasesView(com.clinic.web.search.CaseCriteria)
	 */
	@Override
	@Transactional(readOnly=true)
	public List<CasesView> searchCasesView(CaseCriteria aCriteria, Boolean aDescOrder){
		
		logger.info("searchCasesView() start...");
		
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(CasesView.class);
		
		if(aCriteria.getCaseID() != null && aCriteria.getCaseID() > 0){
			logger.info("Criteria caseID="+aCriteria.getCaseID());
			Criterion c =  Property.forName("caseID").eq(aCriteria.getCaseID());
			criteria.add(c);
		}
		
		if(aCriteria.getCustomerID() != null && aCriteria.getCustomerID() >0){
			logger.info("Criteria customerID = "+aCriteria.getCustomerID());
			Criterion c =  Property.forName("customerID").eq(aCriteria.getCustomerID());
			criteria.add(c);
		}		
		else if(aCriteria.getCustomerName() != null && !aCriteria.getCustomerName().isEmpty()){
			logger.info("Criteria name like "+aCriteria.getCustomerName());
			Criterion c =  Restrictions.like("customer", "%"+aCriteria.getCustomerName()+"%");
			criteria.add(c);
		}
		
		if(aCriteria.getFromDate() != null && aCriteria.getToDate() != null){
			logger.info("Criteria date between "+aCriteria.getFromDate()+" and "+aCriteria.getToDate());
			Criterion c =  Restrictions.between("date", aCriteria.getFromDate(), aCriteria.getToDate());
			criteria.add(c);
		}
		
		if(aCriteria.getProblem() != null && !aCriteria.getProblem().isEmpty()){
			logger.info("Criteria problem like "+aCriteria.getProblem());
			Criterion c =  Restrictions.like("problem", "%"+aCriteria.getProblem()+"%");
			criteria.add(c);
		}
		
		if(aCriteria.getSickness() != null && !aCriteria.getSickness().isEmpty()){
			logger.info("Criteria sickness like "+aCriteria.getSickness());
			Criterion c =  Restrictions.like("sickness", "%"+aCriteria.getSickness()+"%");
			criteria.add(c);
		}
		
		if(aCriteria.getFromPrice() != null && aCriteria.getToPrice() != null 
				&& aCriteria.getFromPrice().compareTo(aCriteria.getToPrice())<=0){
			logger.info("Criteria price between "+aCriteria.getFromPrice()+" and "+aCriteria.getToPrice());
			Criterion c =  Restrictions.between("price", aCriteria.getFromPrice(), aCriteria.getToPrice());
			criteria.add(c);
		}
		
		//Add access control when not admin
		if(!aCriteria.isAdmin()){
			logger.info("searchCasesView(): check search right by criteria for user="+aCriteria.getUserName());
			Criterion all = Restrictions.like("searchRight", "%"+AccessControlServiceImpl.ALL_USER+"%");
			Criterion onlyUser =  Property.forName("searchRight").eq(aCriteria.getUserName());
			Criterion withUser = Restrictions.like("searchRight", "%"+AccessControlServiceImpl.RIGHT_DELIMITOR+aCriteria.getUserName()+"%");
			Criterion c =  Restrictions.or(all,onlyUser,withUser);
			criteria.add(c);
		}
		
		if(aDescOrder){
			criteria.addOrder(Order.desc("date"));
			criteria.addOrder(Order.desc("caseID"));
		}
		else{
			criteria.addOrder(Order.asc("date"));
			criteria.addOrder(Order.asc("caseID"));
		}
		
		logger.info("searchCasesView() end.");
		
		return criteria.list();
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
