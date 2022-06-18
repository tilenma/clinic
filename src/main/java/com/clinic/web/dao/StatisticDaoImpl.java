package com.clinic.web.dao;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate4.SessionFactoryUtils;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.util.DateUtil;
import com.clinic.web.vo.CaseAgeStat;
import com.clinic.web.vo.CaseEffectVo;
import com.clinic.web.vo.CaseGenderStat;
import com.clinic.web.vo.CaseStat;

import com.clinic.web.vo.GenderStat;
import com.clinic.web.vo.MedicStat;
import com.clinic.web.vo.PriceStat;
import com.clinic.web.vo.rowmapper.CaseAgeStatRowMapper;

public class StatisticDaoImpl implements StatisticDao {
	private static Logger logger = LoggerFactory.getLogger(StatisticDaoImpl.class);
	
	private SessionFactory sessionFactory;
	
	public List<MedicStat> getTopMedicByRange(String type, Date aStartDate, Date aEndDate){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "select \"CaseMedicine\".name, count(*) as count" 
				+" from \"CaseMedicine\", \"Medicine\", \"Cases\""
				+" where \"CaseMedicine\".name = \"Medicine\".name and \"Medicine\".type = '"+type+"'"
				+" and \"CaseMedicine\".\"caseID\" = \"Cases\".\"caseID\" and \"Cases\".date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
				+" and \"Cases\".date <= to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
				+" group by \"CaseMedicine\".name"
				+" order by count desc"
				+" limit 10";
		
		logger.info("getTopMedicByRange():sql="+sql);
		List<MedicStat> stats = (List<MedicStat>)jdbcTemplate.query(sql, new BeanPropertyRowMapper(MedicStat.class));
		
		return stats;
	}
	
	public List<MedicStat> getTopMedic(int months, String type){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "select \"CaseMedicine\".name, count(*) as count" 
				+" from \"CaseMedicine\", \"Medicine\", \"Cases\""
				+" where \"CaseMedicine\".name = \"Medicine\".name and \"Medicine\".type = '"+type+"'"
				+" and \"CaseMedicine\".\"caseID\" = \"Cases\".\"caseID\" and \"Cases\".date >  CURRENT_DATE - INTERVAL '"+months
				+" months'"
				+" group by \"CaseMedicine\".name"
				+" order by count desc"
				+" limit 10";
		
		logger.info("getTopMedic():sql="+sql);
		List<MedicStat> stats = (List<MedicStat>)jdbcTemplate.query(sql, new BeanPropertyRowMapper(MedicStat.class));
		
		return stats;
	}
	
	public List<CaseEffectVo> getEffectByType(Long aCustomerID, String aType){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "select a.\"caseID\",a.\"type\",a.\"effect\",a.\"reset\",b.\"customerID\",b.\"date\""
				+ " from \"CaseStatistic\" a,\"Cases\" b where a.\"caseID\" = b.\"caseID\""
				+ " and b.\"customerID\"="+aCustomerID+" and a.\"type\"='"+aType+"' order by b.\"date\"";
		
		logger.info("getEffectByType():sql="+sql);
		List<CaseEffectVo> stats = (List<CaseEffectVo>)jdbcTemplate.query(sql, new BeanPropertyRowMapper(CaseEffectVo.class));
		
		return stats;	
	}
	
	public List<CaseEffectVo> getGroupEffect(Long aCustomerID, String aType, Date aDate){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "select a.\"caseID\",a.\"type\",a.\"effect\",a.\"reset\",b.\"customerID\",b.\"date\""
				+ " from \"CaseStatistic\" a,\"Cases\" b where a.\"caseID\" = b.\"caseID\""
				+ " and b.\"customerID\"="+aCustomerID+" and a.\"type\"='"+aType+"'"
				+ " and b.\"date\" < to_date('"+ DateUtil.formatDBDate(aDate)+"','yyyy-MM-dd')"
				+" order by b.\"date\" desc";
		
		logger.info("getGroupEffect():sql="+sql);
		List<CaseEffectVo> stats = (List<CaseEffectVo>)jdbcTemplate.query(sql, new BeanPropertyRowMapper(CaseEffectVo.class));
		
		return stats;	
	}
	
