package com.clinic.web;

import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clinic.web.constant.ClinicConstant;
import com.clinic.web.dao.AuditLogDao;
import com.clinic.web.dao.CaseAttachmentDao;
import com.clinic.web.dao.CasesDao;
import com.clinic.web.dao.CasesViewDao;
import com.clinic.web.dao.CustomersDao;
import com.clinic.web.dao.MedicineDao;
import com.clinic.web.dao.UserDao;
import com.clinic.web.entity.Cases;
import com.clinic.web.entity.CasesView;
import com.clinic.web.form.ReportForm;
import com.clinic.web.search.CaseCriteria;
import com.clinic.web.service.AccessControlService;
import com.clinic.web.service.ReportService;
import com.clinic.web.util.DateUtil;
import com.clinic.web.util.SecurityUtil;
import com.clinic.web.vo.ReportVo;

@Controller
public class ReportController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	//Dao
	@Resource
	private CaseAttachmentDao caseAttachmentDao;
	
	@Resource
	private CasesDao casesDao;
	
	@Resource
	private CustomersDao customersDao;
	
	@Resource
	private MedicineDao medicineDao;
	
	@Resource
	private CasesViewDao casesViewDao;
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private AuditLogDao auditLogDao;
	
	@Resource
	private String defaultDownloadLocation;
	
	// Service
	@Resource
	private AccessControlService accessControlService;
	
	@Resource
	private ReportService reportService;
	
	@Autowired
	@Qualifier("reportCaseCriteriaValidator")
	private Validator reportCaseCriteriaValidator;
	
	@InitBinder("caseCriteria")
	private void initBinder3(WebDataBinder binder) {
		binder.setValidator(reportCaseCriteriaValidator);
	}
	
	@RequestMapping(value = "/report/search", method = RequestMethod.GET)
	public String searchReportInput(Locale locale, Model model) {
		CaseCriteria caseCriteria = new CaseCriteria();

		model.addAttribute("caseCriteria", caseCriteria);
		
		return "report/search";
	}
	
	@RequestMapping(value = "/report/search", method = RequestMethod.POST)
	public String searchReport(Locale locale, Model model, @Valid @ModelAttribute("caseCriteria")CaseCriteria aCaseCriteria
			, BindingResult bindingResult, SecurityContextHolder aSecurityContextHolder) {
		try {
			if (bindingResult.getErrorCount() > 0) {
				return "report/search";
	
			}else{
				try{
					aCaseCriteria.setFromDate(DateUtil.parseDate(aCaseCriteria.getFromDateStr()));
					aCaseCriteria.setToDate(DateUtil.parseDate(aCaseCriteria.getToDateStr()));
				
					Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
					aCaseCriteria.setAdmin(true);
				}catch(ParseException e){
					logger.error("searchReport: error in parsing input dates!");
				}
				
				List<CasesView> caseList = this.casesViewDao.searchCasesView(aCaseCriteria, true);
				
				//Trim the list to 10 only
				if(caseList.size() > ClinicConstant.SEARCH_RESULT_LIMIT){
					caseList = caseList.subList(0, ClinicConstant.SEARCH_RESULT_LIMIT);
				}
				
				logger.info("searchReport(): from "+aCaseCriteria.getFromDate()+" to "+aCaseCriteria.getToDate()+". No of case="+ caseList.size());
				
				model.addAttribute("caseList", caseList);
				model.addAttribute("caseTotal", caseList.size());
				
				ReportForm reportForm = new ReportForm();			
				model.addAttribute("reportForm", reportForm);
			}
		}catch(Exception e) {
			logger.error("searchReport(): general exception!",e);
			return "error";
		}
		
		return "report/list";
	}
	
	@RequestMapping(value = "/report/weekOfReport", method = RequestMethod.GET)
	public String reportOfWeek(Locale locale, Model model) {
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
			
			//By Pass any access control
			caseCriteria.setAdmin(true);
			
			List<CasesView> caseList = this.casesViewDao.searchCasesView(caseCriteria, true);		
			logger.info("reportOfWeek(): from "+caseCriteria.getFromDate()+" to "+caseCriteria.getToDate()+". No of case="+ caseList.size());
			
			model.addAttribute("caseList", caseList);		
			model.addAttribute("caseTotal", caseList.size());
			
			ReportForm reportForm = new ReportForm();
			reportForm.setIssueDateStr(DateUtil.format(new Date()));
			model.addAttribute("reportForm", reportForm);
		}catch(Exception e) {
			logger.error("reportOfWeek(): general exception!",e);
			return "error";
		}			
		return "report/list";
	}
	
	@RequestMapping(value = "/report/checklist", method = RequestMethod.GET)
	public String checkReportList(Locale locale, Model model, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("checkReportList(): get latest 10 cases");
			
			//Get latest 10 cases
			List<CasesView> caseList = this.casesViewDao.getLatestCaseList();
			
			List<CasesView> outputList = new ArrayList<CasesView>();
			Boolean checked = false;
			for(CasesView cv: caseList) {
				//checked = this.auditLogDao.confirmCheckPrescription(cv.getCaseID().intValue());
				checked = cv.getConfirm();				
				
				if(!checked) {
					outputList.add(cv);				
				}
				else {
					logger.info("checkReportList(): case id="+cv.getCaseID()+" is skipped due to checking completed befere.");
				}
			}
			
			if(outputList == null || outputList.size()==0) {
				return "allconfirm";
			}
			
			model.addAttribute("caseList", outputList);
			model.addAttribute("caseTotal", outputList.size());
				
			ReportForm reportForm = new ReportForm();			
			model.addAttribute("reportForm", reportForm);
		}catch(Exception e) {
			logger.error("checkReportList(): general exception!",e);
			return "error";
		}		
		
		return "report/checklist";
	}
	
	@RequestMapping(value = "/report/checkLatest", method = RequestMethod.GET)
	public String checkMedicineLatest(Locale locale, Model model, SecurityContextHolder aSecurityContextHolder) {
		try {
			//Get latest 10 cases
			List<CasesView> caseList = this.casesViewDao.getLatestCaseList();
			
			for(CasesView cv: caseList) {				
				if(!cv.getConfirm()) {
					//Access control check
					Cases thisCase = this.casesDao.getCaseById(cv.getCaseID());
					boolean pass = this.accessControlService.checkViewReportPage(thisCase, aSecurityContextHolder);
					if(pass){						
						logger.info("report/checkMedicineLatest(): id="+thisCase.getCaseID());
						this.defaultReport(thisCase, model, false, true, SecurityUtil.getUsername(aSecurityContextHolder), null);
						return "report/checkMedicine";
					}
				}
			}
		}catch(Exception e) {
			logger.error("checkMedicineLatest(): general exception!",e);
			return "error";
		}				
		
		return "allconfirm";
	}
	
	@RequestMapping(value = "/report/check", method = RequestMethod.POST)
	public String checkMedicineLatestPOST(Locale locale, Model model, @ModelAttribute("reportForm")ReportForm aReportForm, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("report/checkMedicineLatestPOST(): id="+aReportForm.getCaseID());
			
			Cases cases = this.casesDao.getCaseById(aReportForm.getCaseID());
			
			//Access control check
			boolean pass = this.accessControlService.checkViewReportPage(cases, aSecurityContextHolder);
			if(!pass){
				return "redirect:/accessDenied";
			}
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}
			this.defaultReport(cases, model, false, true, SecurityUtil.getUsername(aSecurityContextHolder),issueDate);
		}catch(Exception e) {
			logger.error("checkMedicineLatestPOST(): general exception!",e);
			return "error";
		}				
		return "report/checkMedicine";
	}
	
	@RequestMapping(value = "/report/check", method = RequestMethod.GET)
	public String checkMedicine(Locale locale, Model model, @RequestParam("id") Long aCaseId, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("report/checkMedicine(): id="+aCaseId);
			
			Cases cases = this.casesDao.getCaseById(aCaseId);		
			
			//Access control check
			boolean pass = this.accessControlService.checkViewReportPage(cases, aSecurityContextHolder);
			if(!pass){
				return "redirect:/accessDenied";
			}
			
			this.defaultReport(cases, model, false, true, SecurityUtil.getUsername(aSecurityContextHolder),null);
		}catch(Exception e) {
			logger.error("checkMedicine(): general exception!",e);
			return "error";
		}	
		return "report/checkMedicine";
	}
	
	@RequestMapping(value = "/report/view", method = RequestMethod.GET)
	public String reportView2(Locale locale, Model model, @RequestParam("id") Long aCaseId, SecurityContextHolder aSecurityContextHolder) {
		
		logger.info("report/view(): id="+aCaseId);
		
		Cases cases = this.casesDao.getCaseById(aCaseId);
		
		//Access control check
		boolean pass = this.accessControlService.checkViewReportPage(cases, aSecurityContextHolder);
		if(!pass){
			return "redirect:/accessDenied";
		}
		
		this.defaultReport(cases, model, false, true, SecurityUtil.getUsername(aSecurityContextHolder),null);
		
		return "report/view";
	}
		
	@RequestMapping(value = "/report/view", method = RequestMethod.POST)
	public String reportView(Locale locale, Model model, @ModelAttribute("reportForm")ReportForm aReportForm, SecurityContextHolder aSecurityContextHolder) {
		
		logger.info("report/view(): id="+aReportForm.getCaseID());
		
		Cases latest = this.casesDao.getCaseById(aReportForm.getCaseID());
		
		this.defaultReport(latest, model, false, true, SecurityUtil.getUsername(aSecurityContextHolder), null);
		
		return "report/view";
	}
	
	@RequestMapping(value = "/report/report", method = RequestMethod.GET)
	public String reportLatest(Locale locale, Model model, HttpServletRequest request, SecurityContextHolder aSecurityContextHolder) {
		try {
			Cases latest = this.casesDao.getLatestCase();
			
			logger.info("reportLatest(): id="+latest.getCaseID());
			
			//Access control check
			boolean pass = this.accessControlService.checkViewReportPage(latest, aSecurityContextHolder);
			if(!pass){
				return "redirect:/accessDenied";
			}
			
			String lang = ClinicConstant.LANG_TC; //Set default to TC	
			
			if(ClinicConstant.LANG_EN.compareToIgnoreCase(lang)==0) {			
				model.addAttribute("otherLangName", "中文");
				model.addAttribute("reportTitle", "Prescription");
				model.addAttribute("otherLang", ClinicConstant.LANG_TC);
			}
			else {			
				model.addAttribute("otherLangName", "English");
				model.addAttribute("reportTitle", "處方箋");
				model.addAttribute("otherLang", ClinicConstant.LANG_EN);
			}
			
			String previewUrl = request.getRequestURL().toString()+"/preview/"+lang+"?id="+latest.getCaseID();
			String downloadUrl = request.getRequestURL().toString()+"/download/"+lang;
			String saveUrl = "/report/save/"+lang;
			
			ReportForm reportForm = new ReportForm();
			reportForm.setCaseID(latest.getCaseID());
			reportForm.setLang(lang);
			reportForm.setPath(defaultDownloadLocation);
			model.addAttribute("reportForm", reportForm);
		
			model.addAttribute("previewUrl", previewUrl);
			model.addAttribute("downloadUrl", downloadUrl);
			model.addAttribute("saveUrl", saveUrl);	
			
		}catch(Exception e) {
			logger.error("reportLatest(): general exception!",e);
			return "error";
		}	
		return "report/previewTCOnly";
	}
	
	@RequestMapping(value = "/report/report", method = RequestMethod.POST)
	public String report(Locale locale, Model model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletRequest request) {
		try {
			logger.info("report(): id="+aReportForm.getCaseID());
			
			String lang = aReportForm.getLang();		
			if(lang == null || lang.isEmpty()) {
				lang = ClinicConstant.LANG_TC;
			}
			
			if(ClinicConstant.LANG_EN.compareToIgnoreCase(lang)==0) {			
				model.addAttribute("otherLangName", "中文");
				model.addAttribute("reportTitle", "Prescription");
				model.addAttribute("otherLang", ClinicConstant.LANG_TC);
			}
			else {			
				model.addAttribute("otherLangName", "English");
				model.addAttribute("reportTitle", "處方箋");
				model.addAttribute("otherLang", ClinicConstant.LANG_EN);
			}
			
			String previewUrl = request.getRequestURL().toString()+"/preview/"+lang+"?id="+aReportForm.getCaseID();
			String downloadUrl = request.getRequestURL().toString()+"/download/"+lang;
			String saveUrl = "/report/save/"+lang;
			
			aReportForm.setPath(defaultDownloadLocation);
			model.addAttribute("reportForm", aReportForm);	
			
			model.addAttribute("previewUrl", previewUrl);
			model.addAttribute("downloadUrl", downloadUrl);
			model.addAttribute("saveUrl", saveUrl);	
			
		}catch(Exception e) {
			logger.error("report(): general exception!",e);
			return "error";
		}	
		return "report/previewTCOnly";
	}
	
	@RequestMapping(value = "/report/prescription", method = RequestMethod.GET)
	public String prescriptionLatest(Locale locale, Model model, HttpServletRequest request, SecurityContextHolder aSecurityContextHolder) {
		try {
			Cases latest = this.casesDao.getLatestCase();
			
			logger.info("prescriptionLatest(): id="+latest.getCaseID());
			
			//Access control check
			boolean pass = this.accessControlService.checkViewReportPage(latest, aSecurityContextHolder);
			if(!pass){
				return "redirect:/accessDenied";
			}
			
			String lang = ClinicConstant.LANG_TC; //Set default to TC	
			
			if(ClinicConstant.LANG_EN.compareToIgnoreCase(lang)==0) {			
				model.addAttribute("otherLangName", "中文");
				model.addAttribute("reportTitle", "Prescription");
				model.addAttribute("otherLang", ClinicConstant.LANG_TC);
			}
			else {			
				model.addAttribute("otherLangName", "English");
				model.addAttribute("reportTitle", "處方箋");
				model.addAttribute("otherLang", ClinicConstant.LANG_EN);
			}
			
			String previewUrl = request.getRequestURL().toString()+"/preview/"+lang+"?id="+latest.getCaseID();
			String downloadUrl = request.getRequestURL().toString()+"/download/"+lang;
			String saveUrl = "/prescription/save/"+lang;
			
			ReportForm reportForm = new ReportForm();
			reportForm.setCaseID(latest.getCaseID());
			reportForm.setLang(lang);
			model.addAttribute("reportForm", reportForm);		
			model.addAttribute("previewUrl", previewUrl);
			model.addAttribute("downloadUrl", downloadUrl);		
			model.addAttribute("saveUrl", saveUrl);	
		}catch(Exception e) {
			logger.error("prescriptionLatest(): general exception!",e);
			return "error";
		}	
		return "report/preview";
	}
	
	@RequestMapping(value = "/report/prescriptionInput", method = RequestMethod.POST)
	public String prescriptionInput(Locale locale, Model model, @ModelAttribute("reportForm")ReportForm aReportForm, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("receipt(): id="+aReportForm.getCaseID());
			
			Cases latest = this.casesDao.getCaseById(aReportForm.getCaseID());
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}
			this.defaultReport(latest, model, false, true, SecurityUtil.getUsername(aSecurityContextHolder), issueDate);
			
		}catch(Exception e) {
			logger.error("prescriptionInput(): general exception!",e);
			return "error";
		}	
		
		return "report/prescription";
	}
	
	@RequestMapping(value = "/report/prescription", method = RequestMethod.POST)
	public String prescription(Locale locale, Model model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletRequest request) {
		try {
			logger.info("prescription(): id="+aReportForm.getCaseID());
			
			String lang = aReportForm.getLang();		
			if(lang == null || lang.isEmpty()) {
				lang = ClinicConstant.LANG_TC;
			}
			
			if(ClinicConstant.LANG_EN.compareToIgnoreCase(lang)==0) {			
				model.addAttribute("otherLangName", "中文");
				model.addAttribute("reportTitle", "Prescription");
				model.addAttribute("otherLang", ClinicConstant.LANG_TC);
			}
			else {			
				model.addAttribute("otherLangName", "English");
				model.addAttribute("reportTitle", "處方箋");
				model.addAttribute("otherLang", ClinicConstant.LANG_EN);
			}
						
			String previewUrl = request.getRequestURL().toString()+"/preview/"+lang+"?id="+aReportForm.getCaseID();
			if(aReportForm.getIssueDateStr()!=null) {
				previewUrl=previewUrl+"&issueDate="+aReportForm.getIssueDateStr();
			}
			String downloadUrl = request.getRequestURL().toString()+"/download/"+lang;
			String saveUrl = "/prescription/save/"+lang;
			
			model.addAttribute("reportForm", aReportForm);		
			model.addAttribute("previewUrl", previewUrl);
			model.addAttribute("downloadUrl", downloadUrl);	
			model.addAttribute("saveUrl", saveUrl);	
		}catch(Exception e) {
			logger.error("prescription(): general exception!",e);
			return "error";
		}	
		return "report/preview";
	}
	
	@RequestMapping(value = "/report/cert", method = RequestMethod.POST)
	public String certificate(Locale locale, Model model, @ModelAttribute("reportForm")ReportForm aReportForm, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("receipt(): id="+aReportForm.getCaseID());
			
			Cases latest = this.casesDao.getCaseById(aReportForm.getCaseID());
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}			
			this.defaultReport(latest, model, false, false, SecurityUtil.getUsername(aSecurityContextHolder), issueDate);
			
		}catch(Exception e) {
			logger.error("certificate(): general exception!",e);
			return "error";
		}	
		
		return "report/certificate";
	}
	
	@RequestMapping(value = "/report/certificate", method = RequestMethod.POST)
	public String certificate(Locale locale, Model model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletRequest request) {
		try {
			logger.info("certificate(): id="+aReportForm.getCaseID());
			
			String lang = aReportForm.getLang();		
			if(lang == null || lang.isEmpty()) {
				lang = ClinicConstant.LANG_TC;
			}
			
			if(ClinicConstant.LANG_EN.compareToIgnoreCase(lang)==0) {			
				model.addAttribute("otherLangName", "中文");
				model.addAttribute("reportTitle", "Sick Leave Certificate");
				model.addAttribute("otherLang", ClinicConstant.LANG_TC);
			}
			else {			
				model.addAttribute("otherLangName", "English");
				model.addAttribute("reportTitle", "病假證明書");
				model.addAttribute("otherLang", ClinicConstant.LANG_EN);
			}
			
			String previewUrl = request.getRequestURL().toString()+"/preview/"+lang+"?id="+aReportForm.getCaseID()
				+"&startDate="+aReportForm.getStartDateStr()+"&endDate="+aReportForm.getEndDateStr()+"&noOfDate="+aReportForm.getNoOfDate();
			if(aReportForm.getIssueDateStr()!=null) {
				previewUrl=previewUrl+"&issueDate="+aReportForm.getIssueDateStr();
			}			
			String downloadUrl = request.getRequestURL().toString()+"/download/"+lang;
			String saveUrl = "/certificate/save/"+lang;
			
			model.addAttribute("reportForm", aReportForm);		
			model.addAttribute("previewUrl", previewUrl);
			model.addAttribute("downloadUrl", downloadUrl);		
			model.addAttribute("saveUrl", saveUrl);	
		}catch(Exception e) {
			logger.error("certificate(): general exception!",e);
			return "error";
		}
		return "report/preview";
	}
	
	@RequestMapping(value = "/report/receiptInput", method = RequestMethod.POST)
	public String receiptInput(Locale locale, Model model, @ModelAttribute("reportForm")ReportForm aReportForm, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("receiptInput(): id="+aReportForm.getCaseID());
			
			Cases latest = this.casesDao.getCaseById(aReportForm.getCaseID());
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}
			this.defaultReport(latest, model, false, false, SecurityUtil.getUsername(aSecurityContextHolder), issueDate);
			
		}catch(Exception e) {
			logger.error("receiptInput(): general exception!",e);
			return "error";
		}	
		
		return "report/receipt";
	}
	
	@RequestMapping(value = "/report/receipt", method = RequestMethod.POST)
	public String receipt(Locale locale, Model model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletRequest request) {
		try {
			logger.info("receipt(): id="+aReportForm.getCaseID());
			
			String lang = aReportForm.getLang();		
			if(lang == null || lang.isEmpty()) {
				lang = ClinicConstant.LANG_TC;
			}
			
			if(ClinicConstant.LANG_EN.compareToIgnoreCase(lang)==0) {			
				model.addAttribute("otherLangName", "中文");
				model.addAttribute("reportTitle", "Medical Receipt");
				model.addAttribute("otherLang", ClinicConstant.LANG_TC);
			}
			else {			
				model.addAttribute("otherLangName", "English");
				model.addAttribute("reportTitle", "到診收據");
				model.addAttribute("otherLang", ClinicConstant.LANG_EN);
			}
			
			String previewUrl = request.getRequestURL().toString()+"/preview/"+lang+"?id="+aReportForm.getCaseID();
			if(aReportForm.getIssueDateStr()!=null) {
				previewUrl=previewUrl+"&issueDate="+aReportForm.getIssueDateStr();
			}			
			String downloadUrl = request.getRequestURL().toString()+"/download/"+lang;
			String saveUrl = "/receipt/save/"+lang;
			
			model.addAttribute("reportForm", aReportForm);		
			model.addAttribute("previewUrl", previewUrl);
			model.addAttribute("downloadUrl", downloadUrl);		
			model.addAttribute("saveUrl", saveUrl);	
		}catch(Exception e) {
			logger.error("receipt(): general exception!",e);
			return "error";
		}
		return "report/preview";
	}
	
	@RequestMapping(value = "/report/followupInput", method = RequestMethod.POST)
	public String followupInput(Locale locale, Model model, @ModelAttribute("reportForm")ReportForm aReportForm, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("followupInput(): id="+aReportForm.getCaseID());
			
			Cases latest = this.casesDao.getCaseById(aReportForm.getCaseID());
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}
			this.defaultReport(latest, model, false, false, SecurityUtil.getUsername(aSecurityContextHolder), issueDate);
			
		}catch(Exception e) {
			logger.error("followupInput(): general exception!",e);
			return "error";
		}	
		
		return "report/followup";
	}
	
	@RequestMapping(value = "/report/followup", method = RequestMethod.POST)
	public String followup(Locale locale, Model model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletRequest request) {
		try {
			logger.info("followup(): id="+aReportForm.getCaseID());
			
			String lang = aReportForm.getLang();		
			if(lang == null || lang.isEmpty()) {
				lang = ClinicConstant.LANG_TC;
			}
			
			if(ClinicConstant.LANG_EN.compareToIgnoreCase(lang)==0) {			
				model.addAttribute("otherLangName", "中文");
				model.addAttribute("reportTitle", "Attendance Certificate");
				model.addAttribute("otherLang", ClinicConstant.LANG_TC);
			}
			else {			
				model.addAttribute("otherLangName", "English");
				model.addAttribute("reportTitle", "到診紙");
				model.addAttribute("otherLang", ClinicConstant.LANG_EN);
			}
			
			String previewUrl = request.getRequestURL().toString()+"/preview/"+lang+"?id="+aReportForm.getCaseID();
			if(aReportForm.getIssueDateStr()!=null) {
				previewUrl=previewUrl+"&issueDate="+aReportForm.getIssueDateStr();
			}			
			String downloadUrl = request.getRequestURL().toString()+"/download/"+lang;	
			String saveUrl = "/followup/save/"+lang;
			
			model.addAttribute("reportForm", aReportForm);		
			model.addAttribute("previewUrl", previewUrl);
			model.addAttribute("downloadUrl", downloadUrl);	
			model.addAttribute("saveUrl", saveUrl);	
		}catch(Exception e) {
			logger.error("followup(): general exception!",e);
			return "error";
		}
		return "report/preview";
	}
	
	@RequestMapping(value = "/report/report/preview/tc", method = RequestMethod.GET)
	@ResponseBody
	public void previewReportTC(ModelMap model, @RequestParam("id") Long aCaseId, @RequestParam(value="issueDate", required=false) String aIssueDate
			,HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("previewReportTC(): id="+aCaseId);
			
			String reportName="report_tc";
			
			Date issueDate = new Date();
			if(aIssueDate != null && aIssueDate.length()>0) {
				issueDate = DateUtil.parseDate(aIssueDate);
			}
			this.previewReportPdf(response, reportName, aCaseId, false, true, SecurityUtil.getUsername(aSecurityContextHolder), issueDate);			
			
		}catch(Exception e) {
			logger.error("previewReportTC(): general exception!",e);			
		}
	}
	
	@RequestMapping("/report/report/download/tc")	
	public String downloadReportTC(ModelMap model, @ModelAttribute("reportForm")ReportForm aReportForm, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("downloadReportTC(): id="+aReportForm.getCaseID());
			
			String reportName="report_tc";
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}
			this.downloadReportPdf(aReportForm.getPath(), reportName, aReportForm.getCaseID(),false, true, SecurityUtil.getUsername(aSecurityContextHolder), issueDate);
			
			model.addAttribute("reportForm", aReportForm);
		}catch(Exception e) {
			logger.error("downloadReportTC(): general exception!",e);
			return "error";
		}
		return "report/confirmDownload";
	}	
	
	@RequestMapping(value = "/report/prescription/preview/tc", method = RequestMethod.GET)
	@ResponseBody
	public void previewPrescriptionTC(ModelMap model, @RequestParam("id") Long aCaseId, @RequestParam(value="issueDate", required=false) String aIssueDate
			, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("previewPrescriptionTC(): id="+aCaseId+" ,aIssueDate="+aIssueDate);
			
			String reportName="prescription_tc";
			
			Date issueDate = new Date();
			if(aIssueDate != null && aIssueDate.length()>0) {
				issueDate = DateUtil.parseDate(aIssueDate);
			}
			this.previewReportPdf(response, reportName, aCaseId, false, true, SecurityUtil.getUsername(aSecurityContextHolder), issueDate);
		}catch(Exception e) {
			logger.error("previewPrescriptionTC(): general exception!",e);
		}
	}
	
	@RequestMapping(value = "/report/prescription/preview/en", method = RequestMethod.GET)
	@ResponseBody
	public void previewPrescriptionEN(ModelMap model, @RequestParam("id") Long aCaseId, @RequestParam(value="issueDate", required=false) String aIssueDate
			, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("previewPrescriptionEN(): id="+aCaseId);
			
			String reportName="prescription_en";
			
			Date issueDate = new Date();
			if(aIssueDate != null && aIssueDate.length()>0) {
				issueDate = DateUtil.parseDate(aIssueDate);
			}
			this.previewReportPdf(response, reportName, aCaseId, false, true, SecurityUtil.getUsername(aSecurityContextHolder), issueDate);
		}catch(Exception e) {
			logger.error("previewPrescriptionEN(): general exception!",e);
		}
	}
	
	@RequestMapping("/report/prescription/download/tc")
	@ResponseBody
	public void downloadPrescriptionTC(ModelMap model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("downloadPrescriptionTC(): id="+aReportForm.getCaseID());
			
			String reportName="prescription_tc";
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}
			this.downloadReportDocx(response, reportName, aReportForm.getCaseID(),false, true, SecurityUtil.getUsername(aSecurityContextHolder), issueDate);
		}catch(Exception e) {
			logger.error("downloadPrescriptionTC(): general exception!",e);
		}			
	}	
	
	@RequestMapping("/report/prescription/download/en")
	@ResponseBody
	public void downloadPrescriptionEN(ModelMap model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("downloadPrescriptionEN(): id="+aReportForm.getCaseID());
			
			String reportName="prescription_en";
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}
			this.downloadReportDocx(response, reportName, aReportForm.getCaseID(), true, true, SecurityUtil.getUsername(aSecurityContextHolder), issueDate);
		}catch(Exception e) {
			logger.error("downloadPrescriptionEN(): general exception!",e);
		}				
	}
	
	@RequestMapping(value = "/report/certificate/preview/tc", method = RequestMethod.GET)
	@ResponseBody
	public void previewCertificateTC(ModelMap model, @RequestParam("id") Long aCaseId
			, @RequestParam("startDate") String startDateStr, @RequestParam("endDate") String endDateStr, @RequestParam("noOfDate") Integer noOfDate
			, @RequestParam(value="issueDate", required=false) String aIssueDate
			, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("previewCertificateTC(): id="+aCaseId);
			
			String reportName="cert_tc";
			
			Date issueDate = new Date();
			if(aIssueDate != null && aIssueDate.length()>0) {
				issueDate = DateUtil.parseDate(aIssueDate);
			}
			this.previewCertPdf(response, reportName, aCaseId, false, startDateStr, endDateStr, noOfDate, SecurityUtil.getUsername(aSecurityContextHolder),issueDate);
		}catch(Exception e) {
			logger.error("previewCertificateTC(): general exception!",e);
		}	
	}
	
	@RequestMapping(value = "/report/certificate/preview/en", method = RequestMethod.GET)
	@ResponseBody
	public void previewCertificateEN(ModelMap model, @RequestParam("id") Long aCaseId			
			, @RequestParam("startDate") String startDateStr, @RequestParam("endDate") String endDateStr, @RequestParam("noOfDate") Integer noOfDate
			, @RequestParam(value="issueDate", required=false) String aIssueDate
			, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("previewCertificateEN(): id="+aCaseId);
			
			String reportName="cert_en";
			
			Date issueDate = new Date();
			if(aIssueDate != null && aIssueDate.length()>0) {
				issueDate = DateUtil.parseDate(aIssueDate);
			}
			this.previewCertPdf(response, reportName, aCaseId, true, startDateStr, endDateStr, noOfDate, SecurityUtil.getUsername(aSecurityContextHolder),issueDate);
		}catch(Exception e) {
			logger.error("previewCertificateEN(): general exception!",e);
		}	
	}
	
	@RequestMapping(value = "/report/followup/preview/tc", method = RequestMethod.GET)
	@ResponseBody
	public void previewFollowupTC(ModelMap model, @RequestParam("id") Long aCaseId , @RequestParam(value="issueDate", required=false) String aIssueDate
			, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("previewFollowupTC(): id="+aCaseId);
			
			String reportName="followup_tc";
			
			Date issueDate = new Date();
			if(aIssueDate != null && aIssueDate.length()>0) {
				issueDate = DateUtil.parseDate(aIssueDate);
			}
			this.previewReportPdf(response, reportName, aCaseId, false, false, SecurityUtil.getUsername(aSecurityContextHolder),issueDate);
		}catch(Exception e) {
			logger.error("previewFollowupTC(): general exception!",e);
		}			
	}
	
	@RequestMapping(value = "/report/followup/preview/en", method = RequestMethod.GET)
	@ResponseBody
	public void previewFollowupEN(ModelMap model, @RequestParam("id") Long aCaseId, @RequestParam(value="issueDate", required=false) String aIssueDate
			, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("previewFollowupEN(): id="+aCaseId);
			
			String reportName="followup_en";
			
			Date issueDate = new Date();
			if(aIssueDate != null && aIssueDate.length()>0) {
				issueDate = DateUtil.parseDate(aIssueDate);
			}
			this.previewReportPdf(response, reportName, aCaseId, true, false, SecurityUtil.getUsername(aSecurityContextHolder),issueDate);
		}catch(Exception e) {
			logger.error("previewFollowupEN(): general exception!",e);
		}				
	}
	
	@RequestMapping("/report/certificate/download/tc")
	@ResponseBody
	public void downloadCertificateTC(ModelMap model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("downloadCertificateTC(): id="+aReportForm.getCaseID());
			
			String reportName="cert_tc";
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}
			this.downloadCertDocx(response, reportName, aReportForm.getCaseID(), false, aReportForm.getStartDateStr(), aReportForm.getEndDateStr()
					, aReportForm.getNoOfDate(), SecurityUtil.getUsername(aSecurityContextHolder),issueDate);
		}catch(Exception e) {
			logger.error("downloadCertificateTC(): general exception!",e);
		}	
	}
	
	@RequestMapping("/report/certificate/download/en")
	@ResponseBody
	public void downloadCertificateEN(ModelMap model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("downloadCertificateEN(): id="+aReportForm.getCaseID());
			
			String reportName="cert_en";
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}
			this.downloadCertDocx(response, reportName, aReportForm.getCaseID(), false, aReportForm.getStartDateStr(), aReportForm.getEndDateStr()
					, aReportForm.getNoOfDate(), SecurityUtil.getUsername(aSecurityContextHolder),issueDate);
		}catch(Exception e) {
			logger.error("downloadCertificateEN(): general exception!",e);
		}	
	}	
	
	@RequestMapping("/report/followup/download/tc")
	@ResponseBody
	public void downloadFollowupTC(ModelMap model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
		logger.info("downloadFollowupTC(): id="+aReportForm.getCaseID());
		
		String reportName="followup_tc";
		
		Date issueDate = new Date();
		if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
			issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
		}
		this.downloadReportDocx(response, reportName, aReportForm.getCaseID(), false, false, SecurityUtil.getUsername(aSecurityContextHolder),issueDate);
		}catch(Exception e) {
			logger.error("downloadFollowupTC(): general exception!",e);
		}	
	}
	
	@RequestMapping("/report/followup/download/en")
	@ResponseBody
	public void downloadFollowupEN(ModelMap model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("downloadFollowupEN(): id="+aReportForm.getCaseID());
			
			String reportName="followup_en";
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}
			this.downloadReportDocx(response, reportName, aReportForm.getCaseID(), true, false, SecurityUtil.getUsername(aSecurityContextHolder),issueDate);
		}catch(Exception e) {
			logger.error("downloadFollowupEN(): general exception!",e);
		}	
	}	
		
	@RequestMapping(value = "/report/receipt/preview/tc", method = RequestMethod.GET)
	@ResponseBody
	public void previewReceiptTC(ModelMap model, @RequestParam("id") Long aCaseId, @RequestParam(value="issueDate", required=false) String aIssueDate
			, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("previewReceiptTC(): id="+aCaseId+",issueDate="+aIssueDate);
			
			String reportName="receipt_tc";
			
			Date issueDate = new Date();
			if(aIssueDate != null && aIssueDate.length()>0) {
				issueDate = DateUtil.parseDate(aIssueDate);
			}
			this.previewReportPdf(response, reportName, aCaseId, false, false, SecurityUtil.getUsername(aSecurityContextHolder),issueDate);
		}catch(Exception e) {
			logger.error("previewReceiptTC(): general exception!",e);
		}	
		
	}
	
	@RequestMapping(value = "/report/receipt/preview/en", method = RequestMethod.GET)
	@ResponseBody
	public void previewReceiptEN(ModelMap model, @RequestParam("id") Long aCaseId, @RequestParam(value="issueDate", required=false) String aIssueDate
			, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("previewReceiptTC(): id="+aCaseId+",issueDate="+aIssueDate);
			
			String reportName="receipt_en";
			
			Date issueDate = new Date();
			if(aIssueDate != null && aIssueDate.length()>0) {
				issueDate = DateUtil.parseDate(aIssueDate);
			}
			this.previewReportPdf(response, reportName, aCaseId, true, false, SecurityUtil.getUsername(aSecurityContextHolder),issueDate);
		}catch(Exception e) {
			logger.error("previewReceiptEN(): general exception!",e);
		}	
	}
	
	@RequestMapping("/report/receipt/download/tc")
	@ResponseBody
	public void downloadReceiptTC(ModelMap model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("downloadReceiptTC(): id="+aReportForm.getCaseID());
			
			String reportName="receipt_tc";
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}
			this.downloadReportDocx(response, reportName, aReportForm.getCaseID(),false, false, SecurityUtil.getUsername(aSecurityContextHolder), issueDate);
		}catch(Exception e) {
			logger.error("downloadReceiptTC(): general exception!",e);
		}	
	}	
	
	@RequestMapping("/report/receipt/download/en")
	@ResponseBody
	public void downloadReceiptEN(ModelMap model, @ModelAttribute("reportForm")ReportForm aReportForm, HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("downloadReceiptEN(): id="+aReportForm.getCaseID());
			
			String reportName="receipt_en";
			
			Date issueDate = new Date();
			if(aReportForm.getIssueDateStr() != null && aReportForm.getIssueDateStr().length()>0) {
				issueDate = DateUtil.parseDate(aReportForm.getIssueDateStr());
			}
			this.downloadReportDocx(response, reportName, aReportForm.getCaseID(), true, false, SecurityUtil.getUsername(aSecurityContextHolder),issueDate);
		}catch(Exception e) {
			logger.error("downloadReceiptEN(): general exception!",e);
		}	
	}	
	
	private void previewCertPdf(HttpServletResponse response, String reportName, Long aCaseID, boolean isEng, String startDateStr, String endDateStr, Integer noOfDate, String aUsername, Date aIssueDate) {
		response.setContentType(ClinicConstant.CONTENT_TYPE_PDF);
		response.addHeader("Content-Disposition", "inline; filename=" + reportName + aCaseID + "." + ClinicConstant.REPORT_FORMAT_PDF);
		
		OutputStream outputStream = null;
		try {
			outputStream = response.getOutputStream();
			Cases thisCase = this.casesDao.getCaseById(aCaseID);
			
			ReportVo reportVo = this.reportService.getReport(thisCase, isEng, false, aUsername,aIssueDate);
			
			//Addition parameter from request
			reportVo.setStartDateStr(startDateStr);
			reportVo.setEndDateStr(endDateStr);
			reportVo.setNoOfDate(noOfDate);
			
			//Actual generate report
			this.reportService.generatePdfReportStream(outputStream, reportVo, reportName);
			
			outputStream.flush();

		} catch (IOException ioe) {
			logger.error("Download file error", ioe);
		} catch (Exception e) {
			logger.error("Download general error", e);
		} finally {
			close(outputStream);
		}
	}
	
	private void downloadCertDocx(HttpServletResponse response, String reportName, Long aCaseID, boolean isEng, String startDateStr, String endDateStr, Integer noOfDate, String aUsername, Date aIssueDate) {
		//Set response header
		response.reset();
		response.setContentType(ClinicConstant.CONTENT_TYPE_DOCX);
		response.addHeader("Content-Disposition", "attachment; filename="+reportName + aCaseID + "." + ClinicConstant.REPORT_FORMAT_DOCX);
		OutputStream outputStream = null;
		try {
			outputStream = response.getOutputStream();
			Cases thisCase = this.casesDao.getCaseById(aCaseID);
			
			ReportVo reportVo = this.reportService.getReport(thisCase, isEng, false, aUsername, aIssueDate);
			
			//Addition parameter from request
			reportVo.setStartDateStr(startDateStr);
			reportVo.setEndDateStr(endDateStr);
			reportVo.setNoOfDate(noOfDate);
			
			//Actual generate report
			this.reportService.generateDocxReportStream(outputStream, reportVo, reportName);
			
			outputStream.flush();

		} catch (IOException ioe) {
			logger.error("Download file error", ioe);
		} catch (Exception e) {
			logger.error("Download general error", e);
		} finally {
			close(outputStream);
		}
	}
	
	
	private void downloadReportPdf(String path, String reportName, Long aCaseID, boolean isEng, boolean needMedicList, String aUsername, Date aIssueDate) {
		
		File directory = new File(path);		
		boolean isCreated = directory.mkdirs();
		if(isCreated) {
			logger.info("Directory "+path+" is created successfully.");
		}
			
		File outputFile = new File(path+"/"+reportName+"_"+aCaseID+"."+ClinicConstant.REPORT_FORMAT_PDF);	
		OutputStream outputStream = null;
		
		try {			
			if(!outputFile.exists()) {
				isCreated = outputFile.createNewFile();				
				if(isCreated) {
					logger.info("Create file="+outputFile.getAbsolutePath());
				}
			}			
			outputStream = new FileOutputStream(outputFile);
			
			Cases thisCase = this.casesDao.getCaseById(aCaseID);
			
			ReportVo reportVo = this.reportService.getReport(thisCase, isEng, needMedicList, aUsername, aIssueDate);
			
			//Actual generate report
			this.reportService.generatePdfReportStream(outputStream, reportVo, reportName);
			
			outputStream.flush();

		} catch (IOException ioe) {
			logger.error("Download file error", ioe);
		} catch (Exception e) {
			logger.error("Download general error", e);
		} finally {
			close(outputStream);
		}
	}
	
	private void previewReportPdf(HttpServletResponse response, String reportName, Long aCaseID, boolean isEng, boolean needMedicList, String aUsername, Date aIssueDate) {
		response.setContentType(ClinicConstant.CONTENT_TYPE_PDF);
		response.addHeader("Content-Disposition", "inline; filename=" + reportName + aCaseID + "." + ClinicConstant.REPORT_FORMAT_PDF);
		
		OutputStream outputStream = null;
		try {
			outputStream = response.getOutputStream();
			Cases thisCase = this.casesDao.getCaseById(aCaseID);
			
			ReportVo reportVo = this.reportService.getReport(thisCase, isEng, needMedicList, aUsername, aIssueDate);			
			
			//Actual generate report
			this.reportService.generatePdfReportStream(outputStream, reportVo, reportName);
			
			outputStream.flush();

		} catch (IOException ioe) {
			logger.error("Download file error", ioe);
		} catch (Exception e) {
			logger.error("Download general error", e);
		} finally {
			close(outputStream);
		}
	}
	
	private void downloadReportDocx(HttpServletResponse response, String reportName, Long aCaseID, boolean isEng, boolean needMedicList, String aUsername, Date aIssueDate) {
		//Set response header
		response.reset();
		response.setContentType(ClinicConstant.CONTENT_TYPE_DOCX);
		response.addHeader("Content-Disposition", "attachment; filename="+reportName + aCaseID + "." + ClinicConstant.REPORT_FORMAT_DOCX);
		OutputStream outputStream = null;
		try {
			outputStream = response.getOutputStream();
			Cases thisCase = this.casesDao.getCaseById(aCaseID);
			
			ReportVo reportVo = this.reportService.getReport(thisCase, isEng, needMedicList, aUsername, aIssueDate);
			
			//Actual generate report
			this.reportService.generateDocxReportStream(outputStream, reportVo, reportName);
			
			outputStream.flush();

		} catch (IOException ioe) {
			logger.error("Download file error", ioe);
		} catch (Exception e) {
			logger.error("Download general error", e);
		} finally {
			close(outputStream);
		}
	}

	private static void close(Closeable resource) {
		if (resource != null) {
			try {
				resource.close();
			} catch (IOException e) {
				logger.error(e.getMessage());
			}
		}
	}
	
	private void defaultReport(Cases aCase, Model model, boolean isEng, boolean needMedicList, String aUsername, Date aIssueDate){
		model.addAttribute("caseId", aCase.getCaseID());
		
		ReportVo reportVo = this.reportService.getReport(aCase, isEng, needMedicList, aUsername, aIssueDate);		
		model.addAttribute("report", reportVo);		
		
		if(needMedicList) {
			model.addAttribute("medicList", reportVo.getMedicines());
		}
		
		Date issueDate = new Date();
		if(aIssueDate != null) {
			issueDate = aIssueDate;
		}
		ReportForm reportForm = new ReportForm();
		reportForm.setIssueDateStr(DateUtil.format(issueDate));
		reportForm.setCaseID(aCase.getCaseID());
		model.addAttribute("reportForm", reportForm);
	}	
}
