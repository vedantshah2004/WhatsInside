package com.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.IngredentsBean;
import com.bean.UserBean;

@Controller
public class IngredentsController {

	
	@Autowired
	JdbcTemplate stmt;

	
	@GetMapping("ingredents")
	public String openIngredents()
	{
		
		return "Ingredents";
	}
	
	@PostMapping("saveIngredent")
	public String saveIngredent(@Validated  IngredentsBean ibean,BindingResult result,Model model)
	{
		stmt.update("insert into ingredients(name,scientificName,commonUsage ,avoidBy ,fda ,fssai ,efsa  ) VALUES (?,?,?,?,?,?,?)",
		ibean.getName(),ibean.getScientificName(),ibean.getCommonUsage(),ibean.getAvoidBy(),ibean.getFda(),ibean.getFssai(),ibean.getEfsa());
		System.out.println(ibean.getAvoidBy());
		return "redirect:/listingredients";
	}
	
	
	
	@GetMapping("listingredients")
	public String listUsers(Model model)
	{
	
		List<IngredentsBean> ingred=stmt.query("Select * from ingredients",new BeanPropertyRowMapper<>(IngredentsBean.class));
		model.addAttribute("ingred",ingred);
		return "IngredentList";
	}
	
	@GetMapping("deleteingredients")
	public String deleteingred(Integer ingredientId)
	{
		System.out.println(ingredientId);
		String deleteQuery="Delete from ingredients where ingredientId= ?";
		stmt.update(deleteQuery,ingredientId);
		return "redirect:/listingredients";// donot open jsp ,open url
	}
	
	
	@GetMapping("viewingredients")
	public String Viewingred(Integer ingredientId,Model model)
	{
		System.out.println(ingredientId);
		IngredentsBean ib=stmt.queryForObject("Select * from ingredients where ingredientId=?",new BeanPropertyRowMapper<>(IngredentsBean.class),new Object[] {ingredientId});
		
		
		model.addAttribute("ingredent",ib);
		return "ViewIngredient";// donot open jsp ,open url
	}
	
	
	
	@GetMapping("updateingredients")
	public String updateIngredForm(Integer ingredientId, Model model) {
	    IngredentsBean ib = stmt.queryForObject(
	        "SELECT * FROM ingredients WHERE ingredientId=?",
	        new BeanPropertyRowMapper<>(IngredentsBean.class),
	        ingredientId
	    );
	    model.addAttribute("ingredent", ib);
	    return "UpdateIngredient"; // This is the JSP page name
	}

	
	@PostMapping("updateingredientdata")
	public String updateIngredient(@Validated IngredentsBean ibean, BindingResult result) {
	    String updateQuery = "UPDATE ingredients SET name=?, scientificName=?, commonUsage=?, avoidBy=?, fda=?, fssai=?, efsa=? WHERE ingredientId=?";
	    stmt.update(updateQuery,
	        ibean.getName(), ibean.getScientificName(), ibean.getCommonUsage(),
	        ibean.getAvoidBy(), ibean.getFda(), ibean.getFssai(), ibean.getEfsa(),
	        ibean.getIngredientId()
	    );
	    return "redirect:/listingredients";
	}

	
	
	@GetMapping("searchingredient")
	public String searchingred(Model model)
	{
		return "redirect:/listingredients";
	}
	
	@PostMapping("searchingredient")
	public String searchingredindb(String name,Model model)
	{
	
		List<IngredentsBean> ingred = stmt.query(
		        "SELECT * FROM ingredients WHERE name LIKE ? OR scientificName LIKE ?",
		        new BeanPropertyRowMapper<>(IngredentsBean.class),
		        new Object[] { "%" + name + "%", "%" + name + "%" }
		    );		
		
		 if (ingred.isEmpty()) {
		        model.addAttribute("msg", "No ingredients found.");
		    }
		
		
		model.addAttribute("ingred",ingred);
		return "IngredentList";
	}
	
	
	
	
	
	
	

}