	public List<PriceStat> getPriceStatByRange(Date aStartDate, Date aEndDate, int aInterval){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "";		
		String sql_month = "select interval, sum(b.price) as price from	("
				+" select a.price, date_trunc('month', date) as interval"
				+" from \"Cases\" a where "						
				+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
				+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"						
				+" ) b group by interval order by interval";
		
		String sql_week = "select interval, sum(b.price) as price from	("
						+" select a.price, date_trunc('week', date) - interval '1 day' as interval"
						+" from \"Cases\" a where "						
						+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
						+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"						
						+" ) b group by interval order by interval";
		
		String sql_day = "select interval, sum(b.price) as price from	("
				+" select a.price, date_trunc('day', date) as interval"
				+" from \"Cases\" a where "						
				+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
				+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"						
				+" ) b group by interval order by interval";
		
		if(Calendar.MONTH == aInterval) {
			sql = sql_month;
		}
		else if(Calendar.DAY_OF_YEAR == aInterval || Calendar.DAY_OF_MONTH == aInterval || Calendar.DAY_OF_WEEK == aInterval) {
			sql = sql_day;
		}
		else {
			sql = sql_week;
		}
		
		logger.info("getPriceStatByRange():sql="+sql);
		List<PriceStat> stats = (List<PriceStat>)jdbcTemplate.query(sql, new BeanPropertyRowMapper(PriceStat.class));
		
		return stats;		
	}
	
	public List<CaseStat> getCaseStatByRange(Date aStartDate, Date aEndDate, int aInterval){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "";	
		
		String sql_month = "select interval, count(*) as count from	("
				+" select  date_trunc('month', date) as interval"
				+" from \"Cases\" a where "						
				+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
				+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"						
				+" ) b group by interval order by interval";	
		
		String sql_week = "select interval, count(*) as count from	("
						+" select  date_trunc('week', date) - interval '1 day' as interval"
						+" from \"Cases\" a where "						
						+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
						+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"						
						+" ) b group by interval order by interval";	
		
		String sql_day = "select interval, count(*) as count from	("
				+" select  date_trunc('day', date) as interval"
				+" from \"Cases\" a where "						
				+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
				+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"						
				+" ) b group by interval order by interval";	
		
		if(Calendar.MONTH == aInterval) {
			sql = sql_month;
		}
		else if(Calendar.DAY_OF_YEAR == aInterval || Calendar.DAY_OF_MONTH == aInterval || Calendar.DAY_OF_WEEK == aInterval) {
			sql = sql_day;
		}
		else {
			sql = sql_week;
		}
		
		logger.info("getCaseStatByRange():sql="+sql);
		List<CaseStat> stats = (List<CaseStat>)jdbcTemplate.query(sql, new BeanPropertyRowMapper(CaseStat.class));
		
		return stats;		
	}
	
	public List<CaseStat> getCaseStatByWeek(int months){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "select interval, count(*) as count from	("
						+" select  date_trunc('week', date) - interval '1 day' as interval"
						+" from \"Cases\" a where date >  CURRENT_DATE - INTERVAL '"+months
						+ " months'"
						+" ) b group by interval order by interval";	
		
		logger.info("getCaseStatByWeek():sql="+sql);
		List<CaseStat> stats = (List<CaseStat>)jdbcTemplate.query(sql, new BeanPropertyRowMapper(CaseStat.class));
		
		return stats;		
	}
	
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public GenderStat getGenderStat(){
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql = "select count(*) as male," 
				+" (select count(*) from \"Customers\" where gender='女') as female,"
				+" (select count(*) from \"Customers\" where gender not in ('男','女')) as other"
				+" from \"Customers\" where gender='男';";
		
		logger.info("getGenderStat():sql="+sql);
		GenderStat genderStat = (GenderStat)jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper(GenderStat.class));
		
