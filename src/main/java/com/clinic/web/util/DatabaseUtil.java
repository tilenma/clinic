package com.clinic.web.util;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

public class DatabaseUtil {
	//Openshift
	public static final String SYS_DB_PORT = "OPENSHIFT_POSTGRESQL_DB_PORT";
	
	public static final String SYS_DB_HOST = "OPENSHIFT_POSTGRESQL_DB_HOST";
	
	public static final String SYS_DB_USER = "OPENSHIFT_POSTGRESQL_DB_USERNAME";
	
	public static final String SYS_DB_PASSWORD = "OPENSHIFT_POSTGRESQL_DB_PASSWORD";
	
	public static final String SYS_DB = "PGDATABASE";
	
	//Heroku	
	public static final String SYS_DB_URL = "DATABASE_URL";
	
	public static String getUserName2() throws URISyntaxException{
		String user="jianzhi";
		
		String value = System.getenv("DATABASE_URL");
		if(value != null) {
			URI dbUri = new URI(value);		
			user = dbUri.getUserInfo().split(":")[0];
		}		
		return user;
	}
	public static String getPassword2() throws URISyntaxException{
		String pw = "clinicweb";
		
		String value = System.getenv("DATABASE_URL");
		
		if(value != null) {
			URI dbUri = new URI(value);		
			pw = dbUri.getUserInfo().split(":")[1];
		}	
		return pw;
	}
	public static String getJdbcUrl2() throws URISyntaxException{		
		String dbUrl = "jdbc:postgresql://localhost:5432/clinic";
		
		String value = System.getenv("DATABASE_URL");
		if(value != null) {
			URI dbUri = new URI(value);		
			dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
		}
		
		return dbUrl;
	}
	
	
	public static String getUserName() throws URISyntaxException{
		String user="jianzhi";
		
		Map<String, String> env = System.getenv();
		
		if(env.containsKey(SYS_DB_USER)){
			user = env.get(SYS_DB_USER);
		}
		else if(env.containsKey(SYS_DB_URL)){
			URI dbUri = new URI(env.get(SYS_DB_URL));
			user = dbUri.getUserInfo().split(":")[0];
		}
		
		return user;
	}
	
	public static String getPassword() throws URISyntaxException{
		String pw = "clinicweb";
		
		Map<String, String> env = System.getenv();
		
		if(env.containsKey(SYS_DB_PASSWORD)){
			pw = env.get(SYS_DB_PASSWORD);
		}	
		else if(env.containsKey(SYS_DB_URL)){
			URI dbUri = new URI(env.get(SYS_DB_URL));
			pw = dbUri.getUserInfo().split(":")[1];
		}
		return pw;
	}
	
	public static String getJdbcUrl() throws URISyntaxException{
		
		String host="localhost";
		String port="5432";
		String db="Clinic2";
		
		String dbUrl = "";
		Map<String, String> env = System.getenv();
		
		if(env.containsKey(SYS_DB_URL)){
			URI dbUri = new URI(env.get(SYS_DB_URL));
			dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
		}
		else{
			if(env.containsKey(SYS_DB_HOST)){
				host = env.get(SYS_DB_HOST);
			}		
			
			if(env.containsKey(SYS_DB_PORT)){
				port = env.get(SYS_DB_PORT);
			}
			
			if(env.containsKey(SYS_DB)){
				db = env.get(SYS_DB);
			}
			
			dbUrl = "jdbc:postgresql://"+host+":"+port+"/"+db;
		}		
		
		return dbUrl;
	}
}
