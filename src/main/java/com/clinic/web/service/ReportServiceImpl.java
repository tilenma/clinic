package com.clinic.web.service;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.clinic.web.AttachmentController;
import com.clinic.web.constant.ClinicConstant;
import com.clinic.web.dao.CustomersDao;
import com.clinic.web.dao.MedicineDao;
import com.clinic.web.dao.UserDao;
import com.clinic.web.entity.CaseMedicine;
import com.clinic.web.entity.Cases;
import com.clinic.web.entity.Customers;
import com.clinic.web.entity.Medicine;
import com.clinic.web.entity.Users;
import com.clinic.web.util.DateUtil;
import com.clinic.web.util.DrugUtil;
import com.clinic.web.vo.MedicineVo;
import com.clinic.web.vo.ReportVo;
import com.lowagie.text.pdf.PdfWriter;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JRTextField;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfExporterConfiguration;

@Service
public class ReportServiceImpl implements ReportService {
	private static final Logger logger = LoggerFactory.getLogger(ReportService.class);
	
	@Resource
	private String reportLocation;
	
	@Resource
	private CustomersDao customersDao;
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private MedicineDao medicineDao;
	
	@Override
	public byte[] generatePDFReport(ReportVo aReportVo, String aReportName) throws IOException,JRException{
		JasperReport reportTemplate = this.compileReport("report/"+aReportName+".jrxml");		
		if (reportTemplate == null) {
			throw new JRException("Cannot build report from stream");
		}
		reportTemplate.setProperty(JRTextField.PROPERTY_PRINT_KEEP_FULL_TEXT, "true");
		reportTemplate.setProperty(JRTextField.DEFAULT_PDF_ENCODING, "Identity-H");
		
		//Pdf config
		SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
		String title = aReportName.toUpperCase();
		configuration.setMetadataTitle(title);
		configuration.setMetadataKeywords(title);
		configuration.setMetadataAuthor(ClinicConstant.RPT_AUTHOR);
		configuration.setMetadataSubject(ClinicConstant.RPT_SUBJECT);
		configuration.setMetadataCreator(ClinicConstant.RPT_CREATOR);
		configuration.setPermissions(PdfWriter.ALLOW_COPY | PdfWriter.ALLOW_PRINTING);
		configuration.setCompressed(true);
		
		//Set report parameters
		Map<String, Object> parameters = new HashMap<String, Object>();		
		this.setReportParmeters(parameters, aReportVo);
					
		//byte[] reportBytes = JasperRunManager.runReportToPdf(reportTemplate, parameters);
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(reportTemplate, parameters, new JREmptyDataSource());
		JRPdfExporter exporter = new JRPdfExporter();
		exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(outputStream));
		exporter.setConfiguration(configuration);
		exporter.exportReport();
		