		return genderStat;
	}
	
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public List<CaseGenderStat> getCaseGenderStatByRange(Date aStartDate, Date aEndDate, int aInterval){
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql="";
		
		String sql_day = "select case when c.interval is not null then c.interval" 
				+" when d.interval is not null then d.interval"
				+" else d.interval end as interval,"
				+" case when c.male is null then 0 else c.male end as male,"
				+" case when d.female is null then 0 else d.female end as female,"
				+" case when e.other is null then 0 else e.other end as other from"
				+" (select interval, count(*) as male from	("
				+" select  date_trunc('day', date) as interval"
					+" from \"Cases\" a, \"Customers\" b where"
					+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
					+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
					+" and a.\"customerID\" = b.\"customerID\""
					+" and b.gender='男'"
				+" ) b group by interval) c"
				+" full outer join"
				+" (select interval, count(*) as female from	("
					+" select  date_trunc('day', date) as interval"
					+" from \"Cases\" a, \"Customers\" b where"
					+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
					+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
					+" and a.\"customerID\" = b.\"customerID\""
					+" and b.gender='女'"
				+" ) b group by interval) d on c.interval=d.interval"
				+" full outer join"
				+" (select interval, count(*) as other from	("
					+" select  date_trunc('day', date) as interval"
					+" from \"Cases\" a, \"Customers\" b where"
					+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
					+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
					+" and a.\"customerID\" = b.\"customerID\""
					+" and (b.gender is null or b.gender not in('女','男'))"
				+" ) b group by interval) e on c.interval=e.interval"
				+" order by c.interval;";
		
		String sql_week = "select case when c.interval is not null then c.interval" 
				+" when d.interval is not null then d.interval"
				+" else d.interval end as interval,"
				+" case when c.male is null then 0 else c.male end as male,"
				+" case when d.female is null then 0 else d.female end as female,"
				+" case when e.other is null then 0 else e.other end as other from"
				+" (select interval, count(*) as male from	("
				+" select  date_trunc('week', date) - interval '1 day' as interval"
					+" from \"Cases\" a, \"Customers\" b where"
					+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
					+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
					+" and a.\"customerID\" = b.\"customerID\""
					+" and b.gender='男'"
				+" ) b group by interval) c"
				+" full outer join"
				+" (select interval, count(*) as female from	("
					+" select  date_trunc('week', date) - interval '1 day' as interval"
					+" from \"Cases\" a, \"Customers\" b where"
					+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
					+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
					+" and a.\"customerID\" = b.\"customerID\""
					+" and b.gender='女'"
				+" ) b group by interval) d on c.interval=d.interval"
				+" full outer join"
				+" (select interval, count(*) as other from	("
					+" select  date_trunc('week', date) - interval '1 day' as interval"
					+" from \"Cases\" a, \"Customers\" b where"
					+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
					+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
					+" and a.\"customerID\" = b.\"customerID\""
					+" and (b.gender is null or b.gender not in('女','男'))"
				+" ) b group by interval) e on c.interval=e.interval"
				+" order by c.interval;";

		String sql_month = "select case when c.interval is not null then c.interval" 
				+" when d.interval is not null then d.interval"
				+" else d.interval end as interval,"
				+" case when c.male is null then 0 else c.male end as male,"
				+" case when d.female is null then 0 else d.female end as female,"
				+" case when e.other is null then 0 else e.other end as other from"
				+" (select interval, count(*) as male from	("
				+" select  date_trunc('month', date) as interval"
					+" from \"Cases\" a, \"Customers\" b where"
					+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
					+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
					+" and a.\"customerID\" = b.\"customerID\""
					+" and b.gender='男'"
				+" ) b group by interval) c"
				+" full outer join"
				+" (select interval, count(*) as female from	("
					+" select  date_trunc('month', date) as interval"
					+" from \"Cases\" a, \"Customers\" b where"
					+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
					+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
					+" and a.\"customerID\" = b.\"customerID\""
					+" and b.gender='女'"
				+" ) b group by interval) d on c.interval=d.interval"
				+" full outer join"
				+" (select interval, count(*) as other from	("
					+" select  date_trunc('month', date) as interval"
					+" from \"Cases\" a, \"Customers\" b where"
					+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
					+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
					+" and a.\"customerID\" = b.\"customerID\""
					+" and (b.gender is null or b.gender not in('女','男'))"
				+" ) b group by interval) e on c.interval=e.interval"
				+" order by c.interval;";
		
		if(Calendar.MONTH == aInterval) {
			sql = sql_month;
		}
		else if(Calendar.DAY_OF_YEAR == aInterval || Calendar.DAY_OF_MONTH == aInterval || Calendar.DAY_OF_WEEK == aInterval) {
			sql = sql_day;
		}
		else {
			sql = sql_week;
		}
		
		logger.info("getCaseGenderStatByRange():sql="+sql);
		List<CaseGenderStat> stats = (List<CaseGenderStat>)jdbcTemplate.query(sql, new BeanPropertyRowMapper(CaseGenderStat.class));
		
		return stats;
	}
	
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public List<CaseAgeStat> getCaseAgeStatByRange(Date aStartDate, Date aEndDate, int aInterval){
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(this.sessionFactory));
		
		String sql="";
		
		String sql_day = "select d.interval, sum(\"0-5\") as \"0-5\", sum(\"6-10\") as \"6-10\" ,"
				   +" sum(\"0-5\") as \"0-5\", sum(\"6-10\") as \"6-10\" ,"
				   +" sum(\"11-15\") as \"11-15\", sum(\"16-20\") as \"16-20\" ,"
				   +" sum(\"21-25\") as \"21-25\", sum(\"26-30\") as \"26-30\" ,"
				   +" sum(\"31-35\") as \"31-35\", sum(\"36-40\") as \"36-40\" ,"
				   +" sum(\"41-45\") as \"41-45\", sum(\"46-50\") as \"46-50\" ,"
						+" sum(\"51-55\") as \"51-55\", sum(\"56-60\") as \"56-60\" ,"
						+" sum(\"61-65\") as \"61-65\", sum(\"66+\") as \"66+\" from ("
						+" select c.interval, case when age<=5 then 1 else 0 end as \"0-5\","
						+" case when age>=6 and age<=10 then 1 else 0 end as \"6-10\","
						+" case when age>=11 and age<=15 then 1 else 0 end as \"11-15\","
						+" case when age>=16 and age<=20 then 1 else 0 end as \"16-20\","
						+" case when age>=21 and age<=25 then 1 else 0 end as \"21-25\","
						+" case when age>=26 and age<=30 then 1 else 0 end as \"26-30\","
						+" case when age>=31 and age<=35 then 1 else 0 end as \"31-35\","
						+" case when age>=36 and age<=40 then 1 else 0 end as \"36-40\","
						+" case when age>=41 and age<=45 then 1 else 0 end as \"41-45\","
						+" case when age>=46 and age<=50 then 1 else 0 end as \"46-50\","
						+" case when age>=51 and age<=55 then 1 else 0 end as \"51-55\","
						+" case when age>=56 and age<=60 then 1 else 0 end as \"56-60\","
						+" case when age>=61 and age<=65 then 1 else 0 end as \"61-65\","
						+" case when age>=66 then 1 else 0 end as \"66+\" from ("
						+" select  date_trunc('day', date) as interval," 
							+" EXTRACT(year FROM age(a.\"date\",b.\"dateOfBirth\")) :: int as age"
							+" from \"Cases\" a, \"Customers\" b where"
							+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
							+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
							+" and a.\"customerID\" = b.\"customerID\") c"
							+" ) d group by d.interval order by d.interval;";		
		
		String sql_week = "select d.interval, sum(\"0-5\") as \"0-5\", sum(\"6-10\") as \"6-10\" ,"
				   +" sum(\"0-5\") as \"0-5\", sum(\"6-10\") as \"6-10\" ,"
				   +" sum(\"11-15\") as \"11-15\", sum(\"16-20\") as \"16-20\" ,"
				   +" sum(\"21-25\") as \"21-25\", sum(\"26-30\") as \"26-30\" ,"
				   +" sum(\"31-35\") as \"31-35\", sum(\"36-40\") as \"36-40\" ,"
				   +" sum(\"41-45\") as \"41-45\", sum(\"46-50\") as \"46-50\" ,"
						+" sum(\"51-55\") as \"51-55\", sum(\"56-60\") as \"56-60\" ,"
						+" sum(\"61-65\") as \"61-65\", sum(\"66+\") as \"66+\" from ("
						+" select c.interval, case when age<=5 then 1 else 0 end as \"0-5\","
						+" case when age>=6 and age<=10 then 1 else 0 end as \"6-10\","
						+" case when age>=11 and age<=15 then 1 else 0 end as \"11-15\","
						+" case when age>=16 and age<=20 then 1 else 0 end as \"16-20\","
						+" case when age>=21 and age<=25 then 1 else 0 end as \"21-25\","
						+" case when age>=26 and age<=30 then 1 else 0 end as \"26-30\","
						+" case when age>=31 and age<=35 then 1 else 0 end as \"31-35\","
						+" case when age>=36 and age<=40 then 1 else 0 end as \"36-40\","
						+" case when age>=41 and age<=45 then 1 else 0 end as \"41-45\","
						+" case when age>=46 and age<=50 then 1 else 0 end as \"46-50\","
						+" case when age>=51 and age<=55 then 1 else 0 end as \"51-55\","
						+" case when age>=56 and age<=60 then 1 else 0 end as \"56-60\","
						+" case when age>=61 and age<=65 then 1 else 0 end as \"61-65\","
						+" case when age>=66 then 1 else 0 end as \"66+\" from ("
						+" select  date_trunc('week', date) - interval '1 day' as interval," 
							+" EXTRACT(year FROM age(a.\"date\",b.\"dateOfBirth\")) :: int as age"
							+" from \"Cases\" a, \"Customers\" b where"
							+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
							+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
							+" and a.\"customerID\" = b.\"customerID\") c"
							+" ) d group by d.interval order by d.interval;";

		String sql_month = "select d.interval, sum(\"0-5\") as \"0-5\", sum(\"6-10\") as \"6-10\" ,"
				   +" sum(\"0-5\") as \"0-5\", sum(\"6-10\") as \"6-10\" ,"
				   +" sum(\"11-15\") as \"11-15\", sum(\"16-20\") as \"16-20\" ,"
				   +" sum(\"21-25\") as \"21-25\", sum(\"26-30\") as \"26-30\" ,"
				   +" sum(\"31-35\") as \"31-35\", sum(\"36-40\") as \"36-40\" ,"
				   +" sum(\"41-45\") as \"41-45\", sum(\"46-50\") as \"46-50\" ,"
						+" sum(\"51-55\") as \"51-55\", sum(\"56-60\") as \"56-60\" ,"
						+" sum(\"61-65\") as \"61-65\", sum(\"66+\") as \"66+\" from ("
						+" select c.interval, case when age<=5 then 1 else 0 end as \"0-5\","
						+" case when age>=6 and age<=10 then 1 else 0 end as \"6-10\","
						+" case when age>=11 and age<=15 then 1 else 0 end as \"11-15\","
						+" case when age>=16 and age<=20 then 1 else 0 end as \"16-20\","
						+" case when age>=21 and age<=25 then 1 else 0 end as \"21-25\","
						+" case when age>=26 and age<=30 then 1 else 0 end as \"26-30\","
						+" case when age>=31 and age<=35 then 1 else 0 end as \"31-35\","
						+" case when age>=36 and age<=40 then 1 else 0 end as \"36-40\","
						+" case when age>=41 and age<=45 then 1 else 0 end as \"41-45\","
						+" case when age>=46 and age<=50 then 1 else 0 end as \"46-50\","
						+" case when age>=51 and age<=55 then 1 else 0 end as \"51-55\","
						+" case when age>=56 and age<=60 then 1 else 0 end as \"56-60\","
						+" case when age>=61 and age<=65 then 1 else 0 end as \"61-65\","
						+" case when age>=66 then 1 else 0 end as \"66+\" from ("
						+" select  date_trunc('month', date) as interval," 
							+" EXTRACT(year FROM age(a.\"date\",b.\"dateOfBirth\")) :: int as age"
							+" from \"Cases\" a, \"Customers\" b where"
							+" a.date >=to_date('"+DateUtil.format(aStartDate)+"','dd/MM/yyyy')"
							+" and a.date <=to_date('"+DateUtil.format(aEndDate)+"','dd/MM/yyyy')"
							+" and a.\"customerID\" = b.\"customerID\") c"
							+" ) d group by d.interval order by d.interval;";
		
		if(Calendar.MONTH == aInterval) {
			sql = sql_month;
		}
		else if(Calendar.DAY_OF_YEAR == aInterval || Calendar.DAY_OF_MONTH == aInterval || Calendar.DAY_OF_WEEK == aInterval) {
			sql = sql_day;
		}
		else {
			sql = sql_week;
		}
		
		logger.info("getCaseGenderStatByRange():sql="+sql);
		List<CaseAgeStat> stats = (List<CaseAgeStat>)jdbcTemplate.query(sql, new CaseAgeStatRowMapper());
		
		return stats;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
