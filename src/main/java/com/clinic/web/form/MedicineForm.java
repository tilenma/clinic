package com.clinic.web.form;

import java.io.Serializable;
import java.math.BigDecimal;

public class MedicineForm implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1031875479446723132L;

	private Integer id;	
	
	private String code;
	
	private String type;
	
	private String name;
	
	private String priceCategory;
	
	private Integer order;
	
	private BigDecimal referenceUnit;
	
	private String barcode;
	
	private String taste;
	
	private String meridian;
	
	private String effect;
	
	private String contraint;
	
	private String usage;
	
	private String content;
	
	private String detailEN;
	
	private String detailCH;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPriceCategory() {
		return priceCategory;
	}

	public void setPriceCategory(String priceCategory) {
		this.priceCategory = priceCategory;
	}

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	public BigDecimal getReferenceUnit() {
		return referenceUnit;
	}

	public void setReferenceUnit(BigDecimal referenceUnit) {
		this.referenceUnit = referenceUnit;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getTaste() {
		return taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public String getMeridian() {
		return meridian;
	}

	public void setMeridian(String meridian) {
		this.meridian = meridian;
	}

	public String getEffect() {
		return effect;
	}

	public void setEffect(String effect) {
		this.effect = effect;
	}

	public String getContraint() {
		return contraint;
	}

	public void setContraint(String contraint) {
		this.contraint = contraint;
	}

	public String getUsage() {
		return usage;
	}

	public void setUsage(String usage) {
		this.usage = usage;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}	

	public String getDetailEN() {
		return detailEN;
	}

	public void setDetailEN(String detailEN) {
		this.detailEN = detailEN;
	}

	public String getDetailCH() {
		return detailCH;
	}

	public void setDetailCH(String detailCH) {
		this.detailCH = detailCH;
	}
	
}
