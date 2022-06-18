package com.clinic.web;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.clinic.web.constant.ClinicConstant;
import com.clinic.web.dao.StatisticDao;
import com.clinic.web.form.SelectStatisticForm;
import com.clinic.web.util.DateUtil;
import com.clinic.web.vo.CaseAgeStat;
import com.clinic.web.vo.CaseEffectVo;
import com.clinic.web.vo.CaseGenderStat;
import com.clinic.web.vo.CaseStat;
import com.clinic.web.vo.GenderStat;
import com.clinic.web.vo.MedicStat;
import com.clinic.web.vo.PriceStat;

@RequestMapping(value = {"/stat"})
@Controller
public class StatisticController {
	private static final Logger logger = LoggerFactory.getLogger(StatisticController.class);
	
	// Dao
	@Resource
	private StatisticDao statisticDao;
	
	@Autowired
	@Qualifier("selectStatisticFormValidator")
	private Validator selectStatisticFormValidator;	
	
	@RequestMapping(value = {"/effect"}, method = RequestMethod.GET)
	public String effectStat(ModelMap model,@RequestParam("custId")Long aCustomerID, @RequestParam("type")String aType, HttpServletRequest request) {
		try {
			List<CaseEffectVo> effects = this.statisticDao.getEffectByType(aCustomerID, aType);
			
			if(effects == null || effects.size()==0) {
				return "noresult";
			}
			
			//Prepare highchart list
			List<List<CaseEffectVo>> effect2DList = new ArrayList<List<CaseEffectVo>>();
			
			boolean reset = false;
			List<CaseEffectVo> tempList = new ArrayList<CaseEffectVo>();
			for(CaseEffectVo effect: effects) {			
				if(effect.getReset()) {
					//Reset
					if(tempList.size()>0) {
						effect2DList.add(tempList);
						tempList = new ArrayList<CaseEffectVo>();					
					}
					tempList.add(effect);
				}
				else {
					tempList.add(effect);
				}
			}
			effect2DList.add(tempList);
			
			//Get latest 8 groups
			if(effect2DList.size()>ClinicConstant.DEFAULT_STATISTIC_GROUP) {
				effect2DList = effect2DList.subList(effect2DList.size()-ClinicConstant.DEFAULT_STATISTIC_GROUP, effect2DList.size());
			}
			
			model.addAttribute("effectList", effect2DList);
			model.addAttribute("custId", aCustomerID);
			model.addAttribute("type", aType);

		}catch(Exception e) {
			logger.error("effectStat(): general exception!",e);
			return "error";
		}
		return "/statistic/effect";
	}
	
	@RequestMapping(value = {"/medic"}, method = RequestMethod.GET)
	public String medicstat(ModelMap model, HttpServletRequest request) {
		try {
			List<MedicStat> stats = statisticDao.getTopMedic(ClinicConstant.DEFAULT_STATISTIC_PERIOD, ClinicConstant.MEDIC_TYPE);
			
			if(stats == null || stats.size()==0) {
				//return "noresult";
				model.addAttribute("noresult",true);
			}
			else {
				model.addAttribute("noresult",false);
				model.addAttribute("title", "十大常用"+ClinicConstant.MEDIC_TYPE);
				model.addAttribute("type", ClinicConstant.MEDIC_TYPE);
				model.addAttribute("path",request.getContextPath()+"/stat/medic");
				
				model.addAttribute("statList", stats);
			}
			
			//New selectStatisticForm
			SelectStatisticForm form = new SelectStatisticForm();
			
			Date today = DateUtil.getTodayWithoutTime();
			form.setEndDate(today);
			form.setEndDateStr(DateUtil.format(today));
			Date startDate = DateUtil.getMonthBefore(today, ClinicConstant.DEFAULT_STATISTIC_PERIOD);
			form.setStartDate(startDate);
			form.setStartDateStr(DateUtil.format(startDate));		
			
			form.setType(ClinicConstant.MEDIC_TYPE);
			model.addAttribute("selectStatisticForm", form);
		}catch(Exception e) {
			logger.error("medicstat(): general exception!",e);
			return "error";
		}		
		
		return "/statistic/medicine";
	}
	
