package com.clinic.web.service;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.clinic.web.entity.Cases;
import com.clinic.web.entity.CasesView;

public interface AccessControlService {

	public void setDefaultCreateCaseRight(Cases aCases, SecurityContextHolder aSecurityContextHolder);
	
	public boolean checkViewCaseEditPage(Cases aCases, SecurityContextHolder aSecurityContextHolder);
	public boolean checkViewCaseEditPage(CasesView aCasesView, SecurityContextHolder aSecurityContextHolder);

	public boolean checkEditCaseEditPage(Cases aCases, SecurityContextHolder aSecurityContextHolder);
	
	public boolean checkSearchCase(Cases aCases, SecurityContextHolder aSecurityContextHolder);
	
	public String getLoginUserName(SecurityContextHolder aSecurityContextHolder);
	
	public String getLoginUserName(Authentication aAuthentication);
	
	public boolean isAdmin(Authentication auth);
	
	public boolean checkViewReportPage(Cases aCases, SecurityContextHolder aSecurityContextHolder);
	
	public boolean isOpa(Authentication auth);
	
	public List<CasesView> filterResult(List<CasesView> aCaseViewList, SecurityContextHolder aSecurityContextHolder);
	
	public boolean showAdvancedFunction(Authentication aAuthentication);
	
	public boolean showAdminFunction(Authentication auth);
	
	public List<String> getUsername();
}