package com.clinic.web;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.clinic.web.dao.CasesDao;
import com.clinic.web.entity.Cases;
import com.clinic.web.form.CaseAccessRightForm;
import com.clinic.web.service.AccessControlService;
import com.clinic.web.service.AccessControlServiceImpl;

import org.springframework.security.core.userdetails.UserDetails;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private CasesDao casesDao;
	
	//private List<String> userList = null;
	
	private static final String SEARCH_TYPE = "search";
	private static final String VIEW_TYPE = "view";
	private static final String EDIT_TYPE = "edit";
	
	// Service
	private AccessControlService accessControlService;
	
	@RequestMapping(value = {"/access"}, method = RequestMethod.POST)
	public String editAccessRightForCase(Locale locale, Model model,@ModelAttribute("caseAccessRightForm") CaseAccessRightForm aCaseAccessRightForm
			, SecurityContextHolder aSecurityContextHolder) {
		
		Long caseId = aCaseAccessRightForm.getCaseID();
		Cases cases = this.casesDao.getCaseById(caseId);
		
		//Access control check
		boolean pass = this.accessControlService.checkEditCaseEditPage(cases, aSecurityContextHolder);
		if(!pass){
			return "redirect:/accessDenied";
		}
		
		//Case not found
		if(cases == null){
			return "/error";
		}
		
		String type = aCaseAccessRightForm.getAccessRightType();
		String newUser = aCaseAccessRightForm.getNewUser();
		
		logger.info("editAccessRightForCase(): enter access right page of case with id="+caseId+" type="+type+" ,newUser="+newUser);
		
		List<String> userList = this.accessControlService.getUsername();
		
		if(type == null || newUser == null || newUser.isEmpty() || (!AccessControlServiceImpl.ALL_USER.equalsIgnoreCase(newUser) && !userList.contains(newUser))){
			return "/error";
		}
		
		if(SEARCH_TYPE.equalsIgnoreCase(type)){
			String searchRight = cases.getSearchRight();
			if(searchRight != null && (searchRight.equalsIgnoreCase(newUser) || searchRight.contains(AccessControlServiceImpl.RIGHT_DELIMITOR+newUser))){
				//Duplicate user
				logger.error("editAccessRightForCase(): adding user="+newUser+" to caseId="+caseId+" is duplicated in search right!");
			}
			else if(searchRight != null && AccessControlServiceImpl.ALL_USER.equalsIgnoreCase(searchRight)){
				if(aCaseAccessRightForm.isSearchRightAll()){
					//Duplicate user
					logger.error("editAccessRightForCase(): adding user="+newUser+" to caseId="+caseId+" is not required in search right!");
				}
				else{
					//Remove all and add new user
					cases.setSearchRight(newUser);
					this.casesDao.updateCases(cases);
				}
			}
			else if(AccessControlServiceImpl.ALL_USER.equalsIgnoreCase(newUser)){
				cases.setSearchRight(AccessControlServiceImpl.ALL_USER);
				this.casesDao.updateCases(cases);
			}
			else{
				cases.setSearchRight(searchRight+AccessControlServiceImpl.RIGHT_DELIMITOR+newUser);
				this.casesDao.updateCases(cases);
			}
		}
		else if(VIEW_TYPE.equalsIgnoreCase(type)){
			String viewRight = cases.getViewRight();
			if(viewRight != null && viewRight.equalsIgnoreCase(newUser) || viewRight.contains(AccessControlServiceImpl.RIGHT_DELIMITOR+newUser)){
				//Duplicate user
				logger.error("editAccessRightForCase(): adding user="+newUser+" to caseId="+caseId+" is duplicated in view right!");
			}
			else if(viewRight != null && AccessControlServiceImpl.ALL_USER.equalsIgnoreCase(viewRight)){
				if(aCaseAccessRightForm.isViewRightAll()){
					//Duplicate user
					logger.error("editAccessRightForCase(): adding user="+newUser+" to caseId="+caseId+" is not required in view right!");
				}
				else{
					//Remove all and add new user
					cases.setViewRight(newUser);
					this.casesDao.updateCases(cases);
					
					logger.info("editAccessRightForCase(): remove ALL and set user="+newUser+" to view right");
				}
			}
			else if(AccessControlServiceImpl.ALL_USER.equalsIgnoreCase(newUser)){
				cases.setViewRight(AccessControlServiceImpl.ALL_USER);
				this.casesDao.updateCases(cases);
			}			
			else{
				cases.setViewRight(viewRight+AccessControlServiceImpl.RIGHT_DELIMITOR+newUser);
				this.casesDao.updateCases(cases);
			}
		}
		else if(EDIT_TYPE.equalsIgnoreCase(type)){
			String editRight = cases.getEditRight();
			if(editRight != null && editRight.equalsIgnoreCase(newUser) || editRight.contains(AccessControlServiceImpl.RIGHT_DELIMITOR+newUser)){
				//Duplicate user
				logger.error("editAccessRightForCase(): adding user="+newUser+" to caseId="+caseId+" is duplicated in edit right!");
			}
			else if(editRight != null && AccessControlServiceImpl.ALL_USER.equalsIgnoreCase(editRight)){				
				if(aCaseAccessRightForm.isEditRightAll()){
					//Duplicate user
					logger.error("editAccessRightForCase(): adding user="+newUser+" to caseId="+caseId+" is not required in edit right!");
				}
				else{
					//Remove all and add new user
					cases.setEditRight(newUser);
					this.casesDao.updateCases(cases);
				}
			}			
			else if(AccessControlServiceImpl.ALL_USER.equalsIgnoreCase(newUser)){
				cases.setEditRight(AccessControlServiceImpl.ALL_USER);
				this.casesDao.updateCases(cases);
			}
			else{
				cases.setEditRight(editRight+AccessControlServiceImpl.RIGHT_DELIMITOR+newUser);
				this.casesDao.updateCases(cases);
			}
		}		
		
		this.enterAccessPage(model, cases);
		
		return "/case/accessRight";
	}
	
	@RequestMapping(value = {"/access"}, method = RequestMethod.GET)
	public String accessRightForCase(Locale locale, Model model,@RequestParam("id") Long aCaseId,SecurityContextHolder aSecurityContextHolder) {
		model.addAttribute("user", getPrincipal());
		
		logger.info("accessRightForCase(): enter access right page of case with id="+aCaseId);
		Cases cases = this.casesDao.getCaseById(aCaseId);
		
		//Access control check
		boolean pass = this.accessControlService.checkViewCaseEditPage(cases, aSecurityContextHolder);
		if(!pass){
			return "redirect:/accessDenied";
		}
		
		//Case not found
		if(cases == null){
			return "redirect:/accessDenied";
		}
		
		this.enterAccessPage(model, cases);
		
		return "/case/accessRight";
	}
	
	private void enterAccessPage( Model model, Cases cases){
		String searchRight = cases.getSearchRight();
		String viewRight = cases.getViewRight();
		String editRight = cases.getEditRight();
		
		CaseAccessRightForm arForm = new CaseAccessRightForm();
		arForm.setCaseID(cases.getCaseID());
		arForm.setCreateTime(cases.getCreateTime());
		arForm.setCustomerID(cases.getCustomerID());
		
		if(searchRight != null){
			if(searchRight.contains(AccessControlServiceImpl.ALL_USER)){
				arForm.setSearchRightAll(true);
				arForm.setSearchRightList(new ArrayList<String>());
			}
			else{
				arForm.setSearchRightAll(false);
				String [] rightList = searchRight.split(AccessControlServiceImpl.RIGHT_DELIMITOR);				
				arForm.setSearchRightList(new ArrayList<String>(Arrays.asList(rightList)));
			}
			logger.info("searchRight="+searchRight);
		}
		else{
			logger.error("accessRightForCase(): unable to find searchRight for caseID="+cases.getCaseID());
		}
		if(viewRight != null){
			if(viewRight.contains(AccessControlServiceImpl.ALL_USER)){
				arForm.setViewRightAll(true);
				arForm.setViewRightList(new ArrayList<String>());
			}
			else{
				arForm.setViewRightAll(false);
				String [] rightList = viewRight.split(AccessControlServiceImpl.RIGHT_DELIMITOR);				
				arForm.setViewRightList(new ArrayList<String>(Arrays.asList(rightList)));
			}
		}
		else{
			logger.error("accessRightForCase(): unable to find viewRight for caseID="+cases.getCaseID());
		}
		if(editRight != null){
			if(editRight.contains(AccessControlServiceImpl.ALL_USER)){
				arForm.setEditRightAll(true);
				arForm.setEditRightList(new ArrayList<String>());
			}
			else{
				arForm.setEditRightAll(false);
				String [] rightList = editRight.split(AccessControlServiceImpl.RIGHT_DELIMITOR);				
				arForm.setEditRightList(new ArrayList<String>(Arrays.asList(rightList)));
			}
		}
		else{
			logger.error("accessRightForCase(): unable to find editRight for caseID="+cases.getCaseID());
		}
		
		model.addAttribute("caseAccessRightForm", arForm);
		
		List<String> userList = this.accessControlService.getUsername();
		model.addAttribute("userList", userList);		
		
		model.addAttribute("caseID", arForm.getCaseID());
	}
	
	@RequestMapping(value = {"/accessDenied"}, method = RequestMethod.POST)
	public String accessDenied(Locale locale, Model model) {		
		model.addAttribute("user", getPrincipal());
		
		return "/admin/accessDenied";
	}
	
	@RequestMapping(value = {"/accessDenied"}, method = RequestMethod.GET)
	public String accessDeniedGET(Locale locale, Model model) {
		model.addAttribute("user", getPrincipal());
		
		return "/admin/accessDenied";
	}
	
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(Locale locale,Model model) {
    	logger.info("User: " +getPrincipal()+" login successfully.");
    	Thread.currentThread().setPriority(Thread.MAX_PRIORITY);
    	
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		Map<String, String> env = System.getenv();
		List<String> valueList = new ArrayList<String>(env.values());
		List<String> keyList = new ArrayList<String>(env.keySet());
		
		
        for (String envName : env.keySet()) {
            System.out.format("%s=%s%n",
                              envName,
                              env.get(envName));
        }
        
        model.addAttribute("keyList", keyList);
        model.addAttribute("valueList", valueList);
        
        return "/admin/admin";
    }    
    
    @RequestMapping(value = "/admin/refresh", method = RequestMethod.POST)
    public String refreshPage(Model model) {    	
    	logger.info("User: " +getPrincipal()+" refresh admin page");
    	Thread.currentThread().setPriority(Thread.MAX_PRIORITY);
    	
        return "redirect:/admin";
    }

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String loginPage (HttpServletRequest request, HttpServletResponse response) {
       logger.info("Login page is loaded.");
       
       return "/admin/login";
    }
 
    @RequestMapping(value="/logout", method = RequestMethod.GET)
       public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
    	logger.info("User: " +getPrincipal()+" logout.");
    	
         Authentication auth = SecurityContextHolder.getContext().getAuthentication();
         if (auth != null){    
            new SecurityContextLogoutHandler().logout(request, response, auth);
         }
          
          return "redirect:/login?logout";
       }
    
    @RequestMapping(value = "errors", method = RequestMethod.GET)
    public String renderErrorPage(Model model, HttpServletRequest httpRequest) {
        String errorMsg = "";
        int httpErrorCode = getErrorCode(httpRequest);
        
        Throwable throwable = (Throwable) httpRequest.getAttribute("javax.servlet.error.exception");
        String exceptionMessage = getExceptionMessage(throwable, httpErrorCode);
 
        switch (httpErrorCode) {
            case 400: {
                errorMsg = "Http Error Code: 400. Bad Request";
                break;
            }
            case 401: {
                errorMsg = "Http Error Code: 401. Unauthorized";
                break;
            }
            case 404: {
                errorMsg = "Http Error Code: 404. Resource not found";
                break;
            }
            case 500: {
                errorMsg = "Http Error Code: 500. Internal Server Error";
                break;
            }
        }        
        
        model.addAttribute("errorMsg", errorMsg);
        model.addAttribute("exceptionMessage", exceptionMessage);
        
        return "error";
    }
    
    private int getErrorCode(HttpServletRequest httpRequest) {
        return (Integer) httpRequest
          .getAttribute("javax.servlet.error.status_code");
    }
    
    private String getExceptionMessage(Throwable throwable, Integer statusCode) {
	   	  if (throwable != null) {    	
	   		  return throwable.getCause().getMessage(); 	
	  	  }
	   	  return "";
 	 }

 
    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 
        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

	@Resource
	public void setCasesDao(CasesDao casesDao) {
		this.casesDao = casesDao;
	}

	@Resource
	public void setAccessControlService(AccessControlService accessControlService) {
		this.accessControlService = accessControlService;
	}
}