	@RequestMapping(value = {"/medic"}, method = RequestMethod.POST)
	public String medicstatPost(ModelMap model, @ModelAttribute("selectStatisticForm")SelectStatisticForm form, BindingResult errors){
		try {
			selectStatisticFormValidator.validate(form, errors);
	
			if (errors.getErrorCount() > 0) {
				model.addAttribute("noresult",true);
				
				return "/statistic/medicine";
			}

			Date startDate = DateUtil.parseDate(form.getStartDateStr());
			Date endDate = DateUtil.parseDate(form.getEndDateStr());
			
			List<MedicStat> stats = statisticDao.getTopMedicByRange(form.getType(), startDate, endDate);
			
			if(stats == null || stats.size()==0) {
				model.addAttribute("noresult",true);
			}
			else {
				model.addAttribute("noresult",false);
				model.addAttribute("title", "十大常用"+form.getType());
				model.addAttribute("type", form.getType());				
				
				model.addAttribute("statList", stats);
			}
			
		}catch(ParseException e) {
			logger.error("Unable to parse input dates", e);
		}catch(Exception e) {
			logger.error("medicstatPost(): general exception!",e);
			return "error";
		}			

		return "/statistic/medicine";
	}
	
	@RequestMapping(value = {"/demo"}, method = RequestMethod.GET)
	public String demo(ModelMap model) {
		
		return "/statistic/demo";
	}
	
	@RequestMapping(value = {"/price"}, method = RequestMethod.GET)
	public String pricestat(ModelMap model) {
		try {
			Date today = DateUtil.getTodayWithoutTime();
			Date startDate = DateUtil.getMonthBefore(today, ClinicConstant.DEFAULT_STATISTIC_PERIOD);
			
			List<PriceStat> stats = statisticDao.getPriceStatByRange(startDate, today, Calendar.WEEK_OF_YEAR);
			
			if(stats == null || stats.size()==0) {
				model.addAttribute("noresult",true);
			}
			else {
				model.addAttribute("noresult",false);
			}
			
			//New selectStatisticForm
			SelectStatisticForm form = new SelectStatisticForm();
			form.setEndDate(today);
			form.setEndDateStr(DateUtil.format(today));			
			form.setStartDate(startDate);
			form.setStartDateStr(DateUtil.format(startDate));
			form.setInterval(Calendar.WEEK_OF_YEAR);
			
			model.addAttribute("selectStatisticForm", form);		
			model.addAttribute("statList", stats);
		}catch(Exception e) {
			logger.error("casestat(): general exception!",e);
			return "error";
		}
		
		return "/statistic/price";
	}
	
	@RequestMapping(value = {"/price"}, method = RequestMethod.POST)
	public String pricestatPost(ModelMap model,@ModelAttribute("selectStatisticForm")SelectStatisticForm form, BindingResult errors) {
		try {
			this.selectStatisticFormValidator.validate(form, errors);
			
			if (errors.getErrorCount() > 0) {
				model.addAttribute("noresult",true);
				
				return "/statistic/price";
			}

			Date startDate = DateUtil.parseDate(form.getStartDateStr());
			Date endDate = DateUtil.parseDate(form.getEndDateStr());
			
			int interval = form.getInterval();
			if(interval == Calendar.MONTH || interval == Calendar.DAY_OF_YEAR) {				
			}
			else {
				interval = Calendar.WEEK_OF_YEAR;
			}
			
			List<PriceStat> stats = statisticDao.getPriceStatByRange(startDate, endDate, interval);
			
			if(stats == null || stats.size()==0) {
				model.addAttribute("noresult",true);
			}
			else {
				model.addAttribute("noresult",false);
				model.addAttribute("statList", stats);
			}
		}catch(ParseException e) {
			logger.error("Unable to parse input dates", e);
		}catch(Exception e) {
			logger.error("pricestatPost(): general exception!",e);
			return "error";
		}
		
		return "/statistic/price";
	}
	
