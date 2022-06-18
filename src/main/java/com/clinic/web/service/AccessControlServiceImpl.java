package com.clinic.web.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.clinic.web.dao.UserDao;
import com.clinic.web.entity.Cases;
import com.clinic.web.entity.CasesView;
import com.clinic.web.entity.Users;

@Service
public class AccessControlServiceImpl implements AccessControlService {
	public static final String ALL_USER = "ALL";
	public final String ROLE_ADMIN = "ROLE_ADMIN";
	public final String ROLE_DOC = "ROLE_DOC";
	public final String ROLE_OPA = "ROLE_OPA";
	public static final String RIGHT_DELIMITOR = ";";
	
	private static final Logger logger = LoggerFactory
			.getLogger(AccessControlService.class);
	
	@Resource
	private UserDao userDao;
	
	@Override
	public List<String> getUsername(){
		List<Users> users = this.userDao.getEffectiveUsers();
		
		List<String> names = new ArrayList<String>();
		for(Users u: users) {
			names.add(u.getUsername());
		}
		return names;
	}
	
	@Override
	public List<CasesView> filterResult(List<CasesView> aCaseViewList, SecurityContextHolder aSecurityContextHolder){
		List<CasesView> outputList = new ArrayList<CasesView>();
		
		if(aCaseViewList != null){
			boolean result = false;
			for(CasesView aView: aCaseViewList){
				result = this.checkViewCaseEditPage(aView, aSecurityContextHolder);
				if(result){
					outputList.add(aView);
				}
			}
		}
		return outputList;
		
	}
	/* (non-Javadoc)
	 * @see com.clinic.web.service.AccessControlService#setDefaultCreateCaseRight(com.clinic.web.entity.Cases, org.springframework.security.core.context.SecurityContextHolder)
	 */
	@Override
	public void setDefaultCreateCaseRight(Cases aCases, SecurityContextHolder aSecurityContextHolder){
		Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
		
		String user = this.getLoginUserName(auth);
		
		aCases.setSearchRight(ALL_USER);
		aCases.setViewRight(user);
		aCases.setEditRight(user);
		
		logger.info("setDefaultCreateCaseRight():"+ALL_USER+";"+user+";"+user);
	}
	
	@Override
	public boolean checkViewReportPage(Cases aCases, SecurityContextHolder aSecurityContextHolder){
		boolean pass = false;
		Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
		
		if(isAdmin(auth)){
			logger.info("checkViewReportPage(): admin bypass");
			return true;
		}
		if(isOpa(auth)){
			logger.info("checkViewReportPage(): opa bypass");
			return true;
		}
		String viewRight = aCases.getViewRight();
		String user = this.getLoginUserName(auth);
		
		//Search user name in the view right list
		pass = this.findUserInRight(user, viewRight);
		
		if(pass){
			logger.info("checkViewReportPage(): user="+user+" is allowed to view case id="+aCases.getCaseID()+" ,viewRight="+viewRight);
		}
		else{
			logger.info("checkViewReportPage(): user="+user+" is not allowed to view case id="+aCases.getCaseID()+" ,viewRight="+viewRight);
		}
		
		return pass;
	}
	
	@Override
	public boolean checkViewCaseEditPage(CasesView aCasesView, SecurityContextHolder aSecurityContextHolder){
		boolean pass = false;
		Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
		
		if(isAdmin(auth)){
			logger.info("checkViewCaseEditPage(): admin bypass");
			return true;
		}		
		String viewRight = aCasesView.getViewRight();
		String user = this.getLoginUserName(auth);
		
		//Search user name in the view right list
		pass = this.findUserInRight(user, viewRight);
		
		if(pass){
			logger.info("checkViewCaseEditPage(): user="+user+" is allowed to view case id="+aCasesView.getCaseID()+" ,viewRight="+viewRight);
		}
		else{
			logger.info("checkViewCaseEditPage(): user="+user+" is not allowed to view case id="+aCasesView.getCaseID()+" ,viewRight="+viewRight);
		}
		
		return pass;
	}
	
	@Override
	public boolean checkViewCaseEditPage(Cases aCases, SecurityContextHolder aSecurityContextHolder){
		boolean pass = false;
		Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
		
		if(isAdmin(auth)){
			logger.info("checkViewCaseEditPage(): admin bypass");
			return true;
		}		
		String viewRight = aCases.getViewRight();
		String user = this.getLoginUserName(auth);
		
		//Search user name in the view right list
		pass = this.findUserInRight(user, viewRight);
		
		if(pass){
			logger.info("checkViewCaseEditPage(): user="+user+" is allowed to view case id="+aCases.getCaseID()+" ,viewRight="+viewRight);
		}
		else{
			logger.info("checkViewCaseEditPage(): user="+user+" is not allowed to view case id="+aCases.getCaseID()+" ,viewRight="+viewRight);
		}
		
		return pass;
	}
	
