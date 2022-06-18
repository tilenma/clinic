package com.clinic.web;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.clinic.web.dao.CaseAttachmentDao;
import com.clinic.web.dao.CasesDao;
import com.clinic.web.entity.CaseAttachment;
import com.clinic.web.entity.Cases;
import com.clinic.web.service.AccessControlService;

@Controller
public class AttachmentController {
	private static final Logger logger = LoggerFactory.getLogger(AttachmentController.class);
	
	@Resource
	private CaseAttachmentDao caseAttachmentDao;
	
	@Resource
	private CasesDao casesDao;
	
	// Service
	@Resource
	private AccessControlService accessControlService;
	
	@RequestMapping(value = "/case/deleteAttach", method = RequestMethod.GET)
	public String deleteCaseAttachment(Locale locale, Model model, @RequestParam("caseId")Integer aCaseId,
			@RequestParam("deleteFileId")Integer aFileId,SecurityContextHolder aSecurityContextHolder) {		
		try {
			CaseAttachment attachment = this.caseAttachmentDao.getAttachment(aFileId);	
			
			//Attachment not found
			if(attachment==null) {
				logger.error("downloadCaseAttachment: attachment cannot be found!");
				
				return "accessDenied";
			}		
			//Case id not match
			else if(aCaseId.intValue() != attachment.getCaseId().intValue()) {
				logger.error("downloadCaseAttachment: attachment id does not match with case id!"+"Requested case id="+aCaseId+" but attachment with caseId="+attachment.getCaseId());
				return "accessDenied";
			}
			else {
				logger.info("deleteCaseAttachment(): delete file with id="+aFileId);
				caseAttachmentDao.deleteAttachment(aFileId);
				
				return "redirect:/case/edit?id=" + aCaseId;
			}
		}catch(Exception e) {
			logger.error("deleteCaseAttachment: Cannot delete attachement with fileId="+aFileId,e);
			return "redirect:/case/edit?id=" + aCaseId;
		}
	}
	
	@RequestMapping(value = "/case/viewAttach", method = RequestMethod.GET)
	public String viewCaseAttachment(Locale locale, Model model, @RequestParam("id")Integer aCaseId
			,HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) {
		
		List<CaseAttachment> attachmentList = this.caseAttachmentDao.getAttachmentList(aCaseId);
		
		try {
			//Attachment not found
			if(attachmentList==null || attachmentList.size() == 0) {
				response.sendRedirect("/accessDenied");
			}		
			else {
				//check access right
				Cases cases = this.casesDao.getCaseById(Long.parseLong(aCaseId.toString()));
				
				//Access control check
				boolean pass = this.accessControlService.checkViewCaseEditPage(cases, aSecurityContextHolder);
				if(!pass){
					response.sendRedirect("/accessDenied");
				}
				
				model.addAttribute("attachmentList", attachmentList);
				model.addAttribute("caseId", aCaseId);
			}
		}catch(IOException e) {
			logger.error("Cannot view attachement of caseId="+aCaseId,e);
		}
		
		return "case/viewAttach";
	}
	
	@RequestMapping(value = "/case/attach", method = RequestMethod.GET)
	public String addCaseAttachment(Locale locale, Model model, @RequestParam("id")Integer aCaseId) {
		
		CaseAttachment attachmentForm = new CaseAttachment();
		
		model.addAttribute("attachmentForm", attachmentForm);
		model.addAttribute("caseId", aCaseId);

		return "case/attach";
	}

	@RequestMapping(value = "/case/doUpload", method = RequestMethod.POST)
	public String receiveCaseAttachment(Model model,@RequestParam("content") MultipartFile content, @RequestParam("caseId")Integer caseId
			, @RequestParam("fileName")String fileName, @RequestParam("fileType")String fileType) {
		logger.info("receiveCaseAttachment: attachment for case="+caseId);
		
		try {
			Integer fileId= this.caseAttachmentDao.getNextFileId();
			logger.info("receiveCaseAttachment: get fileId="+fileId);
			
			CaseAttachment attachment = new CaseAttachment();
			attachment.setFileId(fileId);
			attachment.setCaseId(caseId);
			attachment.setFileName(fileName);
			attachment.setFileType(fileType);
			attachment.setContent(content.getBytes());
			
			caseAttachmentDao.saveAttachment(attachment);
			
			logger.info("receiveCaseAttachment: attachement is added. caseId="+caseId+" fileId="+fileId);
		}catch(IOException e) {
			logger.error("receiveCaseAttachment: Cannot add attachement to caseId="+caseId,e);
		}catch(Exception e) {
			logger.error("receiveCaseAttachment: Cannot add attachement to caseId="+caseId,e);
		}

		return "redirect:/case/edit?id=" + caseId.toString();
	}
	
	@RequestMapping(value = "/case/download", method = RequestMethod.GET)
	public void downloadCaseAttachment(Model model, @RequestParam("caseId")Integer aCaseId, @RequestParam("fileId")Integer aFileId,
			HttpServletResponse response, SecurityContextHolder aSecurityContextHolder) throws IOException{	
		
		CaseAttachment attachment = this.caseAttachmentDao.getAttachment(aFileId);	
		
		//Attachment not found
		if(attachment==null) {
			logger.error("downloadCaseAttachment: attachment cannot be found!");
			response.sendRedirect("/accessDenied");
		}		
		//Case id not match
		else if(aCaseId.intValue() != attachment.getCaseId().intValue()) {
			logger.error("downloadCaseAttachment: attachment id does not match with case id!"+"Requested case id="+aCaseId+" but attachment with caseId="+attachment.getCaseId());
			response.sendRedirect("/accessDenied");
		}
		else {
			logger.info("downloadCaseAttachment: attachment is located. case id="+aCaseId+" and file id="+aFileId);
			//check access right
			Cases cases = this.casesDao.getCaseById(Long.parseLong(aCaseId.toString()));
			
			//Access control check
			boolean pass = this.accessControlService.checkViewCaseEditPage(cases, aSecurityContextHolder);
			if(!pass){
				logger.error("downloadCaseAttachment: unable to pass access control!");
				
				response.sendRedirect("/accessDenied");
				return;
			}
			//Set response header
			response.reset();
			response.setContentType(attachment.getFileType());
			response.setContentLength(attachment.getContent().length);
			response.setHeader("Set-Cookie", "fileDownload=true; path=/");			
			response.addHeader("Content-Disposition","inline; filename=\"" + attachment.getFileName() +"\"");
			
			FileCopyUtils.copy(attachment.getContent(), response.getOutputStream());		
		}		
	}
}
