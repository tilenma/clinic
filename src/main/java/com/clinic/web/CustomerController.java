package com.clinic.web;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.clinic.web.constant.ClinicConstant;
import com.clinic.web.dao.CasesViewDao;
import com.clinic.web.dao.CustomersDao;
import com.clinic.web.entity.CasesView;
import com.clinic.web.entity.Customers;
import com.clinic.web.form.CustomerForm;
import com.clinic.web.form.ReportForm;
import com.clinic.web.search.CaseCriteria;
import com.clinic.web.search.CustomerCriteria;
import com.clinic.web.search.KeywordCriteria;
import com.clinic.web.service.SearchResultService;
import com.clinic.web.util.DateUtil;
import com.clinic.web.vo.SearchResultVo;

@SessionAttributes({ "customerCriteria","keywordCriteria","customerResultList" })
@Controller
public class CustomerController {
	private static final Logger logger = LoggerFactory
			.getLogger(CustomerController.class);
	
	@Autowired
	@Qualifier("customerCriteriaValidator")
	private Validator customerCriteriaValidator;
	
	@InitBinder("customerCriteria")
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(customerCriteriaValidator);
	}
	
	@Autowired
	@Qualifier("customerFormValidator")
	private Validator customerFormValidator;
	
	@InitBinder("customerForm")
	private void initBinder2(WebDataBinder binder) {
		binder.setValidator(customerFormValidator);
	}

	// Dao
	private CustomersDao customersDao;
	private CasesViewDao casesViewDao;
	
	// Service
	private SearchResultService searchResultService;
	
	// Static Data
	public static final Integer DEFAULT_PRIVACY = 1;	
		
	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public String searchCustomer(Locale locale, Model model) {

		CustomerCriteria customerCriteria = new CustomerCriteria();

		model.addAttribute("customerCriteria", customerCriteria);

		return "customer/search";
	}

	@RequestMapping(value = "/customer", method = RequestMethod.POST)
	public String searchCustomerPost(Locale locale, Model model,
			@ModelAttribute("customerCriteria") CustomerCriteria customerCriteria,
			BindingResult errors) {
		
		this.customerCriteriaValidator.validate(customerCriteria, errors);

		if (errors.getErrorCount() > 0) {
			return "customer/search";
			
		} else {
			List<Customers> customerList = customersDao
					.searchCustomer(customerCriteria);

			logger.info("searchCustomerPost(): No of customer="
					+ customerList.size() + " ," + customerCriteria.getName());
			
			//Trim the list to 10 only
			if(customerList.size() > ClinicConstant.SEARCH_RESULT_LIMIT){
				customerList = customerList.subList(0, ClinicConstant.SEARCH_RESULT_LIMIT);
			}
			
			model.addAttribute("customerList", customerList);
			model.addAttribute("customerCriteria", customerCriteria);
			model.addAttribute("customerTotal", customerList.size());

			return "customer/list";
		}
	}
	
	@RequestMapping(value = "/customer/keyword", method = RequestMethod.GET)
	public String searchCustomerByKeyword(Locale locale, Model model) {

		KeywordCriteria keywordCriteria = new KeywordCriteria();

		model.addAttribute("keywordCriteria", keywordCriteria);

		return "customer/keywordSearch";
	}
	
	@RequestMapping(value = "/customer/keyword", method = RequestMethod.POST)
	public String searchCustomerPostByKeyword(Locale locale, Model model,
			@ModelAttribute("keywordCriteria")  KeywordCriteria keywordCriteria,
			BindingResult errors) {
		
		if(keywordCriteria.getKeyword() == null || keywordCriteria.getKeyword().trim().length() == 0) {			
			errors.rejectValue("keyword", "keyword.empty");
		}

		if (errors.getErrorCount() > 0) {
			return "customer/keywordSearch";
			
		} else {
			List<Customers> customerList = customersDao.keywordSearchCustomer(keywordCriteria.getKeyword());

			logger.info("searchCustomerPostByKeyword(): No of customer="
					+ customerList.size() + " ," + keywordCriteria.getKeyword());
			model.addAttribute("customerList", customerList);
			model.addAttribute("keywordCriteria", keywordCriteria);
			model.addAttribute("customerTotal", customerList.size());
			
			//Add a dummy
			CustomerCriteria customerCriteria = new CustomerCriteria();
			model.addAttribute("customerCriteria", customerCriteria);

			return "customer/keywordList";
		}
	}

	@RequestMapping(value = "/customer/create", method = RequestMethod.GET)
	public String createCustomer(Locale locale, Model model) {

		CustomerForm aCustomerForm = new CustomerForm();		

		model.addAttribute("customerForm", aCustomerForm);

		return "customer/create";
	}
	
	@RequestMapping(value = "/customer/create", method = RequestMethod.POST)
	public String validateCustomer(Model model,
			@ModelAttribute("customerForm")  CustomerForm customerForm, BindingResult errors) {
		
		this.customerFormValidator.validate(customerForm, errors);
		
		if (errors.getErrorCount() > 0) {
			return "customer/create";
			
		} else {
			// Create New Customer
			Long customerID = this.customersDao.getNextCustomerId();
			Customers customer = this.transform(customerForm, customerID,
					DEFAULT_PRIVACY);

			logger.info("validateCustomer():Create customer ID=" + customerID
					+ " and name=" + customer.getName());
			this.customersDao.createNewCustomer(customer);
		}
		
		return "redirect:/";
		//return "home";
	}
	
	@RequestMapping(value = "/customer/delete", method = RequestMethod.POST)
	public String deleteCustomer(Locale locale, Model model, @ModelAttribute("customerForm")  CustomerForm customerForm, SecurityContextHolder aSecurityContextHolder) {
		try {
		
			Authentication auth = aSecurityContextHolder.getContext().getAuthentication();		
			logger.info("deleteCustomer(): deleting case with id="+customerForm.getCustomerID()+ "by "+ auth.getName());
			
			//Search if any cases exist
			CaseCriteria aCaseCriteria = new CaseCriteria();
			aCaseCriteria.setCustomerID(customerForm.getCustomerID());			
			List<CasesView> caseList = this.casesViewDao.searchCasesView(aCaseCriteria,true);			
			logger.info("deleteCustomer(): No of case="	+ caseList.size());
			
			if(caseList == null || caseList.size()==0) {
				this.customersDao.deleteCustomerById(customerForm.getCustomerID());
			}
			else {
				logger.error("deleteCustomer(): At least one cases existed for customer ID="+customerForm.getCustomerID());
				model.addAttribute("errorMsg", "這客戶還有至少一個病案，不能刪除。");
				return "error";			
			}
			
		}catch(Exception e) {
			logger.error("deleteCustomer(): general exception!",e);
			return "error";
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/customer/latest", method = RequestMethod.GET)
	public String viewLatestCustomer(Locale locale, Model model) {				
		Customers customer = this.customersDao.getLatestCustomer();
		
		if(customer != null) {
			CustomerForm customerForm = this.transform(customer);
			model.addAttribute("customerForm", customerForm);

			return "customer/view";
			//return "redirect:edit?id=" + customer.getCustomerID();
		}
		else { //No latest customer
			return "noresult";
		}
	}
	
	@RequestMapping(value = "/customer/edit", method = RequestMethod.GET)
	public String editCustomer(Locale locale, Model model,
			@RequestParam("id") Long aCustomerId) {

		Customers customer = this.customersDao.getCustomerById(aCustomerId);

		CustomerForm customerForm = this.transform(customer);

		model.addAttribute("customerForm", customerForm);

		return "customer/edit";
	}

	@RequestMapping(value = "/customer/view", method = RequestMethod.GET)
	public String viewCustomer(Locale locale, Model model,
			@RequestParam("id") Long aCustomerId) {

		Customers customer = this.customersDao.getCustomerById(aCustomerId);

		CustomerForm customerForm = this.transform(customer);

		model.addAttribute("customerForm", customerForm);

		return "customer/view";
	}

	@RequestMapping(value = "/customer/edit", method = RequestMethod.POST)
	public String editCustomer(Locale locale, Model model,
			@ModelAttribute("customerForm") CustomerForm customerForm, BindingResult errors ) {
		
		this.customerFormValidator.validate(customerForm, errors);
		
		if(errors.hasErrors()) {
			return "customer/edit";
		}

		Customers customer = this.transform(customerForm,
				customerForm.getCustomerID(), customerForm.getPrivacy());
		this.customersDao.updateCustomer(customer);
		model.addAttribute("customer", customer);

		return "redirect:edit?id=" + customer.getCustomerID() + "&update";
	}

	private CustomerForm transform(Customers aCustomers) {
		CustomerForm customerForm = new CustomerForm();

		customerForm.setName(aCustomers.getName());
		customerForm.setNameEN(aCustomers.getNameEN());
		customerForm.setAddress(aCustomers.getAddress());
		customerForm.setDocumentID(aCustomers.getDocumentID());
		customerForm.setAllergy(aCustomers.getAllergy());
		customerForm.setCreateDate(aCustomers.getCreateDate());
		customerForm.setCustomerID(aCustomers.getCustomerID());
		customerForm.setDateOfBirth(aCustomers.getDateOfBirth());
		customerForm.setEmail(aCustomers.getEmail());
		customerForm.setGender(aCustomers.getGender());
		customerForm.setMaritalStatus(aCustomers.getMaritalStatus());
		customerForm.setMobileNumber(aCustomers.getMobileNumber());
		customerForm.setNote(aCustomers.getNote());
		customerForm.setOccupation(aCustomers.getOccupation());
		customerForm.setRelationship(aCustomers.getRelationship());
		customerForm.setSickHistory(aCustomers.getSickHistory());
		customerForm.setPrivacy(aCustomers.getPrivacy());

		if (aCustomers.getDateOfBirth() != null) {
			customerForm.setDateOfBirthStr(DateUtil.format(aCustomers
					.getDateOfBirth()));
		}
		if (aCustomers.getCreateDate() != null) {
			customerForm.setCreateDateStr(DateUtil.format(aCustomers
					.getCreateDate()));
		}

		return customerForm;
	}

	private Customers transform(CustomerForm customerForm, Long aCustomerID,
			Integer aPrivacy) {
		Customers customer = new Customers();

		customer.setName(customerForm.getName());
		customer.setNameEN(customerForm.getNameEN());
		customer.setAddress(customerForm.getAddress());
		customer.setAllergy(customerForm.getAllergy());

		Date date = null;
		try {
			date = DateUtil.parseDate(customerForm.getCreateDateStr());
		} catch (ParseException e) {
			logger.error("Unable to parse date="
					+ customerForm.getCreateDateStr());
		}
		customer.setCreateDate(date);

		customer.setCustomerID(aCustomerID);

		try {
			date = DateUtil.parseDate(customerForm.getDateOfBirthStr());
		} catch (ParseException e) {
			logger.error("Unable to parse date="
					+ customerForm.getDateOfBirthStr());
		}
		customer.setDateOfBirth(date);

		customer.setDocumentID(customerForm.getDocumentID());		
		customer.setEmail(customerForm.getEmail());
		customer.setGender(customerForm.getGender());
		customer.setMaritalStatus(customerForm.getMaritalStatus());
		customer.setMobileNumber(customerForm.getMobileNumber());
		customer.setNote(customerForm.getNote());
		customer.setOccupation(customerForm.getOccupation());
		customer.setRelationship(customerForm.getRelationship());
		customer.setSickHistory(customerForm.getSickHistory());
		customer.setPrivacy(aPrivacy);

		return customer;
	}
	
	@RequestMapping(value = "/weekOfCustomer", method = RequestMethod.GET)
	public String searchCustomerWeek(Locale locale, Model model) {
		//Search all cases in the week
		CaseCriteria caseCriteria = new CaseCriteria();
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		caseCriteria.setToDate(cal.getTime());
		caseCriteria.setToDateStr(DateUtil.format(caseCriteria.getToDate()));
		
		cal.add(Calendar.WEEK_OF_YEAR, -1);
		cal.add(Calendar.SECOND, 1);
		caseCriteria.setFromDate(cal.getTime());
		caseCriteria.setFromDateStr(DateUtil.format(caseCriteria.getFromDate()));
		
		List<CasesView> caseList = this.casesViewDao.searchCasesView(caseCriteria, true);
		
		if(caseList != null && caseList.size() > 0){
			//Covert caseList to resultList
			List<SearchResultVo> customerList = this.searchResultService.convertCustomerResult(caseList);
			model.addAttribute("customerResultList", customerList);			
			Long customerId = caseList.get(0).getCustomerID();
			
			return "redirect:/customer/listview?id="+customerId;
		}

		return "noresult";
	}
	
	@RequestMapping(value = "/customer/listview", method = RequestMethod.GET)
	public String viewCustomerWeek(Locale locale, Model model, @RequestParam("id") Long aCustomerId, @ModelAttribute("customerResultList") List<SearchResultVo> customerList) {
		if(customerList != null && customerList.size()>0){
			logger.debug("viewCustomerWeek(): get search result list with size="+customerList.size());
			
			SearchResultVo resultVo = null;
			for(int i=0;i<customerList.size();i++){
				resultVo = customerList.get(i);
				
				if(aCustomerId == resultVo.getId()){
					model.addAttribute("currentResult",resultVo);
					break;
				}
			}
		}
		else{
			return "noresult";
		}
		
		Customers customer = this.customersDao.getCustomerById(aCustomerId);
		
		if(customer != null){
			CustomerForm customerForm = this.transform(customer);
			model.addAttribute("customerForm", customerForm);
		
			return "customer/listview";
		}
		else{
			return "noresult";
		}
	}
	
	@Resource
	public void setCustomersDao(CustomersDao customersDao) {
		this.customersDao = customersDao;
	}
	
	@Resource
	public void setCasesViewDao(CasesViewDao casesViewDao) {
		this.casesViewDao = casesViewDao;
	}
	
	@Resource
	public void setSearchResultService(SearchResultService searchResultService) {
		this.searchResultService = searchResultService;
	}
}
