package com.clinic.web;

import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.clinic.web.constant.ClinicConstant;
import com.clinic.web.dao.CaseAttachmentDao;
import com.clinic.web.dao.CasesDao;
import com.clinic.web.dao.CasesViewDao;
import com.clinic.web.dao.MedicineDao;
import com.clinic.web.dao.StatisticDao;
import com.clinic.web.dao.SymptomDao;
import com.clinic.web.entity.CaseAttachment;
import com.clinic.web.entity.CaseMedicine;
import com.clinic.web.entity.Cases;
import com.clinic.web.entity.CasesView;
import com.clinic.web.entity.Medicine;
import com.clinic.web.entity.Symptoms;
import com.clinic.web.service.AccessControlService;
import com.clinic.web.service.AuditLogService;
import com.clinic.web.service.LunarExtractor;
import com.clinic.web.service.PriceService;
import com.clinic.web.service.ReportService;
import com.clinic.web.service.WeatherExtractor;
import com.clinic.web.util.DateUtil;
import com.clinic.web.util.NumberUtil;
import com.clinic.web.util.SecurityUtil;
import com.clinic.web.vo.CaseEffectVo;
import com.clinic.web.vo.GroupEffectVo;
import com.clinic.web.vo.ReportVo;
import com.clinic.web.vo.WeatherVo;


