package com.clinic.web.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.clinic.web.entity.Users;

public interface UserDao {

	public List<Users> getEffectiveUsers();
	
	public Users getUserByName(String aUsername);

}