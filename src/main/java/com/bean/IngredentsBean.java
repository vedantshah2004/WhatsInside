 package com.bean;

import jakarta.validation.constraints.NotBlank;

public class IngredentsBean {

	private Integer ingredientId ;

	@NotBlank(message="Please Enter ingredentName")
    private String name;
	@NotBlank(message="Please Enter ingredents Scientific Name")
    private String scientificName;

	@NotBlank(message="Please Enter  ingredents common usage")
	private String commonUsage;
	
    public Integer getIngredentid() {
		return ingredientId ;
	}

	public Integer getIngredientId() {
		return ingredientId;
	}

	public void setIngredientId(Integer ingredientId) {
		this.ingredientId = ingredientId;
	}

	public void setIngredentid(Integer ingredentid) {
		ingredientId  = ingredentid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getScientificName() {
		return scientificName;
	}

	public void setScientificName(String scientificName) {
		this.scientificName = scientificName;
	}

	public String getCommonUsage() {
		return commonUsage;
	}

	public void setCommonUsage(String commonUsage) {
		this.commonUsage = commonUsage;
	}

	public String getAvoidBy() {
		return avoidBy;
	}

	public void setAvoidBy(String avoidBy) {
		this.avoidBy = avoidBy;
	}

	public String getFda() {
		return fda;
	}

	public void setFda(String fda) {
		this.fda = fda;
	}

	public String getFssai() {
		return fssai;
	}

	public void setFssai(String fssai) {
		this.fssai = fssai;
	}

	public String getEfsa() {
		return efsa;
	}

	public void setEfsa(String efsa) {
		this.efsa = efsa;
	}

	private String avoidBy;

	@NotBlank(message="Please Enter valid message for fda")
	private String fda;
	
	@NotBlank(message="Please Enter valid message for fssai")
    private String fssai;
    
	@NotBlank(message="Please Enter valid message for efsa")
	private String efsa;
}
