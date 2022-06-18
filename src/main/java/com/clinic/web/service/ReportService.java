package com.clinic.web.service;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

import com.clinic.web.entity.Cases;
import com.clinic.web.vo.ReportVo;

import net.sf.jasperreports.engine.JRException;

public interface ReportService {

	void generatePdfReportStream(OutputStream aOutputStream, ReportVo aReportVo, String aReportName)
			throws IOException, JRException;

	void generateDocxReportStream(OutputStream aOutputStream, ReportVo aReportVo, String aReportName)
			throws IOException, JRException;

	byte[] generatePDFReport(ReportVo aReportVo, String aReportName) throws IOException,JRException;
	
	public ReportVo getReport(Cases aCase, boolean isEng, boolean needMedicList, String aUsername, Date aIssueDate);
}