package com.clinic.web;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.clinic.web.constant.ClinicConstant;
import com.clinic.web.dao.CaseAttachmentDao;
import com.clinic.web.dao.CaseRemarkDao;
import com.clinic.web.dao.CasesDao;
import com.clinic.web.dao.CasesViewDao;
import com.clinic.web.dao.CustomersDao;
import com.clinic.web.dao.MedicineDao;
import com.clinic.web.dao.PriceDao;
import com.clinic.web.dao.SymptomDao;
import com.clinic.web.search.CaseCriteria;
import com.clinic.web.service.AccessControlService;
import com.clinic.web.service.LunarExtractor;
import com.clinic.web.service.PriceService;
import com.clinic.web.service.SearchResultService;
import com.clinic.web.service.WeatherExtractor;
import com.clinic.web.util.DateUtil;
import com.clinic.web.vo.PriceVo;
import com.clinic.web.vo.SearchResultVo;
import com.clinic.web.vo.WeatherVo;
import com.clinic.web.entity.CaseAttachment;
import com.clinic.web.entity.CaseMedicine;
import com.clinic.web.entity.CaseMedicineKey;
import com.clinic.web.entity.CaseRemark;
import com.clinic.web.entity.CaseRemarkKey;
import com.clinic.web.entity.CaseStatistic;
import com.clinic.web.entity.Cases;
import com.clinic.web.entity.CasesView;
import com.clinic.web.entity.Customers;
import com.clinic.web.entity.PriceSystem;
import com.clinic.web.entity.Symptoms;
import com.clinic.web.form.CaseForm;
import com.clinic.web.form.ReportForm;
import com.clinic.web.form.SelectMedicineForm;
import com.clinic.web.form.SelectSymptomForm;


/**
 * Handles requests for the application home page.
 */
@SessionAttributes({ "customerCriteria","resultList","selectMedicineForm" })
@Controller
public class CaseController {

	private static final Logger logger = LoggerFactory
			.getLogger(CaseController.class);

	// Dao
	private CustomersDao customersDao;
	private SymptomDao symptomDao;
	private CasesDao casesDao;
	private CasesViewDao casesViewDao;
	private MedicineDao medicineDao;
	private PriceDao priceDao;
	private PriceService priceService;
	private CaseRemarkDao caseRemarkDao;
	private CaseAttachmentDao caseAttachmentDao;
	
	// Service
	private AccessControlService accessControlService;
	private SearchResultService searchResultService;

	@Autowired
	@Qualifier("customerFormValidator")
	private Validator customerFormValidator;

	@Autowired
	@Qualifier("customerCriteriaValidator")
	private Validator customerCriteriaValidator;
	
	@Autowired
	@Qualifier("caseCriteriaValidator")
	private Validator caseCriteriaValidator;
	
	@Autowired
	@Qualifier("caseFormValidator")
	private Validator caseFormValidator;
	
	@Autowired
	@Qualifier("selectMedicineFormValidator")
	private Validator selectMedicineFormValidator;	

