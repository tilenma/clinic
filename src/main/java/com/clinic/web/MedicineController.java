package com.clinic.web;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

import com.clinic.web.dao.MedicineDao;
import com.clinic.web.entity.Customers;
import com.clinic.web.entity.Medicine;
import com.clinic.web.form.CustomerForm;
import com.clinic.web.form.MedicineForm;
import com.clinic.web.search.MedicineCriteria;

@SessionAttributes({ "medicineCriteria"})
@Controller
public class MedicineController {
	private static final Logger logger = LoggerFactory
			.getLogger(MedicineController.class);
	
	private static final int DEFAULT_ORDER_NO = 10000; 
	
	private MedicineDao medicineDao;
	
	@Autowired
	@Qualifier("medicineFormValidator")
	private Validator medicineFormValidator;
	
	@InitBinder("medicineForm")
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(medicineFormValidator);
	}
	
	@RequestMapping(value = "/medicine/new", method = RequestMethod.GET)
	public String newMedicine(Locale locale, Model model,HttpServletRequest request) {

		MedicineForm form = new MedicineForm();
		
		model.addAttribute("medicineForm", form);
		
		return "medicine/create";
	}
	
	@RequestMapping(value = "/medicine/new", method = RequestMethod.POST)
	public String validateMedicine(Model model,
			@Valid MedicineForm medicineForm, BindingResult bindingResult) {

		if (bindingResult.getErrorCount() > 0) {
			return "medicine/create";
		} else {
			// Create New Medicine
			Integer medicID = this.medicineDao.getNextMedicineId();
			Medicine medicine = this.transform(medicineForm, medicID);

			logger.info("validateMedicine():Create medicine ID=" + medicID + " and name=" + medicine.getName());
			this.medicineDao.createNewMedicine(medicine);
		}
		
		return "redirect:/";
		//return "home";
	}
	
	private Medicine transform(MedicineForm aMedicineForm, Integer aMedicID) {
		Medicine medicine = new Medicine();
		
		medicine.setId(aMedicID);
		medicine.setBarcode(aMedicineForm.getBarcode());
		medicine.setCode(aMedicineForm.getCode());
		medicine.setContent(aMedicineForm.getContent());
		medicine.setContraint(aMedicineForm.getContraint());
		medicine.setDetailCH(aMedicineForm.getDetailCH());
		medicine.setDetailEN(aMedicineForm.getDetailEN());
		medicine.setEffect(aMedicineForm.getEffect());
		medicine.setMeridian(aMedicineForm.getMeridian());
		medicine.setName(aMedicineForm.getName());
		medicine.setOrder(aMedicID.intValue()+DEFAULT_ORDER_NO);
		medicine.setPriceCategory(aMedicineForm.getPriceCategory());
		medicine.setReferenceUnit(aMedicineForm.getReferenceUnit());
		medicine.setTaste(aMedicineForm.getTaste());
		medicine.setType(aMedicineForm.getType());
		medicine.setUsage(aMedicineForm.getUsage());
		
		return medicine;
	}
	
	@RequestMapping(value = "/medicine", method = RequestMethod.GET)
	public String searchMedicine(Locale locale, Model model,HttpServletRequest request) {
		
		//Check if session contains medicineCriteria
		MedicineCriteria medicineCriteria = (MedicineCriteria)request.getSession().getAttribute("medicineCriteria");		
		
		if(medicineCriteria != null) {
			List<Medicine> resultList = medicineDao.searchMedicine(medicineCriteria);

			logger.info("searchMedicine(): No of medicine="
					+ resultList.size() + " ," + medicineCriteria.getName2());
			model.addAttribute("medicineList", resultList);
			model.addAttribute("medicineCriteria", medicineCriteria);
			model.addAttribute("medicineTotal", resultList.size());
			
			return "medicine/list";
		}
		else {
			medicineCriteria = new MedicineCriteria();

			model.addAttribute("medicineCriteria", medicineCriteria);

			return "medicine/search";
		}	
	}
	
	@RequestMapping(value = "/medicine/select", method = RequestMethod.GET)
	public String selectMedicine(Locale locale, Model model,HttpServletRequest request, @RequestParam("id") String aColumnId) {
		
		//Check if session contains medicineCriteria
		MedicineCriteria medicineCriteria = new MedicineCriteria();
		medicineCriteria.setType2("藥");
			
		List<Medicine> resultList = medicineDao.searchMedicine(medicineCriteria);

		logger.info("searchMedicine(): No of medicine=" + resultList.size() + " ," + medicineCriteria.getName2());
		
		model.addAttribute("medicineList", resultList);
		model.addAttribute("medicineCriteria", medicineCriteria);
		model.addAttribute("medicineTotal", resultList.size());
		model.addAttribute("columnId", aColumnId);
			
		return "medicine/select";
	}
	
	@RequestMapping(value = "/medicine/select2", method = RequestMethod.GET)
	public String selectMedicine2(Locale locale, Model model,HttpServletRequest request, @RequestParam("id") String aColumnId) {
		
		//Check if session contains medicineCriteria
		MedicineCriteria medicineCriteria = new MedicineCriteria();
		medicineCriteria.setType2("方");
			
		List<Medicine> resultList = medicineDao.searchMedicine(medicineCriteria);

		logger.info("selectMedicine2(): No of medicine=" + resultList.size() + " ," + medicineCriteria.getName2());
		
		model.addAttribute("medicineList", resultList);
		model.addAttribute("medicineCriteria", medicineCriteria);
		model.addAttribute("medicineTotal", resultList.size());
		model.addAttribute("columnId", aColumnId);
			
		return "medicine/select";
	}
	
	@RequestMapping(value = "/medicine/select3", method = RequestMethod.GET)
	public String selectMedicine3(Locale locale, Model model,HttpServletRequest request, @RequestParam("id") String aColumnId) {
		
		//Check if session contains medicineCriteria
		MedicineCriteria medicineCriteria = new MedicineCriteria();
		medicineCriteria.setType2("針");
			
		List<Medicine> resultList = medicineDao.searchMedicine(medicineCriteria);

		logger.info("selectMedicine3(): No of medicine=" + resultList.size() + " ," + medicineCriteria.getName2());
		
		model.addAttribute("medicineList", resultList);
		model.addAttribute("medicineCriteria", medicineCriteria);
		model.addAttribute("medicineTotal", resultList.size());
		model.addAttribute("columnId", aColumnId);
			
		return "medicine/select";
	}
	
	@RequestMapping(value = "/medicine", method = RequestMethod.POST)
	public String searchMedicinePost(Locale locale, Model model,
			@Valid MedicineCriteria medicineCriteria,
			BindingResult bindingResult) {

		if (bindingResult.getErrorCount() > 0) {
			return "medicine/search";
		} else {
			List<Medicine> resultList = medicineDao.searchMedicine(medicineCriteria);

			logger.info("searchMedicinePost(): No of medicine="
					+ resultList.size() + " ," + medicineCriteria.getName2());
			model.addAttribute("medicineList", resultList);
			model.addAttribute("medicineCriteria", medicineCriteria);
			model.addAttribute("medicineTotal", resultList.size());

			return "medicine/list";
		}
	}
	
	@RequestMapping(value = "/medicine/edit", params = "code", method = RequestMethod.GET)
	public String editMedicine(Locale locale, Model model, @RequestParam("code") String aCode) {
		Medicine medicine = this.medicineDao.getMedicineByCode(aCode);
		MedicineForm form = this.convert(medicine);
		
		model.addAttribute("medicineForm", form);
		
		return "medicine/edit";
	}
	
	@RequestMapping(value = "/medicine/edit", method = RequestMethod.POST)
	public String editMedicine(Locale locale, Model model,  @ModelAttribute("medicineForm")MedicineForm aMedicineForm
			,@ModelAttribute("medicineCriteria")MedicineCriteria medicineCriteria) {		
		
		Medicine medicine = this.medicineDao.getMedicineByCode(aMedicineForm.getCode());
		
		medicine.setBarcode(aMedicineForm.getBarcode());
		medicine.setCode(aMedicineForm.getCode());
		medicine.setContent(aMedicineForm.getContent());
		medicine.setContraint(aMedicineForm.getContraint());
		medicine.setDetailCH(aMedicineForm.getDetailCH());
		medicine.setDetailEN(aMedicineForm.getDetailEN());
		medicine.setEffect(aMedicineForm.getEffect());
		//medicine.setId(aMedicineForm.getId());
		medicine.setMeridian(aMedicineForm.getMeridian());
		medicine.setName(aMedicineForm.getName());
		//medicine.setOrder(aMedicineForm.getOrder());
		medicine.setPriceCategory(aMedicineForm.getPriceCategory());
		medicine.setReferenceUnit(aMedicineForm.getReferenceUnit());
		medicine.setTaste(aMedicineForm.getTaste());
		medicine.setType(aMedicineForm.getType());
		medicine.setUsage(aMedicineForm.getUsage());
		
		this.medicineDao.updateMedicine(medicine);
		
		return "redirect:/medicine";
	}

	@Resource
	public void setMedicineDao(MedicineDao medicineDao) {
		this.medicineDao = medicineDao;
	}
	
	private MedicineForm convert(Medicine aMedicine) {
		MedicineForm form = new MedicineForm();
		
		form.setBarcode(aMedicine.getBarcode());
		form.setCode(aMedicine.getCode());
		form.setContent(aMedicine.getContent());
		form.setContraint(aMedicine.getContraint());
		form.setDetailCH(aMedicine.getDetailCH());
		form.setDetailEN(aMedicine.getDetailEN());
		form.setEffect(aMedicine.getEffect());
		form.setId(aMedicine.getId());
		form.setMeridian(aMedicine.getMeridian());
		form.setName(aMedicine.getName());
		form.setOrder(aMedicine.getOrder());
		form.setPriceCategory(aMedicine.getPriceCategory());
		form.setReferenceUnit(aMedicine.getReferenceUnit());
		form.setTaste(aMedicine.getTaste());
		form.setType(aMedicine.getType());
		form.setUsage(aMedicine.getUsage());
		
		return form;
		
	}
	
}
