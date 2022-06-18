package com.clinic.web.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
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

import com.clinic.web.entity.Medicine;
import com.clinic.web.search.MedicineCriteria;

public class MedicineDaoImpl implements MedicineDao {
	private static Logger logger = LoggerFactory.getLogger(MedicineDaoImpl.class);
	
	private SessionFactory sessionFactory;	
	
	@Override
	@Transactional
	public void deleteMedicineById(Integer aMedicineId){
		Medicine medicine = this.getMedicineById(aMedicineId);
		
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(medicine);	
		
		session.flush();
	}
	
	@Override
	@Transactional(readOnly=true)
	public Medicine getMedicineById(Integer aMedicineId){
		Session session = this.sessionFactory.getCurrentSession();		
		
		Medicine medicine = (Medicine)session.get(Medicine.class, aMedicineId);

		return medicine;
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public synchronized Integer getNextMedicineId(){
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "SELECT NEXTVAL('\""+"medicine_id_seq"+"\"')";
		
		Integer nextMedicId = jdbcTemplate.queryForObject(sql, Integer.class);
		
		return nextMedicId;
	}
	
	@Transactional
	public Integer createNewMedicine(Medicine aMedicine){
		Session session = this.sessionFactory.getCurrentSession();
		
		Integer medicineId = (Integer)session.save(aMedicine);
		
		session.flush();
		
		return medicineId; 
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<Medicine> searchMedicine(MedicineCriteria aCriteria){
		Session session = this.sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Medicine.class);
		
		if(aCriteria.getName2() != null && !aCriteria.getName2().isEmpty()){
			Criterion c =  Restrictions.like("name", "%"+aCriteria.getName2()+"%");
			criteria.add(c);
		}
		
		if(aCriteria.getCode2() != null && !aCriteria.getCode2().isEmpty()){
			Criterion c =  Property.forName("code").eq(aCriteria.getCode2());
			criteria.add(c);
		}
		
		if(aCriteria.getType2() != null && !aCriteria.getType2().isEmpty() && aCriteria.getType2().compareToIgnoreCase("-1")!=0){
			Criterion c =  Property.forName("type").eq(aCriteria.getType2());
			criteria.add(c);
		}
		
		if(aCriteria.getPriceCategory2() != null && !aCriteria.getPriceCategory2().isEmpty()){
			Criterion c =  Property.forName("priceCategory").eq(aCriteria.getPriceCategory2());
			criteria.add(c);
		}
		
		criteria.addOrder(Order.asc("order"));
		
		return criteria.list();
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<Medicine> searchMedicineByType(String aType){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Medicine.class);
		
		if(aType != null && !aType.isEmpty()){
			Criterion c =  Property.forName("type").eq(aType);
			criteria.add(c);
			
			return criteria.list();			
		}
		
		return null;
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<Medicine> searchMedicineByName(String aName){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Medicine.class);
		
		if(aName != null && !aName.isEmpty()){
			Criterion c =  Restrictions.like("name", "%"+aName+"%");
			criteria.add(c);
			
			return criteria.list();			
		}
		
		return null;
	}
	
	@Override
	@Transactional(readOnly=true)
	public Medicine searchMedicineByExactName(String aName){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Medicine.class);
		
		if(aName != null && !aName.isEmpty()){
			Criterion c =  Property.forName("name").eq(aName);
			criteria.add(c);
			
			List<Medicine> list = criteria.list();
			
			if(list != null && list.size() > 0){
				return list.get(0);
			}			 	
		}		
		return null;
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.MedicineDao#getMedicineByCode(java.lang.String)
	 */
	@Override
	@Transactional(readOnly=true)
	public Medicine getMedicineByCode(String aCode){
		Session session = this.sessionFactory.getCurrentSession();		
		
		Criteria criteria = session.createCriteria(Medicine.class);
		
		if(aCode!=null && aCode.trim().length() >0 ){
			Criterion c =  Property.forName("code").eq(aCode);
			criteria.add(c);
			
			List<Medicine> list = criteria.list();
			
			if(list != null && list.size() > 0){
				return list.get(0);
			}	
		}	
		
		return null;
	}
	
	@Override
	@Transactional
	public void updateMedicine(Medicine aMedicine){
		Session session = this.sessionFactory.getCurrentSession();
		
		if(aMedicine!=null){
			session.update(aMedicine);
		}
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<String> getTypeList(){
		Session session = this.sessionFactory.getCurrentSession();		
		
		Criteria criteria = session.createCriteria(Medicine.class);
		criteria.setProjection( Projections.distinct( Projections.property( "type" ) ) );
		
		List<String> typeList = criteria.list();
		
		return typeList;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