	@Override
	public boolean checkEditCaseEditPage(Cases aCases, SecurityContextHolder aSecurityContextHolder){
		boolean pass = false;
		Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
		
		if(isAdmin(auth)){
			logger.debug("checkEditCaseEditPage(): admin bypass");
			return true;
		}		
		String editRight = aCases.getEditRight();
		String user = this.getLoginUserName(auth);
		
		//Search user name in the view right list
		pass = this.findUserInRight(user, editRight);
		
		if(pass){
			logger.debug("checkEditCaseEditPage(): user="+user+" is allowed to edit case id="+aCases.getCaseID());
		}
		else{
			logger.info("checkEditCaseEditPage(): user="+user+" is not allowed to edit case id="+aCases.getCaseID());
		}
		
		return pass;
	}
	
	@Override
	public boolean checkSearchCase(Cases aCases, SecurityContextHolder aSecurityContextHolder){
		boolean pass = false;
		Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
		
		if(isAdmin(auth)){
			logger.debug("checkSearchCase(): admin bypass");
			return true;
		}		
		String searchRight = aCases.getSearchRight();
		String user = this.getLoginUserName(auth);
		
		//Search user name in the view right list
		pass = this.findUserInRight(user, searchRight);
		
		if(pass){
			logger.debug("checkSearchCase(): user="+user+" is allowed to search case id="+aCases.getCaseID());
		}
		else{
			logger.info("checkSearchCase(): user="+user+" is not allowed to search case id="+aCases.getCaseID());
		}
		
		return pass;
	}
	
	private boolean findUserInRight(String aUserName, String rightString){
		boolean found = false;
		
		if(rightString != null && rightString.contains(ALL_USER)){
			return true;
		}
		
		//Search user name in the view right list
		if(aUserName != null && rightString != null && rightString.length()>0){
			String[] userList = rightString.split(RIGHT_DELIMITOR);
			
			for(int i=0;i<userList.length;i++){
				if(aUserName.compareToIgnoreCase(userList[i])==0){
					found = true;
					break;
				}
			}
		}
		
		return found;
	}
	
	public boolean showAdvancedFunction(Authentication auth){
		boolean result = false;
		
		//Always show when admin
		if(isAdmin(auth)) {
			result = true;
		}
		else if(isDoc(auth)) {
			result = true; //Not show when Doc
		}
		else if(isOpa(auth)) {
			result = false; //Not show when Opa
		}
		
		return result;
	}
	
	public boolean showAdminFunction(Authentication auth){
		boolean result = false;
		
		//Always show when admin
		if(isAdmin(auth)) {
			result = true;
		}
		else {
			result = false;
		}
		
		return result;
	}
	
	public boolean isDoc(Authentication auth){
		boolean result = false;
		
		Collection<?extends GrantedAuthority> granted = auth.getAuthorities();
		String role;
		Object[] roles = granted.toArray();
		for(int i=0;i<granted.size();i++){
			role = roles[i] + "";
			if(role.equals(ROLE_DOC)){
				result = true;
				break;
			}
		}
		return result;
	}
	
	public boolean isAdmin(Authentication auth){
		boolean result = false;
		
		Collection<?extends GrantedAuthority> granted = auth.getAuthorities();
		String role;
		Object[] roles = granted.toArray();
		for(int i=0;i<granted.size();i++){
			role = roles[i] + "";
			if(role.equals(ROLE_ADMIN)){
				result = true;
				break;
			}
		}
		return result;
	}
	
	public boolean isOpa(Authentication auth){
		boolean result = false;
		
		Collection<?extends GrantedAuthority> granted = auth.getAuthorities();
		String role;
		Object[] roles = granted.toArray();
		for(int i=0;i<granted.size();i++){
			role = roles[i] + "";
			if(role.equals(ROLE_OPA)){
				result = true;
				break;
			}
		}
		return result;
	}
	
	public String getLoginUserName(SecurityContextHolder aSecurityContextHolder){
		Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
		
		String user = this.getLoginUserName(auth);
		
		return user;
	}
	
	public String getLoginUserName(Authentication aAuthentication){
		String name = null;
		boolean isLogin = false;
		if (aAuthentication.isAuthenticated()
				&& !"anonymousUser".equalsIgnoreCase(aAuthentication.getName())) {
			isLogin = true;
			name = aAuthentication.getName();
		}
		return name;
	}
}
