package com.clinic.web.dao;

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
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate4.SessionFactoryUtils;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.entity.Customers;
import com.clinic.web.search.CustomerCriteria;

public class CustomersDaoImpl implements CustomersDao {
	private static Logger logger = LoggerFactory.getLogger(CustomersDaoImpl.class);
	
	private SessionFactory sessionFactory;	
	
	@Transactional
	public void deleteCustomerById(Long aCustomerId){
		Session session = this.sessionFactory.getCurrentSession();
		Customers customers = (Customers)session.get(Customers.class, aCustomerId);
		session.delete(customers);	
		
		session.flush();
	}
	
	@Transactional
	public void updateCustomer(Customers aCustomer){		
		Session session = this.sessionFactory.getCurrentSession();		
		session.update(aCustomer);
	}
	

	@Transactional(readOnly=true)
	public Customers getCustomerById(Long aCustomerId){
		
		Session session = this.sessionFactory.getCurrentSession();		
		
		Customers customers = (Customers)session.get(Customers.class, aCustomerId);
		
		return customers;
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public synchronized Long getNextCustomerId(){
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "SELECT NEXTVAL('\""+"customer_id_seq"+"\"')";
		
		Long nextCustomerId = jdbcTemplate.queryForObject(sql, Long.class);
		
		return nextCustomerId;
	}
	
	@Transactional
	public Long createNewCustomer(Customers aCustomers){
		Session session = this.sessionFactory.getCurrentSession();
		
		Long customerId = (Long)session.save(aCustomers);
		
		session.flush();
		
		return customerId; 
	}
	
	@Transactional(readOnly=true)
	public Customers getLatestCustomer(){
		Session session = this.sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Customers.class);		
		criteria.addOrder(Order.desc("createDate"));
		
		List<Customers> customerList = criteria.list();
		
		if(customerList != null && customerList.size() > 0) {
			return (Customers)(criteria.list().get(0));
		}
		
		return null;
		
		/*
		criteria.setProjection(Projections.max("createDate"));
		
		if(criteria.list() != null  && criteria.list().size()>0){
			Date maxDate = (Date)criteria.list().get(0);
			
			Criteria criteria2 = session.createCriteria(Customers.class);			
			criteria2.add(Property.forName("createDate").eq(maxDate));			
			criteria2.addOrder(Order.desc("customerID"));
			
			return (Customers)criteria2.list().get(0);			
		}
		
		return null;
		*/
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<Customers> getCustomerList(){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Customers.class);
		criteria.addOrder(Order.asc("name"));
		
		return criteria.list();
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<Customers> searchCustomer(CustomerCriteria aCriteria){
		Session session = this.sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Customers.class);
		
		if(aCriteria.getName() != null && !aCriteria.getName().isEmpty()){
			Criterion c =  Restrictions.like("name", "%"+aCriteria.getName()+"%");
			criteria.add(c);
		}
		
		if(aCriteria.getDocumentID() != null && !aCriteria.getDocumentID().isEmpty()){
			Criterion c =  Restrictions.like("documentID", aCriteria.getDocumentID()+"%");
			criteria.add(c);
		}
		
		if(aCriteria.getEmail() != null && !aCriteria.getEmail().isEmpty()){
			Criterion c =  Restrictions.like("email", "%"+aCriteria.getEmail()+"%");
			criteria.add(c);
		}
		
		if(aCriteria.getGender() != null && !aCriteria.getGender().isEmpty() && aCriteria.getGender().compareToIgnoreCase("-1") !=0){
			Criterion c =  Property.forName("gender").eq(aCriteria.getGender());
			criteria.add(c);
		}
		
		if(aCriteria.getMobileNumber() != null && !aCriteria.getMobileNumber().isEmpty()){
			Criterion c =  Restrictions.like("mobileNumber", aCriteria.getMobileNumber()+"%");
			criteria.add(c);
		}
		
		return criteria.list();
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<Customers> keywordSearchCustomer(String aKeyword){
		Session session = this.sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Customers.class);
		
		Criterion name = Restrictions.like("name", "%"+aKeyword+"%");
		Criterion nameEN = Restrictions.like("nameEN", "%"+aKeyword+"%");		
		Criterion occupation = Restrictions.like("occupation", "%"+aKeyword+"%");
		Criterion sickHistory = Restrictions.like("sickHistory", "%"+aKeyword+"%");
		Criterion relationship = Restrictions.like("relationship", "%"+aKeyword+"%");
		Criterion note = Restrictions.like("note", "%"+aKeyword+"%");
		Criterion allergy = Restrictions.like("allergy", "%"+aKeyword+"%");
		Criterion address = Restrictions.like("address", "%"+aKeyword+"%");
		
		Criterion c =  Restrictions.or(name,nameEN,occupation,sickHistory,relationship,note,allergy,address);
		criteria.add(c);
		
		return criteria.list();
	}
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
