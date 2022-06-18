package com.clinic.web.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate4.SessionFactoryUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.constant.Action;
import com.clinic.web.entity.AuditLog;
import com.clinic.web.vo.GenderStat;

@Component
public class AuditLogDaoImpl implements AuditLogDao {
	private static Logger logger = LoggerFactory.getLogger(AuditLogDaoImpl.class);	
	
	private SessionFactory sessionFactory;	
	
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.CaseAttachmentDao#saveAttachment(com.clinic.web.entity.CaseAttachment)
	 */
	/* (non-Javadoc)
	 * @see com.clinic.web.dao.AuditLogDao#log(com.clinic.web.entity.AuditLog)
	 */
	@Override
	@Transactional
	public Long log(AuditLog aAuditLog) {
		Session session = this.sessionFactory.getCurrentSession();
		Long fileId = (Long)session.save(aAuditLog);
		
		return fileId;
	}
	
	public Boolean confirmCheckPrescription(Integer aCaseId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "select count(*) as cnt from audit_log where action='"+Action.CHECK_PRESCRIPTION.getCode()+"' and case_id="+aCaseId;
		
		int count = jdbcTemplate.queryForObject(sql, null, Integer.class);
		logger.debug("confirmCheckPrescription(): caseId="+aCaseId+" ,count="+count+" ,sql="+sql);
		
		if(count > 0) {
			return Boolean.TRUE;
		}
		else {
			return Boolean.FALSE;
		}		
	}
	
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
