package com.clinic.web.vo;

import java.io.Serializable;
import java.math.BigDecimal;

import com.clinic.web.entity.Medicine;
import com.clinic.web.util.DrugUtil;
import com.clinic.web.util.NumberUtil;

public class MedicineVo implements Serializable,Comparable<MedicineVo> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 768676668362628395L;

	private String type;
	
	private String code;
	
	private String barCode;
	
	private String name;
	
	private BigDecimal unit;
	
	private Integer order;
	
	private String content;
	
	private String remark;
	
	private String detailEN;
	
	private String detailCH;
	
	private String unit2;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getBarCode() {
		return barCode;
	}

	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getDisplayUnit(){
		if(DrugUtil.isDrug(this.type)){
			if(this.unit != null) {
				return NumberUtil.formatUnit(this.unit)+"g";
			}
			else {
				return "0g";
			}
		}
		else{
			return this.type;
		}
	}

	public BigDecimal getUnit() {
		return unit;
	}

	public void setUnit(BigDecimal unit) {
		this.unit = unit;
	}

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public boolean isShowContent(){
		if(DrugUtil.isFormula(this.type) && this.content != null && this.content.trim().length()>0){
			return true;
		}
		return false;
	}
	
	public boolean isShowDetail(){
		if(DrugUtil.isFormula(this.type) && this.detailCH != null && this.detailCH.trim().length()>0){
			return true;
		}
		return false;
	}
	

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

	public String getUnit2() {
		return unit2;
	}

	public void setUnit2(String unit2) {
		this.unit2 = unit2;
	}

	@Override
	public int compareTo(MedicineVo o) {
		//Sort by remark
		if(this.remark != null && o.getRemark() != null && !this.remark.isEmpty() && !o.getRemark().isEmpty() 
				&& Character.isDigit(this.remark.charAt(0)) && Character.isDigit(o.getRemark().charAt(0))){
			//System.err.println("comparing "+this.remark+" to "+o.getRemark()+" result="+this.remark.compareTo(o.getRemark()));			
			return this.remark.compareTo(o.getRemark());
		}
		else if(this.remark != null && o.getRemark() != null && !this.remark.isEmpty() && !o.getRemark().isEmpty() 
				&& Character.isDigit(this.remark.charAt(0)) && !Character.isDigit(o.getRemark().charAt(0))){
			return -10;
		}
		else if(this.remark != null && o.getRemark() != null && !this.remark.isEmpty() && !o.getRemark().isEmpty() 
				&& !Character.isDigit(this.remark.charAt(0)) && Character.isDigit(o.getRemark().charAt(0))){
			return 10;
		}
		else if(this.getOrder() != null && o.getOrder() != null){ //Sort by order
			return this.getOrder().compareTo(o.getOrder());
		}
		return 0;
	} 
	
	
}
