package com.clinic.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clinic.web.dao.CustomersDao;
import com.clinic.web.dao.MedicineDao;
import com.clinic.web.entity.Customers;
import com.clinic.web.entity.Medicine;
import com.clinic.web.search.CustomerCriteria;
import com.clinic.web.tag.CustomerTag;
import com.clinic.web.tag.MedicineTag;

@Controller
public class LookupController {

	private static final Logger logger = LoggerFactory
			.getLogger(LookupController.class);
	
	// Dao
	private CustomersDao customersDao;
	private MedicineDao medicineDao;
	
	@RequestMapping(value = "/customer/tag", method = RequestMethod.GET)
	public @ResponseBody List<CustomerTag> getCustomerTag(Locale locale,
			Model model, @RequestParam("tagName") String aTagName) {
		logger.info("getCustomerTag(): tag="+aTagName);
		
		List<CustomerTag> tagList = new ArrayList<CustomerTag>();

		if (aTagName != null && aTagName.length() > 0) {
			CustomerCriteria customerCriteria = new CustomerCriteria();
			customerCriteria.setName(aTagName);

			List<Customers> customerList = this.customersDao
					.searchCustomer(customerCriteria);

			CustomerTag tag = null;
			for (Customers cust : customerList) {
				tag = new CustomerTag(cust.getCustomerID(),cust.getNameWithMobile());
				tagList.add(tag);
			}
		}

		return tagList;
	}
	
	@RequestMapping(value = "/medicine/tag", method = RequestMethod.GET)
	public @ResponseBody List<MedicineTag> getMedicineTag(Locale locale,
			Model model, @RequestParam("tagName") String aTagName) {
		logger.info("getMedicineTag(): tag="+aTagName);
		
		List<MedicineTag> tagList = new ArrayList<MedicineTag>();

		if (aTagName != null && aTagName.length() > 0) {
			List<Medicine> medicineList = this.medicineDao.searchMedicineByName(aTagName);

			MedicineTag tag = null;
			if(medicineList != null && medicineList.size() > 0){
				for (Medicine medic : medicineList) {
					if(medic != null){
						tag = new MedicineTag(medic.getId(),medic.getType(),medic.getCode(),medic.getName());
						tagList.add(tag);
					}
				}
			}
		}

		return tagList;
	}

	@Resource
	public void setCustomersDao(CustomersDao customersDao) {
		this.customersDao = customersDao;
	}

	@Resource
	public void setMedicineDao(MedicineDao medicineDao) {
		this.medicineDao = medicineDao;
	}
	
	
}
