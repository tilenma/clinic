package com.clinic.web.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="\"Medicine\"")
public class Medicine implements Comparable<Medicine> {
	
	@Id
	@Column(name="\"ID\"")
	private Integer id;	
	
	@Column(name="\"code\"")
	private String code;
	
	@Column(name="\"type\"")
	private String type;
	
	@Column(name="\"name\"")
	private String name;
	
	@Column(name="\"priceCategory\"")
	private String priceCategory;
	
	@Column(name="\"order\"")
	private Integer order;
	
	@Column(name="\"referenceUnit\"")
	private BigDecimal referenceUnit;
	
	@Column(name="\"barcode\"")
	private String barcode;
	
	@Column(name="\"taste\"")
	private String taste;
	
	@Column(name="\"meridian\"")
	private String meridian;
	
	@Column(name="\"effect\"")
	private String effect;
	
	@Column(name="\"contraint\"")
	private String contraint;
	
	@Column(name="\"usage\"")
	private String usage;
	
	@Column(name="\"content\"")
	private String content;
	
	@Column(name="\"detail_en\"")
	private String detailEN;
	
	@Column(name="\"detail_ch\"")
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

	@Override
	public int compareTo(Medicine o) {			
		return this.getOrder().compareTo(o.getOrder());
	}
	
	
}
