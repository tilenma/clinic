package com.clinic.web.util;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityUtil {	
	public static String getUsername(SecurityContextHolder aSecurityContextHolder) {
		Authentication auth = aSecurityContextHolder.getContext().getAuthentication();
		String userName = getLoginUserName(auth);
		
		return userName;
	}
	
	public static String getLoginUserName(Authentication aAuthentication){
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