@RestController
public class RestfulController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestfulController.class);
	
	//Dao
	@Resource
	private CasesViewDao casesViewDao;
	
	@Resource
	private CasesDao casesDao;
	
	@Resource
	private PriceService priceService;
	
	@Resource
	private MedicineDao medicineDao;
	
	@Resource
	private SymptomDao symptomDao;
	
	@Resource
	private StatisticDao statisticDao;
	
	@Resource
	private CaseAttachmentDao caseAttachmentDao;
	
	//Service
	@Resource
	private AuditLogService auditLogService;
	
	@Resource
	private AccessControlService accessControlService;
	
	@Resource
	private ReportService reportService;
	
	// Cache
	private Map<String,List<WeatherVo>> weatherMap = new HashMap<String,List<WeatherVo>>();
	private Map<String,WeatherVo> currentWeatherMap = new HashMap<String,WeatherVo>();
	
	@RequestMapping(value = "ws/weather_forecast", method = RequestMethod.GET)
	public List<WeatherVo> getWeatherForecast(){
		Date date = new Date();		
		String cacheKey = DateUtil.formatCacheDate(date);
		List<WeatherVo> cachedVo = weatherMap.get(cacheKey);
		
		if(cachedVo==null) {
			//Extract 9 days forecast weather
			List<WeatherVo> forecast = WeatherExtractor.extractHtml();
	
			//Extract lunar date
			LunarExtractor.setLunar(forecast);
			
			//Put to cache
			weatherMap.put(cacheKey, forecast);
			
			return forecast;
		}
		else {
			logger.debug("Return cachedVo with key="+cacheKey);
			return cachedVo;
		}
	}
	
	@RequestMapping(value = "ws/current_weather", method = RequestMethod.GET)
	public WeatherVo getCurrentWeather() {		
		Date date = new Date();		
		String cacheKey = DateUtil.formatCacheDate(date);		
		WeatherVo cachedVo = currentWeatherMap.get(cacheKey);
		
		if(cachedVo==null) {		
			//Extract current weather
			WeatherVo current = WeatherExtractor.extractCurrentWeather();
			
			if(current != null) {
				//Extract extractGanzhi
				try {
					String todayStr = current.getDate();
					int day = Integer.parseInt(todayStr.substring(todayStr.indexOf("月")+1,todayStr.indexOf("日")));
					String granzhi = LunarExtractor.extractGanzhi(day);
					logger.debug("Today's granzhi="+granzhi);
					current.setGranzhi(granzhi);				
				}catch(Exception e){
					logger.error("Unable to get Ganzhi!",e);
				}
			}
			
			//Put to cache
			currentWeatherMap.put(cacheKey, current);
			return current;
		}
		else {
			logger.debug("Return cachedVo with key="+cacheKey);
			return cachedVo;
		}
	}
	
	@RequestMapping(value = "ws/effect_date", method = RequestMethod.GET)
	public GroupEffectVo getGroupEffectStartDate(Locale locale, Model model,@RequestParam("custID")Long aCustomerID, @RequestParam("type")String aType
			, @RequestParam("date")String aDateStr){
		
		GroupEffectVo groupVo = new GroupEffectVo();
		try {
			Date caseDate = DateUtil.parseDate(aDateStr);		
			List<CaseEffectVo> effectList = this.statisticDao.getGroupEffect(aCustomerID, aType, caseDate);
			
			if(effectList != null && effectList.size() >0) {			
				Date groupEffectStartDate = null;
				for(CaseEffectVo effect: effectList) {
					//First row
					if(groupEffectStartDate == null) {
						groupEffectStartDate = effect.getDate();
						groupVo.addEffect(effect);
					}
					else { //Other row
						if(effect.getReset()) {
							break; //stop
						}
						else {
							groupEffectStartDate = effect.getDate();
							groupVo.addEffect(effect);
						}					
					}				
				}			
				groupVo.setStartDateStr(DateUtil.format(groupEffectStartDate));
				groupVo.setEndDateStr(aDateStr);
				groupVo.setCount(groupVo.getEffectList().size());
			}
		}catch(ParseException e) {
			logger.error("getGroupEffectStartDate(): unable to parse dateStr="+aDateStr);			
		}catch(Exception e) {
			logger.error("getGroupEffectStartDate(): general exception!",e);
		}
		
		return groupVo;
	}
	
	@RequestMapping(value = "ws/symptom", method = RequestMethod.GET)
	public List<Symptoms> getSymtom(Locale locale, Model model,@RequestParam("type")String aType, @RequestParam("level")Integer aLevel) {
		List<Symptoms> symptoms = this.symptomDao.getSymptom(aType, aLevel);
		return symptoms;
	}
	
	@RequestMapping(value = "ws/case", method = RequestMethod.GET)
	public CasesView getCase(Locale locale, Model model,@RequestParam("id")Long aCaseId) {		
		return this.casesViewDao.getCasesViewById(aCaseId);		
	}
	
	@RequestMapping(value = "ws/case/last", method = RequestMethod.GET)
	public Long getLastCase(Locale locale, Model model,@RequestParam("caseId")Long aCurrentCaseId, @RequestParam("customerId")Long aCustomerId) {		
		CasesView casesView =  this.casesViewDao.getLastCasesViewByCustomerId(aCurrentCaseId, aCustomerId);
		
		if(casesView != null){
			return casesView.getCaseID();
		}
		return 0L;
	}
	
	@RequestMapping(value = "ws/case/last2", method = RequestMethod.GET)
	public Long getLastSameProblemCase(Locale locale, Model model,@RequestParam("caseId")Long aCurrentCaseId, @RequestParam("customerId")Long aCustomerId, @RequestParam("problem")String aProblem) {		
		CasesView casesView =  this.casesViewDao.getLastSameProblemCasesView(aCurrentCaseId, aCustomerId, aProblem);
		
		if(casesView != null){
			return casesView.getCaseID();
		}
		return 0L;
	}
	
	@RequestMapping(value = "ws/case/last3", method = RequestMethod.GET)
	public Long getLastSameSicknessCase(Locale locale, Model model,@RequestParam("caseId")Long aCurrentCaseId, @RequestParam("sick")String aSickness) {		
		CasesView casesView =  this.casesViewDao.getLastSameSicknessCasesView(aCurrentCaseId, aSickness);
		
		if(casesView != null){
			return casesView.getCaseID();
		}
		return 0L;
	}
	
	@RequestMapping(value = "ws/case/last4", method = RequestMethod.GET)
	public Long getLastSameCustomerNSicknessCase(Locale locale, Model model,@RequestParam("caseId")Long aCurrentCaseId, @RequestParam("customerId")Long aCustomerId, @RequestParam("sick")String aSickness) {		
		CasesView casesView =  this.casesViewDao.getLastSameCustomerNSicknessCasesView(aCurrentCaseId, aCustomerId, aSickness);
		
		if(casesView != null){
			return casesView.getCaseID();
		}
		return 0L;
	}
	
	@RequestMapping(value = "ws/case/medic", method = RequestMethod.GET)
	public List<CaseMedicine> getCaseMedicine(Locale locale, Model model,@RequestParam("caseId")Long aCaseId) {		
		Cases cases = this.casesDao.getCaseById(aCaseId);
		
		List<CaseMedicine> medicineList = cases.getMedicines();
		
		if(medicineList != null){
			for(CaseMedicine medic: medicineList){
				medic.setCases(null); //set null to prevent infinite loop
			}
			return medicineList;
		}

		return null;
	}
	
	@RequestMapping(value = "ws/medic", method = RequestMethod.GET)
	public Medicine getMedicine(Locale locale, Model model,@RequestParam("code")String aCode) {		
		Medicine medic = this.medicineDao.getMedicineByCode(aCode);		

		return medic;
	}
	
	@RequestMapping(value = "ws/medic2", method = RequestMethod.GET)
	public Medicine getMedicineByName(Locale locale, Model model,@RequestParam("name")String aName) {		
		Medicine medic = this.medicineDao.searchMedicineByExactName(aName);

		return medic;
	}
	
	@RequestMapping(value = "ws/case/dprice", method = RequestMethod.GET)
	public String getCaseDosePrice(Locale locale, Model model,@RequestParam("caseId")Long aCaseId, @RequestParam("system")String aPriceSystem) {		
		BigDecimal dosePrice = this.priceService.calculateDosePrice(aCaseId, aPriceSystem);
		
		return NumberUtil.formatPrice(dosePrice);
	}
	
	@RequestMapping(value = "ws/case/check", method = RequestMethod.GET)
	public String logCheckPrescription( Model model,@RequestParam("caseId")Long aCaseId, @RequestParam("checkedNo")Integer checkedMedicineNo,
			@RequestParam("totalNo")Integer totalMedicineNo, SecurityContextHolder aSecurityContextHolder) {
		
		try {
			Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
			String userName = this.accessControlService.getLoginUserName(auth);
		
			this.auditLogService.logCheckPrescription(userName, aCaseId.intValue(), checkedMedicineNo, totalMedicineNo);
			
			this.casesDao.confirmCases(aCaseId, userName);
		}
		catch(Exception e) {
			logger.error("Unknown error!",e);
			return "Log failed";
		}		
		return "Log completed";
	}
	
	@RequestMapping(value = "ws/case/confirm", method = RequestMethod.GET)
	public String logConfirmPrescription( Model model,@RequestParam("caseId")Long aCaseId, @RequestParam("checkedNo")Integer checkedMedicineNo,
			@RequestParam("totalNo")Integer totalMedicineNo, SecurityContextHolder aSecurityContextHolder) {
		
		try {
			Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
			String userName = this.accessControlService.getLoginUserName(auth);
		
			this.auditLogService.logDirectConfirmPrescription(userName, aCaseId.intValue(), checkedMedicineNo, totalMedicineNo);
			
			this.casesDao.confirmCases(aCaseId, userName);
		}
		catch(Exception e) {
			logger.error("Unknown error!",e);
			return "Log failed";
		}		
		return "Log completed";
	}
	
	@RequestMapping("/ws/report/save/tc")
	public String saveReportTC(ModelMap model, @RequestParam("id") Long aCaseId, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("saveReportTC(): id="+aCaseId);
			
			String reportName="report_tc";
			String userName = SecurityUtil.getUsername(aSecurityContextHolder);
			
			this.saveReportAsAttachement(reportName, aCaseId,false, true, userName);			
		}catch(Exception e) {
			logger.error("saveReportTC(): general exception!",e);
			
			return "Save failed";
		}				
		return "Save completed";
	}
	
	@RequestMapping("/ws/prescription/save/en")
	public String savePrescriptionEN(ModelMap model, @RequestParam("id") Long aCaseId, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("savePrescriptionEN(): id="+aCaseId);
			
			String reportName="prescription_en";
			String userName = SecurityUtil.getUsername(aSecurityContextHolder);
			
			this.saveReportAsAttachement(reportName, aCaseId,true, true, userName);			
		}catch(Exception e) {
			logger.error("savePrescriptionEN(): general exception!",e);
			
			return "Save failed";
		}				
		return "Save completed";
	}
	
	@RequestMapping("/ws/prescription/save/tc")
	public String savePrescriptionTC(ModelMap model, @RequestParam("id") Long aCaseId, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("savePrescriptionTC(): id="+aCaseId);
			
			String reportName="prescription_tc";
			String userName = SecurityUtil.getUsername(aSecurityContextHolder);
			
			this.saveReportAsAttachement(reportName, aCaseId,false, true, userName);			
		}catch(Exception e) {
			logger.error("savePrescriptionTC(): general exception!",e);
			
			return "Save failed";
		}				
		return "Save completed";
	}
	
	@RequestMapping("/ws/followup/save/en")
	public String saveFollowupEN(ModelMap model, @RequestParam("id") Long aCaseId, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("saveFollowupEN(): id="+aCaseId);
			
			String reportName="followup_en";
			String userName = SecurityUtil.getUsername(aSecurityContextHolder);
			
			this.saveReportAsAttachement(reportName, aCaseId,true, false, userName);			
		}catch(Exception e) {
			logger.error("saveFollowupEN(): general exception!",e);
			
			return "Save failed";
		}				
		return "Save completed";
	}
	
	@RequestMapping("/ws/followup/save/tc")
	public String saveFollowupTC(ModelMap model, @RequestParam("id") Long aCaseId, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("saveFollowupTC(): id="+aCaseId);
			
			String reportName="followup_tc";
			String userName = SecurityUtil.getUsername(aSecurityContextHolder);
			
			this.saveReportAsAttachement(reportName, aCaseId,false, false, userName);			
		}catch(Exception e) {
			logger.error("saveFollowupTC(): general exception!",e);
			
			return "Save failed";
		}				
		return "Save completed";
	}
	
	@RequestMapping("/ws/receipt/save/en")
	public String saveReceiptEN(ModelMap model, @RequestParam("id") Long aCaseId, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("saveReceiptEN(): id="+aCaseId);
			
			String reportName="receipt_en";
			String userName = SecurityUtil.getUsername(aSecurityContextHolder);
			
			this.saveReportAsAttachement(reportName, aCaseId,true, false, userName);			
		}catch(Exception e) {
			logger.error("saveReceiptEN(): general exception!",e);
			
			return "Save failed";
		}				
		return "Save completed";
	}	
	
	@RequestMapping("/ws/receipt/save/tc")
	public String saveReceiptTC(ModelMap model, @RequestParam("id") Long aCaseId, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("saveReceiptTC(): id="+aCaseId);
			
			String reportName="receipt_tc";
			String userName = SecurityUtil.getUsername(aSecurityContextHolder);
			
			this.saveReportAsAttachement(reportName, aCaseId,false, false, userName);			
		}catch(Exception e) {
			logger.error("saveReceiptTC(): general exception!",e);
			
			return "Save failed";
		}				
		return "Save completed";
	}
	
	@RequestMapping("/ws/certificate/save/en")
	public String saveCertificateEN(ModelMap model, @RequestParam("id") Long aCaseId, @RequestParam("startDate") String startDateStr, @RequestParam("endDate") String endDateStr, @RequestParam("noOfDate") Integer noOfDate, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("saveCertificateEN(): id="+aCaseId);
			
			String reportName="cert_en";
			String userName = SecurityUtil.getUsername(aSecurityContextHolder);
			
			this.saveCertAsAttachement(reportName, aCaseId,true, startDateStr, endDateStr, noOfDate, userName);			
		}catch(Exception e) {
			logger.error("saveCertificateEN(): general exception!",e);
			
			return "Save failed";
		}				
		return "Save completed";
	}
	
	@RequestMapping("/ws/certificate/save/tc")
	public String saveCertificateTC(ModelMap model, @RequestParam("id") Long aCaseId, @RequestParam("startDate") String startDateStr, @RequestParam("endDate") String endDateStr, @RequestParam("noOfDate") Integer noOfDate, SecurityContextHolder aSecurityContextHolder) {
		try {
			logger.info("saveCertificateTC(): id="+aCaseId);
			
			String reportName="cert_tc";
			String userName = SecurityUtil.getUsername(aSecurityContextHolder);
			
			this.saveCertAsAttachement(reportName, aCaseId,false, startDateStr, endDateStr, noOfDate, userName);			
		}catch(Exception e) {
			logger.error("saveCertificateTC(): general exception!",e);
			
			return "Save failed";
		}				
		return "Save completed";
	}	
		
	private void saveCertAsAttachement(String aReportName, Long aCaseId, boolean isEng, String startDateStr, String endDateStr, Integer noOfDate , String aUsername) {
		try {
			logger.info("saveCertAsAttachement(): id="+aCaseId+"&reportName="+aReportName);
			
			if(aCaseId != null && aReportName != null) {
				Cases thisCase = this.casesDao.getCaseById(aCaseId);
				
				ReportVo reportVo = this.reportService.getReport(thisCase, isEng, false, aUsername, new Date());
				
				//Addition parameter from request
				reportVo.setStartDateStr(startDateStr);
				reportVo.setEndDateStr(endDateStr);
				reportVo.setNoOfDate(noOfDate);				
				
				byte[] reportBytes = this.reportService.generatePDFReport(reportVo, aReportName);
				
				logger.info("saveCertAsAttachement(): report is generated");
				
				Integer fileId= this.caseAttachmentDao.getNextFileId();
				logger.info("saveCertAsAttachement: get fileId="+fileId);
				
				CaseAttachment attachment = new CaseAttachment();
				attachment.setFileId(fileId);
				attachment.setCaseId(aCaseId.intValue());
				attachment.setFileName(aReportName);
				attachment.setFileType(ClinicConstant.CONTENT_TYPE_PDF);
				attachment.setContent(reportBytes);
				
				caseAttachmentDao.saveAttachment(attachment);
				
				logger.info("saveCertAsAttachement(): report is saved. id="+aCaseId+"&reportName="+aReportName);
			}			

		}catch(Exception e) {
			logger.error("saveCertAsAttachement(): general exception!",e);
		}	
	}
	
	private void saveReportAsAttachement(String aReportName, Long aCaseId, boolean isEng, boolean needMedicList, String aUsername) {
		try {
			logger.info("saveReportAsAttachement(): id="+aCaseId+"&reportName="+aReportName);
			
			if(aCaseId != null && aReportName != null) {
				Cases thisCase = this.casesDao.getCaseById(aCaseId);
				
				ReportVo reportVo = this.reportService.getReport(thisCase, isEng, needMedicList, aUsername, new Date());
				
				byte[] reportBytes = this.reportService.generatePDFReport(reportVo, aReportName);
				
				logger.info("saveReportAsAttachement(): report is generated");
				
				Integer fileId= this.caseAttachmentDao.getNextFileId();
				logger.info("receiveCaseAttachment: get fileId="+fileId);
				
				CaseAttachment attachment = new CaseAttachment();
				attachment.setFileId(fileId);
				attachment.setCaseId(aCaseId.intValue());
				attachment.setFileName(aReportName);
				attachment.setFileType(ClinicConstant.CONTENT_TYPE_PDF);
				attachment.setContent(reportBytes);
				
				caseAttachmentDao.saveAttachment(attachment);
				
				logger.info("saveReportAsAttachement(): report is saved. id="+aCaseId+"&reportName="+aReportName);
			}			

		}catch(Exception e) {
			logger.error("saveReportAsAttachement(): general exception!",e);
		}	
	}	
}