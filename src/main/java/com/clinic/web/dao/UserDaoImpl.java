package com.clinic.web.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.entity.Medicine;
import com.clinic.web.entity.Users;

import java.util.List;

import javax.annotation.Resource;

@EnableCaching
public class UserDaoImpl implements UserDao{
	private static Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	
	@Resource
	private SessionFactory sessionFactory;
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.UserDao#getEffectiveUsers()
	 */
	@Override
	@Transactional(readOnly=true)
	public List<Users> getEffectiveUsers(){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Users.class);
		
		//Only select enabled
		Criterion c =  Property.forName("enabled").eq(true);		
		criteria.add(c);
		criteria.addOrder(Order.asc("username"));
		
		return (List<Users>)criteria.list();		
	}	
	
	@Override
	@Transactional(readOnly=true)
	public Users getUserByName(String aUsername){
		Session session = this.sessionFactory.getCurrentSession();		
		
		Users user = (Users)session.get(Users.class, aUsername);

		return user;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}	
