package com.clinic.web.vo.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.clinic.web.constant.AgeGroup;
import com.clinic.web.vo.CaseAgeStat;

public class CaseAgeStatRowMapper implements RowMapper<CaseAgeStat> {
	
	@Override
    public CaseAgeStat mapRow(ResultSet rs, int rowNum) throws SQLException {
		CaseAgeStat stat = new CaseAgeStat();		
		stat.setInterval(rs.getDate("interval"));
		stat.putAgeCount(AgeGroup.FROM_0_TO_5, rs.getInt(AgeGroup.FROM_0_TO_5.getName()));
		stat.putAgeCount(AgeGroup.FROM_11_TO_15, rs.getInt(AgeGroup.FROM_11_TO_15.getName()));
		stat.putAgeCount(AgeGroup.FROM_16_TO_20, rs.getInt(AgeGroup.FROM_16_TO_20.getName()));
		stat.putAgeCount(AgeGroup.FROM_21_TO_25, rs.getInt(AgeGroup.FROM_21_TO_25.getName()));
		stat.putAgeCount(AgeGroup.FROM_26_TO_30, rs.getInt(AgeGroup.FROM_26_TO_30.getName()));
		stat.putAgeCount(AgeGroup.FROM_31_TO_35, rs.getInt(AgeGroup.FROM_31_TO_35.getName()));
		stat.putAgeCount(AgeGroup.FROM_36_TO_40, rs.getInt(AgeGroup.FROM_36_TO_40.getName()));
		stat.putAgeCount(AgeGroup.FROM_41_TO_45, rs.getInt(AgeGroup.FROM_41_TO_45.getName()));
		stat.putAgeCount(AgeGroup.FROM_46_TO_50, rs.getInt(AgeGroup.FROM_46_TO_50.getName()));
		stat.putAgeCount(AgeGroup.FROM_51_TO_55, rs.getInt(AgeGroup.FROM_51_TO_55.getName()));
		stat.putAgeCount(AgeGroup.FROM_56_TO_60, rs.getInt(AgeGroup.FROM_56_TO_60.getName()));
		stat.putAgeCount(AgeGroup.FROM_61_TO_65, rs.getInt(AgeGroup.FROM_61_TO_65.getName()));
		stat.putAgeCount(AgeGroup.ABOVE_66, rs.getInt(AgeGroup.ABOVE_66.getName()));
		
		return stat;
	}
}