		return outputStream.toByteArray();
	}
	
	@Override
	public void generatePdfReportStream(OutputStream aOutputStream, ReportVo aReportVo, String aReportName) throws IOException,JRException{

		JasperReport reportTemplate = this.compileReport("report/"+aReportName+".jrxml");		
		if (reportTemplate == null) {
			throw new JRException("Cannot build report from stream");
		}
		reportTemplate.setProperty(JRTextField.PROPERTY_PRINT_KEEP_FULL_TEXT, "true");
		reportTemplate.setProperty(JRTextField.DEFAULT_PDF_ENCODING, "Identity-H");
		
		//Pdf config
		SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
		String title = aReportName.toUpperCase();
		configuration.setMetadataTitle(title);
		configuration.setMetadataKeywords(title);
		configuration.setMetadataAuthor(ClinicConstant.RPT_AUTHOR);
		configuration.setMetadataSubject(ClinicConstant.RPT_SUBJECT);
		configuration.setMetadataCreator(ClinicConstant.RPT_CREATOR);
		configuration.setPermissions(PdfWriter.ALLOW_COPY | PdfWriter.ALLOW_PRINTING);
		configuration.setCompressed(true);

		//Set report parameters
		Map<String, Object> parameters = new HashMap<String, Object>();		
		this.setReportParmeters(parameters, aReportVo);
					
		JasperPrint jasperPrint = JasperFillManager.fillReport(reportTemplate, parameters, new JREmptyDataSource());
		JRPdfExporter exporter = new JRPdfExporter();
		exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(aOutputStream));
		exporter.setConfiguration(configuration);
		exporter.exportReport();
	}
	
	/* (non-Javadoc)
	 * @see com.clinic.web.service.ReportService#generateDocxReportStream(java.io.OutputStream, com.clinic.web.vo.ReportVo, java.lang.String)
	 */
	@Override
	public void generateDocxReportStream(OutputStream aOutputStream, ReportVo aReportVo, String aReportName) throws IOException,JRException{		
		JasperReport reportTemplate = this.compileReport("report/"+aReportName+".jrxml");		
		if (reportTemplate == null) {
			throw new JRException("Cannot build report from stream");
		}
		reportTemplate.setProperty(JRTextField.PROPERTY_PRINT_KEEP_FULL_TEXT, "true");
		
		//Set report parameters
		Map<String, Object> parameters = new HashMap<String, Object>();		
		this.setReportParmeters(parameters, aReportVo);
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(reportTemplate, parameters, new JREmptyDataSource());
		JRDocxExporter exporter = new JRDocxExporter();
		exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(aOutputStream));
		exporter.exportReport();
	}
	
	private void setReportParmeters(Map<String, Object> parameters, ReportVo aReportVo) {
		parameters.put(JRParameter.REPORT_LOCALE, ClinicConstant.LOCALE_EN);		
		parameters.put("doctor", aReportVo.getDoctor());
		parameters.put("registerNo", aReportVo.getRegisterNo());
		parameters.put("customerName", aReportVo.getCustomerName());
		parameters.put("sickness", aReportVo.getSickness());
		parameters.put("price", aReportVo.getPrice());			
		parameters.put("dosage", aReportVo.getDosage());
		parameters.put("dosageRemark", aReportVo.getDosageRemark());
		parameters.put("dosageMethod", aReportVo.getDosageMethod());
		parameters.put("dosageRecomment", aReportVo.getDosageRecomment());
		parameters.put("redispense", aReportVo.getRedispense());
		parameters.put("expiryDate", aReportVo.getExpiryDate());
		parameters.put("receiptRemark", aReportVo.getReceiptRemark());
		parameters.put("followupRemark", aReportVo.getFollowupRemark());
		parameters.put("certRemark", aReportVo.getCertRemark());
		parameters.put("reportRemark", aReportVo.getReportRemark());
		parameters.put("date", aReportVo.getDate());
		parameters.put("startDate", aReportVo.getStartDateStr());
		parameters.put("endDate", aReportVo.getEndDateStr());
		parameters.put("noOfDate", aReportVo.getNoOfDate());
		parameters.put("wrappedCaseID", aReportVo.getWrappedCaseID());	
		parameters.put("issueDate", aReportVo.getIssueDate());
		
		if(aReportVo.getMedicines() != null && aReportVo.getMedicines().size() > 0) {
			JRBeanCollectionDataSource aJRDataSource = new JRBeanCollectionDataSource(aReportVo.getMedicines());
			parameters.put("medicineDataSource", aJRDataSource);
		}
	}
	
	@Override
	public ReportVo getReport(Cases aCase, boolean isEng, boolean needMedicList, String aUsername, Date aIssueDate) {
		ReportVo reportVo = new ReportVo();
		reportVo.setCaseID(aCase.getCaseID());		
		reportVo.setCustomerID(aCase.getCustomerID());
		
		//Set customer name
		if(aCase.getCustomerID() != null && aCase.getCustomerID() > 0){
			Customers customer = customersDao.getCustomerById(aCase.getCustomerID());
			
			if(isEng && customer.getNameEN() != null && customer.getNameEN().length()>0) {
				reportVo.setCustomerName(customer.getNameEN());
			}
			else {
				reportVo.setCustomerName(customer.getName());
			}
		}
		//Date time from create date to visit date
		Date addedTimeDate = DateUtil.addTime(aCase.getDate(), DateUtil.formatTime(aCase.getCreateTime()));
		
		reportVo.setDate(addedTimeDate);
		reportVo.setDosage(aCase.getDosage());
		reportVo.setDosageMethod(aCase.getDosageMethod());
		reportVo.setDosageRecomment(aCase.getDosageRecomment());
		reportVo.setDosageRemark(aCase.getDosageRemark());
		reportVo.setPrice(aCase.getPrice());
		reportVo.setRedispense(aCase.getRedispense());
		reportVo.setExpiryDate(aCase.getExpiryDate());
		reportVo.setDiagnosis(aCase.getDiagnosis());
		reportVo.setSickness(aCase.getSickness());
		reportVo.setFollowupRemark(aCase.getFollowupRemark());
		reportVo.setReceiptRemark(aCase.getReceiptRemark());
		reportVo.setCertRemark(aCase.getCertRemark());
		reportVo.setReportRemark(aCase.getReportRemark());
		
		if(aIssueDate != null) {
			reportVo.setIssueDate(aIssueDate);
		}
		else {
			reportVo.setIssueDate(new Date());
		}
		
		//Set doctor information
		//Use first user with edit right instead of login user
		String reportUsername = aUsername; //login user
		String editRight = aCase.getEditRight();
		if(!editRight.isEmpty() && editRight.length()>0 && AccessControlServiceImpl.ALL_USER.compareToIgnoreCase(editRight)!=0) {
			//editRight is not empty nor all user
			reportUsername = editRight.split(AccessControlServiceImpl.RIGHT_DELIMITOR)[0];
		}
		else {
			logger.warn("getReport(): Unable to get report name from edit right of case id="+aCase.getCaseID()+"! Use login username="+aUsername);
		}
		this.setReportDocInfo(reportVo, isEng, reportUsername);
		
		if(needMedicList) {			
			List<MedicineVo> medicines = this.convertMedicines(aCase);
			reportVo.setMedicines(medicines);
		}
		
		reportVo.setWrappedCaseID(DateUtil.formatTime(aCase.getCreateTime()));
		
		return reportVo;
	}
	
	public List<MedicineVo> convertMedicines(Cases aCase){
		List<MedicineVo> medicList = new ArrayList<MedicineVo>();
		
		if(aCase.getMedicines() != null){	
			MedicineVo medicineVo = null;
			logger.info("convertMedicines(): Case ID="+aCase.getCaseID()+" with medic list size="+aCase.getMedicinesList().size());
			
			for(CaseMedicine medic: aCase.getMedicinesList()){
				
				medicineVo = new MedicineVo();
				medicineVo.setName(medic.getName());
				medicineVo.setType(medic.getType());
				medicineVo.setUnit(medic.getUnit());
				medicineVo.setUnit2(medic.getUnit2());
				medicineVo.setRemark(medic.getRemark());
				
				Medicine codedMedic = null;
				if(DrugUtil.isDrug(medic.getType()) || DrugUtil.isPoint(medic.getType()) || DrugUtil.isFormula(medic.getType())){
					logger.debug("convertMedicines(): Search by name="+medic.getName().trim());
					codedMedic = this.medicineDao.searchMedicineByExactName(medic.getName().trim());	
				}
				else{
					logger.debug("convertMedicines(): Search by type="+medic.getType().trim());
					codedMedic = this.medicineDao.searchMedicineByExactName(medic.getType().trim());
				}
				
				if(codedMedic != null){
					logger.debug("convertMedicines(): Set code ="+codedMedic.getCode()+" and barcode="+codedMedic.getBarcode());
					medicineVo.setCode(codedMedic.getCode());
					medicineVo.setBarCode(codedMedic.getBarcode());
					medicineVo.setOrder(codedMedic.getOrder());
					medicineVo.setContent(codedMedic.getContent());
						
					if(DrugUtil.isFormula(medic.getType())){
						logger.debug("convertMedicines(): isFormula so set details");
						medicineVo.setDetailEN(codedMedic.getDetailEN());
						medicineVo.setDetailCH(codedMedic.getDetailCH());
					}
				}
				else{
					logger.warn("convertMedicines(): Unable to find medicine for name="+medic.getName().trim()+" and type="+medic.getType().trim());
				}				
				medicList.add(medicineVo);
			}			
			Collections.sort(medicList);
		}
		
		return medicList;
	}
	
	private void setReportDocInfo(ReportVo aReportVo, boolean isEng, String aUsername) {
		Users thisUser = this.userDao.getUserByName(aUsername);
		
		if(thisUser != null) {
			if(isEng) {
				String name = thisUser.getReportNameEN();
				if(name != null && name.length()>0) {
					aReportVo.setDoctor(name);
				}
				else {
					logger.error("setReportDocInfo(): English report name is empty for username="+aUsername+" !Use default name="+ClinicConstant.DEFAULT_DOCTER_EN);
					aReportVo.setDoctor(ClinicConstant.DEFAULT_DOCTER_EN);
				}
			}
			else {
				String name = thisUser.getReportName();				
				if(name!= null && name.length()>0) {
					aReportVo.setDoctor(name);
				}
				else {
					logger.error("setReportDocInfo(): Chinese report name is empty for username="+aUsername+" !Use default name="+ClinicConstant.DEFAULT_DOCTER);
					aReportVo.setDoctor(ClinicConstant.DEFAULT_DOCTER);
				}
			}
			String registerNo = thisUser.getRegisterNo();
			if(registerNo != null && registerNo.length()>0) {
				aReportVo.setRegisterNo(registerNo);
			}
			else {
				logger.error("setReportDocInfo(): Register no is empty for username="+aUsername+" !Use default="+ClinicConstant.DEFAULT_REGISTOR_NO);
				aReportVo.setRegisterNo(ClinicConstant.DEFAULT_REGISTOR_NO);	
			}
		}
		else {
			logger.error("setReportDocInfo(): Unable to get user info! username="+aUsername);
			if(isEng) {
				aReportVo.setDoctor(ClinicConstant.DEFAULT_DOCTER_EN);
			}
			else {
				aReportVo.setDoctor(ClinicConstant.DEFAULT_DOCTER);
			}
			aReportVo.setRegisterNo(ClinicConstant.DEFAULT_REGISTOR_NO);			
			
			logger.error("setReportDocInfo(): Default name and registerNo is used!");			
		}
	}
	
	private JasperReport compileReport(String aReportName) throws JRException,IOException{
		JasperReport jasperReport = null;
		InputStream jrxmlInput = null;
		 
		File customReportFile = new File(this.reportLocation+"/"+aReportName);
		if(customReportFile != null && customReportFile.exists() && customReportFile.canRead()) {
			jrxmlInput = new FileInputStream(customReportFile);
			logger.info("compileReport: using file ="+customReportFile.getAbsolutePath());
		}
		else {		
			logger.info("compileReport: file ="+customReportFile.getAbsolutePath()+" cannot be found.");
			jrxmlInput = JRLoader.getResourceInputStream(aReportName);
		}
		
		if (jrxmlInput != null) {
			JasperDesign design = null;
			try{
				design = JRXmlLoader.load(jrxmlInput);
			}
			finally	{
				jrxmlInput.close();
			}
			jasperReport = JasperCompileManager.compileReport(design);
		}
		return jasperReport;		
	}
}
