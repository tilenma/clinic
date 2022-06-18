package com.clinic.web.exception;

public class ClinicRuntimeException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2413277927097031298L;

	public ClinicRuntimeException(String paramString) {
		super(paramString);
	}

	public ClinicRuntimeException(String paramString, Throwable paramThrowable) {
		super(paramString, paramThrowable);
	}

}
