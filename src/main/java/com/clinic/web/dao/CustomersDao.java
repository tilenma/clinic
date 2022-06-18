package com.clinic.web.dao;

import java.util.List;

import com.clinic.web.entity.Customers;
import com.clinic.web.search.CustomerCriteria;

public interface CustomersDao {

	public abstract List<Customers> searchCustomer(CustomerCriteria aCriteria);
	
	public abstract Long createNewCustomer(Customers aCustomers);
	
	public abstract Long getNextCustomerId();
	
	public abstract Customers getCustomerById(Long aCustomerId);
	
	public abstract void updateCustomer(Customers aCustomer);
	
	public abstract Customers getLatestCustomer();
	
	public abstract List<Customers> keywordSearchCustomer(String aKeyword);
	
	public abstract List<Customers> getCustomerList();
	
	public abstract void deleteCustomerById(Long aCustomerId);

}