	@RequestMapping(value = {"/case"}, method = RequestMethod.GET)
	public String casestat(ModelMap model) {
		try {
			List<CaseStat> stats = statisticDao.getCaseStatByWeek(ClinicConstant.DEFAULT_STATISTIC_PERIOD);
			
			if(stats == null || stats.size()==0) {
				model.addAttribute("noresult",true);
			}
			else {
				model.addAttribute("noresult",false);
			}
			
			//New selectStatisticForm
			SelectStatisticForm form = new SelectStatisticForm();
			
			Date today = DateUtil.getTodayWithoutTime();
			form.setEndDate(today);
			form.setEndDateStr(DateUtil.format(today));
			Date startDate = DateUtil.getMonthBefore(today, ClinicConstant.DEFAULT_STATISTIC_PERIOD);
			form.setStartDate(startDate);
			form.setStartDateStr(DateUtil.format(startDate));
			form.setInterval(Calendar.WEEK_OF_YEAR);
			
			model.addAttribute("selectStatisticForm", form);		
			model.addAttribute("statList", stats);
		}catch(Exception e) {
			logger.error("casestat(): general exception!",e);
			return "error";
		}
		
		return "/statistic/case";
	}
	
	@RequestMapping(value = {"/case"}, method = RequestMethod.POST)
	public String casestatPost(ModelMap model,@ModelAttribute("selectStatisticForm")SelectStatisticForm form, BindingResult errors) {
		try {
			this.selectStatisticFormValidator.validate(form, errors);
			
			if (errors.getErrorCount() > 0) {
				model.addAttribute("noresult",true);
				
				return "/statistic/case";
			}

			Date startDate = DateUtil.parseDate(form.getStartDateStr());
			Date endDate = DateUtil.parseDate(form.getEndDateStr());
			
			int interval = form.getInterval();
			if(interval == Calendar.MONTH || interval == Calendar.DAY_OF_YEAR) {				
			}
			else {
				interval = Calendar.WEEK_OF_YEAR;
			}
			
			List<CaseStat> stats = statisticDao.getCaseStatByRange(startDate,endDate,interval);
			
			if(stats == null || stats.size()==0) {
				model.addAttribute("noresult",true);
			}
			else {
				model.addAttribute("noresult",false);
				model.addAttribute("statList", stats);
			}
		}catch(ParseException e) {
			logger.error("Unable to parse input dates", e);
		}catch(Exception e) {
			logger.error("casestatPost(): general exception!",e);
			return "error";
		}
		
		return "/statistic/case";
	}
	
	@RequestMapping(value = {"/casegender"}, method = RequestMethod.GET)
	public String caseGenderstat(ModelMap model) {
		try {			
			//New selectStatisticForm
			SelectStatisticForm form = new SelectStatisticForm();
			
			Date today = DateUtil.getTodayWithoutTime();
			form.setEndDate(today);
			form.setEndDateStr(DateUtil.format(today));
			Date startDate = DateUtil.getMonthBefore(today, ClinicConstant.DEFAULT_STATISTIC_PERIOD);
			form.setStartDate(startDate);
			form.setStartDateStr(DateUtil.format(startDate));
			form.setInterval(Calendar.WEEK_OF_YEAR);
			
			List<CaseGenderStat> stats = statisticDao.getCaseGenderStatByRange(startDate, today,Calendar.WEEK_OF_YEAR);
			
			if(stats == null || stats.size()==0) {
				model.addAttribute("noresult",true);
			}
			else {
				model.addAttribute("noresult",false);
			}
			
			model.addAttribute("selectStatisticForm", form);		
			model.addAttribute("statList", stats);
		}catch(Exception e) {
			logger.error("casestat(): general exception!",e);
			return "error";
		}
		
		return "/statistic/casegender";
	}
	
	@RequestMapping(value = {"/casegender"}, method = RequestMethod.POST)
	public String caseGenderStatPost(ModelMap model,@ModelAttribute("selectStatisticForm")SelectStatisticForm form, BindingResult errors) {
		try {
			this.selectStatisticFormValidator.validate(form, errors);
			
			if (errors.getErrorCount() > 0) {
				model.addAttribute("noresult",true);
				
				return "/statistic/casegender";
			}

			Date startDate = DateUtil.parseDate(form.getStartDateStr());
			Date endDate = DateUtil.parseDate(form.getEndDateStr());
			
			int interval = form.getInterval();
			if(interval == Calendar.MONTH || interval == Calendar.DAY_OF_YEAR) {				
			}
			else {
				interval = Calendar.WEEK_OF_YEAR;
			}
			
			List<CaseGenderStat> stats = statisticDao.getCaseGenderStatByRange(startDate, endDate,interval);
			
			if(stats == null || stats.size()==0) {
				model.addAttribute("noresult",true);
			}
			else {
				model.addAttribute("noresult",false);
				model.addAttribute("statList", stats);
			}
		}catch(ParseException e) {
			logger.error("Unable to parse input dates", e);
		}catch(Exception e) {
			logger.error("caseGenderStatPost(): general exception!",e);
			return "error";
		}
		
		return "/statistic/casegender";
	}
	