	@InitBinder("customerForm")
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(customerFormValidator);
	}

	@InitBinder("customerCriteria")
	private void initBinder2(WebDataBinder binder) {
		binder.setValidator(customerCriteriaValidator);
	}
	
	@InitBinder("caseCriteria")
	private void initBinder3(WebDataBinder binder) {
		binder.setValidator(caseCriteriaValidator);
	}
	
	@InitBinder("selectMedicineForm")
	private void initBinder5(WebDataBinder binder) {
		binder.setValidator(selectMedicineFormValidator);
	}
	
	@RequestMapping(value = "/case", method = RequestMethod.GET)
	public String searchCase(Locale locale, Model model) {
		try {
			CaseCriteria caseCriteria = new CaseCriteria();
	
			model.addAttribute("caseCriteria", caseCriteria);
	
			return "case/search";
		}catch(Exception e) {
			logger.error("searchCase(): general exception!",e);
			return "error";
		}
	}
	
	@RequestMapping(value = "/case", method = RequestMethod.POST)
	public String searchCasePost(Locale locale, Model model,CaseCriteria aCaseCriteria,BindingResult errors, SecurityContextHolder aSecurityContextHolder) {		
		try {
			//Validate
			this.caseCriteriaValidator.validate(aCaseCriteria, errors);
			
			if (errors.getErrorCount() > 0) {
				return "case/search";
			}else{
				//Set date
				try{
					aCaseCriteria.setFromDate(DateUtil.parseDate(aCaseCriteria.getFromDateStr()));
					aCaseCriteria.setToDate(DateUtil.parseDate(aCaseCriteria.getToDateStr()));
					
					Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
					String userName = this.accessControlService.getLoginUserName(auth);
					boolean isAdmin = this.accessControlService.isAdmin(auth);
					aCaseCriteria.setUserName(userName);
					aCaseCriteria.setAdmin(isAdmin);
					
				}catch(ParseException e){
					logger.error("searchCasePost: error in parsing input dates!");
				}
				
				List<CasesView> caseList = this.casesViewDao.searchCasesView(aCaseCriteria, true);
				
				logger.info("searchCasePost(): No of case="	+ caseList.size());
				model.addAttribute("caseList", caseList);
				
				model.addAttribute("caseTotal", caseList.size());
				
				model.addAttribute("caseCriteria", aCaseCriteria);
				
				ReportForm reportForm = new ReportForm();			
				model.addAttribute("reportForm", reportForm);
				
				//Filter out result without view right
				List<CasesView> filteredList = this.accessControlService.filterResult(caseList, aSecurityContextHolder);
				
				//Covert caseList to resultList
				List<SearchResultVo> resultList = this.searchResultService.convertResult(filteredList);
				model.addAttribute("resultList", resultList);
				
				return "case/list";
			}		
		}catch(Exception e) {
			logger.error("searchCasePost(): general exception!",e);
			return "error";
		}
	}
	
	@RequestMapping(value = "/weekOfCase", method = RequestMethod.GET)
	public String searchCaseWeek(Locale locale, Model model, SecurityContextHolder aSecurityContextHolder) {
		try {
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
			
			//Set access right in caseCriteria
			this.setCriteriaAccess(caseCriteria,aSecurityContextHolder);
			
			List<CasesView> caseList = this.casesViewDao.searchCasesView(caseCriteria, true);
			
			logger.info("searchCaseWeek(): from "+caseCriteria.getFromDate()+" to "+caseCriteria.getToDate()+". No of case="+ caseList.size());		
			
			model.addAttribute("caseList", caseList);
					
			model.addAttribute("caseTotal", caseList.size());
			
			model.addAttribute("caseCriteria", caseCriteria);
			
			ReportForm reportForm = new ReportForm();			
			model.addAttribute("reportForm", reportForm);
			
			//Covert caseList to resultList
			List<SearchResultVo> resultList = this.searchResultService.convertResult(caseList);
			model.addAttribute("resultList", resultList);
			
			return "case/list";
		}catch(Exception e) {
			logger.error("searchCaseWeek(): general exception!",e);
			return "error";
		}					
	}
	
	@RequestMapping(value = "/case/history", method = RequestMethod.GET)
	public String searchHistory(Locale locale, Model model, @RequestParam("customerID")Long aCustomerID, SecurityContextHolder aSecurityContextHolder) {
		try {
			CaseCriteria aCaseCriteria = new CaseCriteria();
			aCaseCriteria.setCustomerID(aCustomerID);
			
			//Set access right in caseCriteria
			this.setCriteriaAccess(aCaseCriteria,aSecurityContextHolder);
			
			List<CasesView> caseList = this.casesViewDao.searchCasesView(aCaseCriteria,true);
			
			logger.info("searchHistory(): No of case="	+ caseList.size());
			model.addAttribute("caseList", caseList);
			
			model.addAttribute("caseTotal", caseList.size());			
			
			//Set customer name
			Customers customer = this.customersDao.getCustomerById(aCustomerID);
			model.addAttribute("customerName", customer.getName());
			
			//Filter out result without view right
			List<CasesView> filteredList = this.accessControlService.filterResult(caseList, aSecurityContextHolder);
			
			//Covert caseList to resultList
			List<SearchResultVo> resultList = this.searchResultService.convertResult(filteredList);
			model.addAttribute("resultList", resultList);
			
			return "case/history";		
		}catch(Exception e) {
			logger.error("searchHistory(): general exception!",e);
			return "error";
		}							
	}
	
	@RequestMapping(value = "/case/history2", method = RequestMethod.GET)
	public String searchHistory2(Locale locale, Model model, @RequestParam("customer")String aCustomerName, SecurityContextHolder aSecurityContextHolder) {
		try {	
			CaseCriteria aCaseCriteria = new CaseCriteria();
			aCaseCriteria.setCustomerName(aCustomerName);
			
			//Set access right in caseCriteria
			this.setCriteriaAccess(aCaseCriteria,aSecurityContextHolder);
			
			List<CasesView> caseList = this.casesViewDao.searchCasesView(aCaseCriteria,true);
			
			logger.info("searchHistory2(): No of case="	+ caseList.size());
			model.addAttribute("caseList", caseList);
			
			model.addAttribute("caseTotal", caseList.size());			
			
			//Set customer name			
			model.addAttribute("customerName", aCustomerName);
			
			//Filter out result without view right
			List<CasesView> filteredList = this.accessControlService.filterResult(caseList, aSecurityContextHolder);
			
			//Covert caseList to resultList
			List<SearchResultVo> resultList = this.searchResultService.convertResult(filteredList);
			model.addAttribute("resultList", resultList);
			
			return "case/history";
		}catch(Exception e) {
			logger.error("searchHistory2(): general exception!",e);
			return "error";
		}				
	}	
	
	@RequestMapping(value = "/case/history3", method = RequestMethod.GET)
	public String searchHistory3(Locale locale, Model model, @RequestParam("sick")String aSickness, SecurityContextHolder aSecurityContextHolder) {
		try {
			CaseCriteria aCaseCriteria = new CaseCriteria();
			aCaseCriteria.setSickness(aSickness);
			
			//Set access right in caseCriteria
			this.setCriteriaAccess(aCaseCriteria,aSecurityContextHolder);
			
			List<CasesView> caseList = this.casesViewDao.searchCasesView(aCaseCriteria,true);
			
			logger.info("searchHistory3(): No of case="	+ caseList.size());
			model.addAttribute("caseList", caseList);
			
			model.addAttribute("caseTotal", caseList.size());			
			
			//Set customer name			
			model.addAttribute("sickness", aSickness);
			
			return "case/history2";
		}catch(Exception e) {
			logger.error("searchHistory3(): general exception!",e);
			return "error";
		}			
	}

	@RequestMapping(value = "/case/edit", method = RequestMethod.POST)
	public String saveCase(Locale locale, Model model,
			@ModelAttribute("caseForm") CaseForm aCaseForm, BindingResult errors, SecurityContextHolder aSecurityContextHolder) {
		try {			
			logger.info("saveCase: starts...");			
			this.caseFormValidator.validate(aCaseForm, errors);
			
			if(errors.hasErrors()){
				logger.error("saveCase: error from validator!");
				
				this.errorEditCase(model, aCaseForm);
				
				return "case/edit";
			}
			else {
				logger.info("saveCase: caseFormValidator is passed.");				
			}
			// Save case
			Cases cases = this.casesDao.getCaseById(aCaseForm.getCaseID());
			
			//Access control check
			boolean pass = this.accessControlService.checkEditCaseEditPage(cases, aSecurityContextHolder);
			if(!pass){
				return "redirect:/accessDenied";
			}
			//Update cases from case form
			String username = this.accessControlService.getLoginUserName(aSecurityContextHolder);
			this.updateCaseFromForm(cases, aCaseForm, username);
			
			this.casesDao.updateCases(cases);
			
			//Manually handle remark
			for(CaseRemark remark : aCaseForm.getRemarks()){
				if (!remark.getDescription().trim().isEmpty()) {
					//save or update
					this.caseRemarkDao.saveOrUpdateRemark(aCaseForm.getCaseID(), remark.getType(), remark.getDescription());					
				}
				else{
					//delete
					this.caseRemarkDao.delete(aCaseForm.getCaseID(), remark.getType());
				}
			}
			
			//check if need to calculate price
			if("calculate".equalsIgnoreCase(aCaseForm.getAction())){
				logger.info("saveCase(): Update price info for case with id="+aCaseForm.getCaseID());
				
				String priceSystemName = aCaseForm.getPriceSystem();
				BigDecimal dosePrice = aCaseForm.getDosePrice();	
				if(dosePrice == null){
					dosePrice = this.priceService.calculateDosePrice(aCaseForm.getCaseID(), priceSystemName);
					cases.setDosePrice(dosePrice);
				}
				
				PriceVo totalPrice = null;
				if(aCaseForm.getDosage() != null){
					totalPrice = this.priceService.calculateTotalPrice(aCaseForm.getCaseID(), dosePrice, aCaseForm.getDosage(), aCaseForm.getConsultationFee(), priceSystemName);
					cases.setPrice(totalPrice.getPrice());
					
					//Update remark
					this.caseRemarkDao.saveOrUpdateRemark(aCaseForm.getCaseID(), ClinicConstant.PRICE_REMARK_TYPE, totalPrice.getDescription());
				}				
				
				this.casesDao.updateCases(cases);
			}
			logger.info("saveCase(): Updated case with id="+aCaseForm.getCaseID());
			
			return "redirect:/case/edit?id=" + aCaseForm.getCaseID();
		} catch (ParseException e) {
			logger.error("saveCase(): Unable to parse date="+ aCaseForm.getExpiryDateStr());
			return "error";
		} catch(Exception e) {
			logger.error("saveCase(): general exception!",e);
			return "error";
		}
	}

	@RequestMapping(value = "/case/edit", method = RequestMethod.GET)
	public String editCase(HttpServletRequest request,Locale locale, Model model,
			@RequestParam("id") Long aCaseId, SecurityContextHolder aSecurityContextHolder) {
		try {				
			logger.info("editCase(): enter edit page of case with id="+aCaseId);
			Cases cases = this.casesDao.getCaseById(aCaseId);
			
			//Access control check
			boolean pass = this.accessControlService.checkEditCaseEditPage(cases, aSecurityContextHolder);
			if(!pass){
				return "redirect:/accessDenied";
			}
			
			Object sessionObj = request.getSession().getAttribute("resultList");
			List<SearchResultVo> resultList = null;
			if(sessionObj != null) {
				resultList = (List<SearchResultVo>)sessionObj;
				logger.info("editCase(): resultList is found in session. size="+resultList.size());
				
				if(resultList != null && resultList.size()>0){
					logger.debug("editCase(): get search result list with size="+resultList.size());
					
					SearchResultVo resultVo = null;
					for(int i=0;i<resultList.size();i++){
						resultVo = resultList.get(i);
						
						if(aCaseId == resultVo.getId()){
							model.addAttribute("currentResult",resultVo);
							break;
						}
					}
				}
			}
			else {
				logger.info("editCase(): No resultList is found in session. Set to existing one.");
				resultList = this.searchResultService.convertSingleResult(cases);
			}
			model.addAttribute("resultList",resultList);
			
			this.defaultEditCase(model, cases);
			
			return "case/edit";
		}
		catch(Exception e) {
			logger.error("editCase(): general exception!",e);
			return "error";
		}
	}
	
	@RequestMapping(value = "/case/view", method = RequestMethod.GET)
	public String viewCase(HttpServletRequest request,Locale locale, Model model,
			@RequestParam("id") Long aCaseId, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("viewCase(): enter view page of case with id="+aCaseId);
			Cases cases = this.casesDao.getCaseById(aCaseId);
			
			//Access control check
			boolean pass = this.accessControlService.checkViewCaseEditPage(cases, aSecurityContextHolder);
			
			if(!pass){
				return "redirect:/accessDenied";
			}
			
			List<SearchResultVo> resultList = this.searchResultService.convertSingleResult(cases);
	
			this.defaultEditCase(model, cases);
			
			return "case/view";
		}catch(Exception e) {
			logger.error("viewCase(): general exception!",e);
			return "error";
		}
	}	
	
	@RequestMapping(value = "/case/delete", method = RequestMethod.POST)
	public String deleteCase(Locale locale, Model model, @ModelAttribute("reportForm")ReportForm aReportForm) {
		try {		
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
			logger.info("deleteCase(): deleting case with id="+aReportForm.getCaseID()+ "by "+ auth.getName());
			this.casesDao.deleteCasesById(aReportForm.getCaseID());
			
			return "redirect:/";
		}catch(Exception e) {
			logger.error("deleteCase(): general exception!",e);
			return "error";
		}
	}
	
	@RequestMapping(value = "/case/latest", method = RequestMethod.GET)
	public String editLatestCase(HttpServletRequest request, Locale locale, Model model, SecurityContextHolder aSecurityContextHolder) {
		try {
			String username = this.accessControlService.getLoginUserName(aSecurityContextHolder);
			
			Cases cases = this.casesDao.getLatestEditableCase(username);
			
			//Remove session resultList
			request.getSession().removeAttribute("resultList");
			
			if(cases != null) {
				logger.info("editLatestCase(): enter edit page of case with id="+cases.getCaseID());
				return "redirect:/case/edit?id=" + cases.getCaseID();			
			}
			else {
				return "noresult";
			}		
		}catch(Exception e) {
			logger.error("editLatestCase(): general exception!",e);
			return "error";
		}
	}
	
	@RequestMapping(value = "/case/create", method = RequestMethod.GET)
	public String createCase(Locale locale, Model model) {
		try {
			// Create and init caseForm
			CaseForm caseForm = new CaseForm();
			caseForm.setDateStr(DateUtil.format(new Date()));
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, 7);
			caseForm.setExpiryDateStr(DateUtil.format(cal.getTime()));
			caseForm.setDosageMethod(ClinicConstant.DEFAULT_DOSAGE_METHOD);
			caseForm.setDosageRecomment(ClinicConstant.DEFAULT_DOSAGE_RECOMMEND);
			caseForm.setDosage(ClinicConstant.DEFAULT_DOSAGE);
	
			model.addAttribute("caseForm", caseForm);
	
			// Prepare selection list
			this.prepareCaseList(model);		
			
			return "case/create";
		}catch(Exception e) {
			logger.error("createCase(): general exception!",e);
			return "error";
		}
	}
	
	@RequestMapping(value = "/case/create", method = RequestMethod.POST)
	public String createCasePost(Locale locale, Model model,
			@ModelAttribute("caseForm") CaseForm aCaseForm, BindingResult errors, SecurityContextHolder aSecurityContextHolder, HttpServletRequest request) {
		try {
			
			//validate
			this.caseFormValidator.validate(aCaseForm, errors);
			
			if(errors.hasErrors()){
				model.addAttribute("caseForm", aCaseForm);
	
				// Prepare selection list
				this.prepareCaseList(model);
				
				return "/case/create";
			}
			
			Cases newCases = new Cases();
			Long caseID = this.casesDao.getNextCaseId();

			newCases.setCaseID(caseID);
			newCases.setCustomerID(aCaseForm.getCustomerID());
			newCases.setAbdomen(aCaseForm.getAbdomen());
			newCases.setBody(aCaseForm.getBody());
			newCases.setColdHot(aCaseForm.getColdHot());
			newCases.setConsultationFee(aCaseForm.getConsultationFee());
			newCases.setCreateTime(new Date()); // Set current time
			newCases.setCustomerID(aCaseForm.getCustomerID());
			newCases.setDate(DateUtil.parseDate(aCaseForm.getDateStr()));
			newCases.setDiagnosis(aCaseForm.getDiagnosis());
			newCases.setDosage(aCaseForm.getDosage());
			newCases.setDosageMethod(aCaseForm.getDosageMethod());
			newCases.setDosageRecomment(aCaseForm.getDosageRecomment());
			newCases.setDosageRemark(aCaseForm.getDosageRemark());
			newCases.setDosePrice(aCaseForm.getDosePrice());
			newCases.setDrink(aCaseForm.getDrink());
			newCases.setEat(aCaseForm.getEat());
			newCases.setExpiryDate(DateUtil.parseDate(aCaseForm
					.getExpiryDateStr()));
			newCases.setHead(aCaseForm.getHead());
			newCases.setHearing(aCaseForm.getHearing());
			// newCases.setMedicines(medicines);
			newCases.setMenstruation(aCaseForm.getMenstruation());
			newCases.setMouth(aCaseForm.getMouth());
			newCases.setPee(aCaseForm.getPee());
			newCases.setPoo(aCaseForm.getPoo());
			newCases.setPrice(aCaseForm.getPrice());
			newCases.setProblem(aCaseForm.getProblem());
			newCases.setPulse(aCaseForm.getPulse());
			newCases.setRedispense(aCaseForm.getRedispense());
			newCases.setSickness(aCaseForm.getSickness());
			newCases.setSkin(aCaseForm.getSkin());
			newCases.setSleep(aCaseForm.getSleep());
			newCases.setSweat(aCaseForm.getSweat());
			newCases.setTheory(aCaseForm.getTheory());
			newCases.setTongueColor(aCaseForm.getTongueColor());
			newCases.setTongueLayer(aCaseForm.getTongueLayer());
			newCases.setTongueShape(aCaseForm.getTongueShape());
			newCases.setTongueStatus(aCaseForm.getTongueStatus());
			
			newCases.setReceiptRemark(aCaseForm.getReceiptRemark());
			newCases.setFollowupRemark(aCaseForm.getFollowupRemark());
			newCases.setCertRemark(aCaseForm.getCertRemark());
			newCases.setReportRemark(aCaseForm.getReportRemark());
			newCases.setConfirm(ClinicConstant.DEFAULT_CONFIRM);
			
			//Access Right Control
			this.accessControlService.setDefaultCreateCaseRight(newCases, aSecurityContextHolder);
			
			this.casesDao.createNewCase(newCases);
			logger.info("createCasePost(): Saved case with id="+caseID);
			
			//Remove session resultList
			request.getSession().removeAttribute("resultList");
			
			//Set dummy resultList for edit page		
			List<SearchResultVo> resultList = this.searchResultService.convertSingleResult(newCases);
			model.addAttribute("resultList", resultList);
		
			return "redirect:/case/edit?id=" + caseID;
			
		} catch(Exception e) {
			logger.error("createCasePost(): general exception!",e);
			return "error";
		}
	}
	
	@RequestMapping(value = "/case/medicine", method = RequestMethod.GET)
	public String searchCaseByMedicine(Locale locale, Model model) {
		try {
			// Create and init caseForm
			SelectMedicineForm selectMedicineForm = new SelectMedicineForm();
			model.addAttribute("selectMedicineForm", selectMedicineForm);
	
			return "case/medicineSearch";		
		}catch(Exception e) {
			logger.error("searchCaseByMedicine(): general exception!",e);
			return "error";
		}
	}
	
	@RequestMapping(value = "/case/medicine", method = RequestMethod.POST)
	public String searchCaseByMedicinePost(Locale locale, Model model,
			@ModelAttribute("selectMedicineForm") SelectMedicineForm aSelectMedicineForm, BindingResult errors, SecurityContextHolder aSecurityContextHolder) {
		try {
			//validate form
			this.selectMedicineFormValidator.validate(aSelectMedicineForm, errors);
			
			if(errors.hasErrors()){
				return "case/medicineSearch";
			}
			
			if(aSelectMedicineForm != null && aSelectMedicineForm.getMedicineNames() != null){
				List<String> medicineNames = aSelectMedicineForm.getMedicineNames();
				List<String> filteredNames = new ArrayList<String>();
				for(String name: medicineNames){
					logger.info(name);
					if(name != null && name.trim().length()>0){
						filteredNames.add(name);
					}
				}
				if(filteredNames.size()==0){
					return "error";
				}
				
				List<Cases> caseList = casesDao.searchCasesByMedicine(filteredNames, true);
				logger.info("search result size="+caseList.size());
				for(Cases cases: caseList){
					logger.info(cases.getCaseID().toString());
				}
				
				if(caseList.size()>0){
					//Covert caseList to resultList
					List<CasesView> caseList2 = this.casesViewDao.convertToCasesView(caseList);
					List<SearchResultVo> resultList = this.searchResultService.convertResult(caseList2);
					
					model.addAttribute("caseTotal", caseList.size());	
					model.addAttribute("caseList", caseList2);
					model.addAttribute("selectMedicineForm", aSelectMedicineForm);
					model.addAttribute("resultList", resultList);					
				}
				else{
					model.addAttribute("caseTotal", caseList.size());
					model.addAttribute("caseList", new ArrayList<CasesView>());
					model.addAttribute("selectMedicineForm", aSelectMedicineForm);				
				}
				ReportForm reportForm = new ReportForm();			
				model.addAttribute("reportForm", reportForm);
			}
			return "case/medicineSearchList";
		}catch(Exception e) {
			logger.error("searchCaseByMedicinePost(): general exception!",e);
			return "error";
		}
	}
	
	@RequestMapping(value = "/case/selectSymptom", method = RequestMethod.GET)
	public String createCaseSelectSymptom(Locale locale, Model model,@RequestParam("type")String aType, @RequestParam("level")Integer aLevel) {
		try {
			List<Symptoms> symptoms = this.symptomDao.getSymptom(aType, aLevel);
			
			List<Symptoms> nextLevel = null;
			for(Symptoms sym: symptoms){
				nextLevel = this.symptomDao.getSymptom(sym.getDescription(), sym.getLevel()+1);
				
				if(nextLevel != null && nextLevel.size() > 0){
					sym.setNextLevel(true);
				}
				else{
					sym.setNextLevel(false);
				}
			}
			
			model.addAttribute("symptoms", symptoms);
			
			SelectSymptomForm selectSymptomForm = new SelectSymptomForm();
			selectSymptomForm.setCurrentType(aType);
			selectSymptomForm.setCurrentLevel(aLevel);
			
			model.addAttribute("selectSymptomForm", selectSymptomForm);
	
			return "case/selectSymptom";
		}catch(Exception e) {
			logger.error("createCaseSelectSymptom(): general exception!",e);
			return "error";
		}				
	}
	
	@RequestMapping(value = "/case/selectSymptom", method = RequestMethod.POST)
	public String createCaseSelectSymptomNext(Locale locale, Model model,@ModelAttribute("selectSymptomForm")SelectSymptomForm selectSymptomForm) {
		try {
			List<Symptoms> symptoms = this.symptomDao.getSymptom(selectSymptomForm.getNextType(), selectSymptomForm.getNextLevel());
			
			List<Symptoms> nextLevel = null;
			for(Symptoms sym: symptoms){
				nextLevel = this.symptomDao.getSymptom(sym.getDescription(), sym.getLevel()+1);
				
				if(nextLevel != null && nextLevel.size() > 0){
					sym.setNextLevel(true);
				}
				else{
					sym.setNextLevel(false);
				}
			}
			
			model.addAttribute("symptoms", symptoms);
	
			SelectSymptomForm newSymptomForm = new SelectSymptomForm();
			newSymptomForm.setCurrentType(selectSymptomForm.getNextType());
			newSymptomForm.setCurrentLevel(selectSymptomForm.getNextLevel());
			
			Symptoms parent = this.symptomDao.getParentSymptom(selectSymptomForm.getNextType(), selectSymptomForm.getNextLevel());
			if(parent != null){
				newSymptomForm.setPreviousType(parent.getType());
				newSymptomForm.setPreviousLevel(parent.getLevel());
			}	
			
			model.addAttribute("selectSymptomForm", newSymptomForm);
		}catch(Exception e) {
			logger.error("createCaseSelectSymptomNext(): general exception!",e);
			return "error";
		}					

		return "case/selectSymptom";
	}
	
	private void setCriteriaAccess(CaseCriteria aCaseCriteria, SecurityContextHolder aSecurityContextHolder) {
		Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
		String userName = this.accessControlService.getLoginUserName(auth);
		boolean isAdmin = this.accessControlService.isAdmin(auth);
		aCaseCriteria.setUserName(userName);
		aCaseCriteria.setAdmin(isAdmin);
	}
	
	private void updateCaseFromForm(Cases cases, CaseForm aCaseForm, String aUsername) throws ParseException {
		cases.setCustomerID(aCaseForm.getCustomerID());
		cases.setAbdomen(aCaseForm.getAbdomen());
		cases.setBody(aCaseForm.getBody());
		cases.setColdHot(aCaseForm.getColdHot());
		cases.setConsultationFee(aCaseForm.getConsultationFee());
		cases.setCreateTime(new Date()); // Set current time
		cases.setCustomerID(aCaseForm.getCustomerID());
		cases.setDate(DateUtil.parseDate(aCaseForm.getDateStr()));
		cases.setDiagnosis(aCaseForm.getDiagnosis());
		cases.setDosage(aCaseForm.getDosage());
		cases.setDosageMethod(aCaseForm.getDosageMethod());
		cases.setDosageRecomment(aCaseForm.getDosageRecomment());
		cases.setDosageRemark(aCaseForm.getDosageRemark());
		cases.setDosePrice(aCaseForm.getDosePrice());
		cases.setDrink(aCaseForm.getDrink());
		cases.setEat(aCaseForm.getEat());
		cases.setExpiryDate(DateUtil.parseDate(aCaseForm.getExpiryDateStr()));
		cases.setHead(aCaseForm.getHead());
		cases.setHearing(aCaseForm.getHearing());

		// Set medicines
		CaseMedicine newMedicine = null;
		CaseMedicineKey newKey = null;

		cases.getMedicines().clear(); // delete all medicine
		for (CaseMedicine med : aCaseForm.getMedicines()) {
			if (!med.getName().trim().isEmpty()) {
				newKey = new CaseMedicineKey(aCaseForm.getCaseID(), med
						.getCaseMedicineKey().getType(), med
						.getCaseMedicineKey().getName());
				newMedicine = new CaseMedicine(newKey);
				newMedicine.setUnit(med.getUnit());
				newMedicine.setUnit2(med.getUnit2());
				newMedicine.setRemark(med.getRemark());
				newMedicine.setCases(cases);

				cases.getMedicines().add(newMedicine);
			} else {
				// if empty then delete
			}
		}
		
		//Set statistics
		CaseStatistic newStat = null;
		CaseRemarkKey newRemarkKey = null;
		
		cases.getStatistics().clear();
		for(CaseStatistic stat: aCaseForm.getStatistics()) {
			if(!stat.getType().trim().isEmpty()) {
				newRemarkKey = new CaseRemarkKey();
				newRemarkKey.setCaseID(aCaseForm.getCaseID());
				newRemarkKey.setType(stat.getType().trim());
				newStat = new CaseStatistic(newRemarkKey);
				newStat.setEffect(stat.getEffect());
				//newStat.setStartDate(DateUtil.parseDate(stat.getStartDateStr()));
				//newStat.setEndDate(cases.getDate());
				newStat.setReset(stat.getReset());
				
				cases.getStatistics().add(newStat);
			} else {
				// if empty then delete
			}
		}
		
		cases.setMenstruation(aCaseForm.getMenstruation());
		cases.setMouth(aCaseForm.getMouth());
		cases.setPee(aCaseForm.getPee());
		cases.setPoo(aCaseForm.getPoo());
		cases.setPrice(aCaseForm.getPrice());
		cases.setProblem(aCaseForm.getProblem());
		cases.setPulse(aCaseForm.getPulse());
		cases.setRedispense(aCaseForm.getRedispense());
		cases.setSickness(aCaseForm.getSickness());
		cases.setSkin(aCaseForm.getSkin());
		cases.setSleep(aCaseForm.getSleep());
		cases.setSweat(aCaseForm.getSweat());
		cases.setTheory(aCaseForm.getTheory());
		cases.setTongueColor(aCaseForm.getTongueColor());
		cases.setTongueLayer(aCaseForm.getTongueLayer());
		cases.setTongueShape(aCaseForm.getTongueShape());
		cases.setTongueStatus(aCaseForm.getTongueStatus());			
		cases.setReceiptRemark(aCaseForm.getReceiptRemark());
		cases.setFollowupRemark(aCaseForm.getFollowupRemark());
		cases.setCertRemark(aCaseForm.getCertRemark());
		cases.setReportRemark(aCaseForm.getReportRemark());
		cases.setConfirm(aCaseForm.getConfirm());
		if(aCaseForm.getConfirm()) {
			cases.setConfirmUser(aUsername);
		}
	}

	private void prepareCaseList(Model model) {
		List<Symptoms> sweatList = this.symptomDao.getSymptom("汗", 1);
		model.addAttribute("sweatList", sweatList);

		List<Symptoms> coldHotList = this.symptomDao.getSymptom("寒熱", 1);
		model.addAttribute("coldHotList", coldHotList);

		List<Symptoms> headList = new ArrayList<Symptoms>();
		headList.addAll(this.symptomDao.getSymptom("頭痛", 2));
		headList.addAll(this.symptomDao.getSymptom("頭暈", 2));
		headList.addAll(this.symptomDao.getSymptom("耳目", 1));
		model.addAttribute("headList", headList);

		List<Symptoms> mouthList = new ArrayList<Symptoms>();
		mouthList.addAll(this.symptomDao.getSymptom("口味", 2));
		mouthList.addAll(this.symptomDao.getSymptom("嘔吐", 2));
		mouthList.addAll(this.symptomDao.getSymptom("語音", 2));
		mouthList.addAll(this.symptomDao.getSymptom("咳嗽", 2));
		model.addAttribute("mouthList", mouthList);

		List<Symptoms> bodyList = this.symptomDao.getSymptom("身", 1);
		model.addAttribute("bodyList", bodyList);

		List<Symptoms> pooList = this.symptomDao.getSymptom("大便", 1);
		model.addAttribute("pooList", pooList);

		List<Symptoms> peeList = this.symptomDao.getSymptom("小便", 1);
		model.addAttribute("peeList", peeList);

		List<Symptoms> drinkList = this.symptomDao.getSymptom("渴", 1);
		model.addAttribute("drinkList", drinkList);

		List<Symptoms> eatList = this.symptomDao.getSymptom("飲食", 1);
		model.addAttribute("eatList", eatList);

		List<Symptoms> abdomenList = new ArrayList<Symptoms>();
		abdomenList.addAll(this.symptomDao.getSymptom("胸脇", 2));
		abdomenList.addAll(this.symptomDao.getSymptom("胃脘", 2));
		abdomenList.addAll(this.symptomDao.getSymptom("腹部", 2));
		abdomenList.addAll(this.symptomDao.getSymptom("腰部", 2));
		model.addAttribute("abdomenList", abdomenList);

		List<Symptoms> hearingList = this.symptomDao.getSymptom("耳目", 1);
		model.addAttribute("hearingList", hearingList);

		List<Symptoms> sleepList = this.symptomDao.getSymptom("睡眠", 1);
		model.addAttribute("sleepList", sleepList);

		List<Symptoms> tongueColorList = this.symptomDao.getSymptom("舌色", 2);
		model.addAttribute("tongueColorList", tongueColorList);

		List<Symptoms> tongueShapeList = this.symptomDao.getSymptom("舌形", 2);
		model.addAttribute("tongueShapeList", tongueShapeList);

		List<Symptoms> tongueStatusList = this.symptomDao.getSymptom("舌態", 2);
		model.addAttribute("tongueStatusList", tongueStatusList);

		List<Symptoms> tongueLayerList = this.symptomDao.getSymptom("舌苔", 2);
		model.addAttribute("tongueLayerList", tongueLayerList);
		
		List<String> unitList = this.priceDao.getUnitList();		
		model.addAttribute("unitList", unitList);
		
		List<Customers> customers = this.customersDao.getCustomerList();
		model.addAttribute("customers", customers);
		
		List<PriceSystem> systemList = this.priceDao.getEffectivePriceSystem();
		model.addAttribute("systemList", systemList);
		
		Set<String> specialTypeMap = this.priceDao.getEffectiveOtherType(); 
		
		List<String> medicineTypeList = this.medicineDao.getTypeList();
		medicineTypeList.addAll(specialTypeMap);
		
		model.addAttribute("medicineTypeList", medicineTypeList);
	}
	
	private void defaultEditCase(Model model, Cases cases){
		CaseForm caseForm = new CaseForm();
		caseForm.setCaseID(cases.getCaseID());

		// Set customer
		if (cases.getCustomerID() != null) {
			Customers customer = this.customersDao.getCustomerById(cases
					.getCustomerID());
			caseForm.setCustomerName(customer.getName());
		}

		caseForm.setAbdomen(cases.getAbdomen());
		caseForm.setBody(cases.getBody());
		caseForm.setColdHot(cases.getColdHot());
		caseForm.setConsultationFee(cases.getConsultationFee());
		caseForm.setCreateTime(cases.getCreateTime());
		caseForm.setCustomerID(cases.getCustomerID());
		caseForm.setDateStr(DateUtil.format(cases.getDate()));
		caseForm.setDiagnosis(cases.getDiagnosis());
		caseForm.setDosage(cases.getDosage());
		caseForm.setDosageMethod(cases.getDosageMethod());
		caseForm.setDosageRecomment(cases.getDosageRecomment());
		caseForm.setDosageRemark(cases.getDosageRemark());
		caseForm.setDosePrice(cases.getDosePrice());
		caseForm.setDrink(cases.getDrink());
		caseForm.setEat(cases.getEat());
		caseForm.setExpiryDateStr(DateUtil.format(cases.getExpiryDate()));
		caseForm.setHead(cases.getHead());
		caseForm.setHearing(cases.getHearing());

		//Set medicines
		if (cases.getMedicinesList().size() == 0) {
			// Add a dummy medicine
			CaseMedicineKey key = new CaseMedicineKey(cases.getCaseID(), ClinicConstant.MEDIC_TYPE,
					" ");
			CaseMedicine firstMed = new CaseMedicine(key);
			firstMed.setUnit(new BigDecimal(0));
			firstMed.setUnit2(ClinicConstant.DEFAULT_UNIT2);
			firstMed.setCases(cases);
			cases.getMedicinesList().add(firstMed);
		}	
		caseForm.setMedicines(cases.getMedicinesList());
		
		if(cases.getStatistics() == null) {
			List<CaseStatistic> statistics = new ArrayList<CaseStatistic>();
			cases.setStatistics(statistics);
		}		
		
		// Set statistics
		int statisticsCount = cases.getStatistics().size();
		for(int i=1; i<= ClinicConstant.STATISTIC_COUNT;i++) {			
			if(i <= statisticsCount) {
				//Set startDateStr
				//for(CaseStatistic stat:cases.getStatistics()) {
					//stat.setStartDateStr(DateUtil.format(stat.getStartDate()));
				//}
			}
			else {
				//Add dummy
				CaseRemarkKey key = new CaseRemarkKey(cases.getCaseID(), "");
				CaseStatistic stat = new CaseStatistic(key);
				stat.setCases(cases);
				stat.setEffect(0);
				//stat.setStartDateStr(DateUtil.format(new Date()));
				stat.setReset(Boolean.TRUE);
				cases.getStatistics().add(stat);
			}
		}
		caseForm.setStatistics(cases.getStatistics());
		
		List<CaseRemark> caseRemarks = this.caseRemarkDao.getRemarksById(cases.getCaseID());
		boolean cal = false;
		boolean other = false;
		for(CaseRemark remark: caseRemarks){
			if(ClinicConstant.PRICE_REMARK_TYPE.equalsIgnoreCase(remark.getType())){
				cal = true;
			}
			else if(ClinicConstant.OTHER_REMARK_TYPE.equalsIgnoreCase(remark.getType())){
				other = true;
			}
		}
		if(!cal){
			CaseRemarkKey key = new CaseRemarkKey(cases.getCaseID(), ClinicConstant.PRICE_REMARK_TYPE);
			CaseRemark caseRemark = new CaseRemark(key, "");	
			caseRemarks.add(caseRemark);
		}
		if(!other){
			CaseRemarkKey key = new CaseRemarkKey(cases.getCaseID(), ClinicConstant.OTHER_REMARK_TYPE);
			CaseRemark caseRemark = new CaseRemark(key, "");	
			caseRemarks.add(caseRemark);
		}
		
		caseForm.setRemarks(caseRemarks);
		caseForm.setMenstruation(cases.getMenstruation());
		caseForm.setMouth(cases.getMouth());
		caseForm.setPee(cases.getPee());
		caseForm.setPoo(cases.getPoo());
		caseForm.setPrice(cases.getPrice());
		caseForm.setProblem(cases.getProblem());
		caseForm.setPulse(cases.getPulse());
		caseForm.setRedispense(cases.getRedispense());
		caseForm.setSickness(cases.getSickness());
		caseForm.setSkin(cases.getSkin());
		caseForm.setSleep(cases.getSleep());
		caseForm.setSweat(cases.getSweat());
		caseForm.setTheory(cases.getTheory());
		caseForm.setTongueColor(cases.getTongueColor());
		caseForm.setTongueLayer(cases.getTongueLayer());
		caseForm.setTongueShape(cases.getTongueShape());
		caseForm.setTongueStatus(cases.getTongueStatus());
		
		caseForm.setReceiptRemark(cases.getReceiptRemark());
		caseForm.setFollowupRemark(cases.getFollowupRemark());
		caseForm.setCertRemark(cases.getCertRemark());
		caseForm.setReportRemark(cases.getReportRemark());
		caseForm.setConfirm(cases.getConfirm());
		caseForm.setConfirmUser(cases.getConfirmUser());

		model.addAttribute("caseForm", caseForm);
		model.addAttribute("caseID", cases.getCaseID());
		
		//For delete case
		ReportForm reportForm = new ReportForm();
		reportForm.setCaseID(cases.getCaseID());
		model.addAttribute("reportForm", reportForm);
		
		// Prepare attachment
		List<CaseAttachment> attachmentList = this.caseAttachmentDao.getAttachmentList(cases.getCaseID().intValue());
		if(attachmentList != null && attachmentList.size()>0) {
			model.addAttribute("hasAttachment", Boolean.TRUE);
		}
		else {
			model.addAttribute("hasAttachment", Boolean.FALSE);
		}

		// Prepare selection list
		this.prepareCaseList(model);
	}
	
	private void errorEditCase(Model model, CaseForm caseForm){
		model.addAttribute("caseForm", caseForm);
		model.addAttribute("caseID", caseForm.getCaseID());		
		
		//For delete case
		ReportForm reportForm = new ReportForm();
		reportForm.setCaseID(caseForm.getCaseID());
		model.addAttribute("reportForm", reportForm);
		
		// Prepare attachment
		List<CaseAttachment> attachmentList = this.caseAttachmentDao.getAttachmentList(caseForm.getCaseID().intValue());
		if(attachmentList != null && attachmentList.size()>0) {
			model.addAttribute("hasAttachment", Boolean.TRUE);
		}
		else {
			model.addAttribute("hasAttachment", Boolean.FALSE);
		}

		// Prepare selection list
		this.prepareCaseList(model);
	}

	@Resource
	public void setCustomersDao(CustomersDao customersDao) {
		this.customersDao = customersDao;
	}

	@Resource
	public void setSymptomDao(SymptomDao symptomDao) {
		this.symptomDao = symptomDao;
	}

	@Resource
	public void setCasesDao(CasesDao casesDao) {
		this.casesDao = casesDao;
	}

	@Resource
	public void setCasesViewDao(CasesViewDao casesViewDao) {
		this.casesViewDao = casesViewDao;
	}

	@Resource
	public void setMedicineDao(MedicineDao medicineDao) {
		this.medicineDao = medicineDao;
	}

	@Resource
	public void setPriceDao(PriceDao priceDao) {
		this.priceDao = priceDao;
	}
	
	@Resource
	public void setPriceService(PriceService priceService) {
		this.priceService = priceService;
	}

	@Resource
	public void setCaseRemarkDao(CaseRemarkDao caseRemarkDao) {
		this.caseRemarkDao = caseRemarkDao;
	}

	@Resource
	public void setAccessControlService(AccessControlService accessControlService) {
		this.accessControlService = accessControlService;
	}

	@Resource
	public void setSearchResultService(SearchResultService searchResultService) {
		this.searchResultService = searchResultService;
	}
	
	@Resource
	public void setCaseAttachmentDao(CaseAttachmentDao caseAttachmentDao) {
		this.caseAttachmentDao = caseAttachmentDao;
	}	
	
}