	@RequestMapping(value = {"/caseage"}, method = RequestMethod.GET)
	public String caseAgeStat(ModelMap model) {
		try {			
			//New selectStatisticForm
			SelectStatisticForm form = new SelectStatisticForm();
			
			Date today = DateUtil.getTodayWithoutTime();
			form.setEndDate(today);
			form.setEndDateStr(DateUtil.format(today));
			Date startDate = DateUtil.getMonthBefore(today, ClinicConstant.DEFAULT_STATISTIC_PERIOD);
			form.setStartDate(startDate);
			form.setStartDateStr(DateUtil.format(startDate));
			form.setInterval(Calendar.WEEK_OF_YEAR);
			
			List<CaseAgeStat> stats = statisticDao.getCaseAgeStatByRange(startDate, today,Calendar.WEEK_OF_YEAR);
			
			if(stats == null || stats.size()==0) {
				model.addAttribute("noresult",true);
			}
			else {
				model.addAttribute("noresult",false);
			}
			
			model.addAttribute("selectStatisticForm", form);		
			model.addAttribute("statList", stats);
		}catch(Exception e) {
			logger.error("casestat(): general exception!",e);
			return "error";
		}
		
		return "/statistic/caseage";
	}
	
	@RequestMapping(value = {"/caseage"}, method = RequestMethod.POST)
	public String caseAgeStatPost(ModelMap model,@ModelAttribute("selectStatisticForm")SelectStatisticForm form, BindingResult errors) {
		try {
			this.selectStatisticFormValidator.validate(form, errors);
			
			if (errors.getErrorCount() > 0) {
				model.addAttribute("noresult",true);
				
				return "/statistic/caseage";
			}

			Date startDate = DateUtil.parseDate(form.getStartDateStr());
			Date endDate = DateUtil.parseDate(form.getEndDateStr());
			
			int interval = form.getInterval();
			if(interval == Calendar.MONTH || interval == Calendar.DAY_OF_YEAR) {				
			}
			else {
				interval = Calendar.WEEK_OF_YEAR;
			}
			
			List<CaseAgeStat> stats = statisticDao.getCaseAgeStatByRange(startDate, endDate, interval);
			
			if(stats == null || stats.size()==0) {
				model.addAttribute("noresult",true);
			}
			else {
				model.addAttribute("noresult",false);
				model.addAttribute("statList", stats);
			}
		}catch(ParseException e) {
			logger.error("Unable to parse input dates", e);
		}catch(Exception e) {
			logger.error("caseAgeStatPost(): general exception!",e);
			return "error";
		}
		
		return "/statistic/caseage";
	}
	
	@RequestMapping(value = {"/gender"}, method = RequestMethod.GET)
	public String gender(ModelMap model) {
		try {
			GenderStat stat = statisticDao.getGenderStat();
			
			BigDecimal total = new BigDecimal(stat.getMale()+stat.getFemale()+stat.getOther());
			BigDecimal male =  (new BigDecimal(stat.getMale())).divide(total, 3, RoundingMode.HALF_UP).movePointRight(2);		
			BigDecimal female =  (new BigDecimal(stat.getFemale())).divide(total, 3, RoundingMode.HALF_UP).movePointRight(2);
			BigDecimal other =  (new BigDecimal(stat.getOther())).divide(total, 3, RoundingMode.HALF_UP).movePointRight(2);
			
			model.addAttribute("male", male);
			model.addAttribute("female", female);
			model.addAttribute("other", other);
			
			model.addAttribute("maleNo", stat.getMale());
			model.addAttribute("femaleNo", stat.getFemale());
			model.addAttribute("otherNo", stat.getOther());
			
		}catch(Exception e) {
			logger.error("gender(): general exception!",e);
			return "error";
		}		
		return "/statistic/gender";
	}
}
