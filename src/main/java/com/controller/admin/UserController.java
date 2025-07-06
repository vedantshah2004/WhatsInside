package com.controller.admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.http.HttpStatus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.batch.BatchProperties.Jdbc;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpHeaders;
import com.bean.IngredentsBean;
import com.bean.SearchLogBean;
import com.dao.SearchLogDao;
import com.dao.UserDao;
import com.sun.net.httpserver.Headers;

@Controller("UserRole")
public class UserController {
	@Autowired
	UserDao udao;
	

	
	@Autowired
	SearchLogDao searchLogDao; 
	
	@Autowired
	JdbcTemplate stmt;

	@GetMapping("admindashboard")
	public String openadmindashboard()
	{
		return "AdminDashboard";
	}
	
	@GetMapping("searchlog")
	public String searchLog(Model model) {

		List<SearchLogBean> list = searchLogDao.getAllLogs(); 
		model.addAttribute("searchloglist",list);
		return "SearchLogList";
	}
	

	
	@GetMapping("fetch")
	public String fetchIngredient(@RequestParam("name") String name, Model model) {
	    String apiResponse = askDeepSeek(name);

	    if (apiResponse != null) {
	        // Parse and map response
	        IngredentsBean ing = parseDeepSeekResponse(name, apiResponse);

	        // Save to DB
	        udao.addIngredient(ing);
	    }

	    return "redirect:/listingredients";
	}

	
	
	
	
	
	public String askDeepSeek(String query) {
	    String url = "http://localhost:11434/api/generate";
	    RestTemplate restTemplate = new RestTemplate();

	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);

	    String prompt = "Only reply with a strict JSON object with the following fields: " +
	    	    "scientificName, commonUsage, avoidBy, fda, fssai, efsa. " +
	    	    "Do not include any explanation or extra text. " +
	    	    "The 'avoidBy' field must be a JSON array containing only values from this list: " +
	    	    "[\"infant\", \"adult\", \"senior citizen\", \"pregnant woman\", \"breastfeeding woman\"]. " +
	    	    "Ingredient: " + query;


	    Map<String, Object> requestBody = Map.of(
	        "model", "deepseek-r1:1.5b",
	        "prompt", prompt,
	        "stream", false
	    );

	    HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);

	    try {
	        ResponseEntity<Map> response = restTemplate.postForEntity(url, entity, Map.class);

	        if (response.getStatusCode() == HttpStatus.OK) {
	            Object raw = response.getBody().get("response");

	            // ✅ Print the raw string returned by DeepSeek before parsing
	            String responseBody = raw != null ? raw.toString() : "";
	            System.out.println("Raw DeepSeek Response: " + responseBody);

	            return responseBody;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return null;
	}



	
	public IngredentsBean parseDeepSeekResponse(String name, String response) {
	    IngredentsBean bean = new IngredentsBean();
	    bean.setName(name);

	    try {
	        // Extract only the JSON part
	        int start = response.indexOf('{');
	        int end = response.lastIndexOf('}');
	        if (start != -1 && end != -1 && start < end) {
	            String jsonPart = response.substring(start, end + 1);
	            JSONObject obj = new JSONObject(jsonPart);

	            bean.setScientificName(getJsonValueIgnoreCase(obj, "scientificName"));
	            bean.setCommonUsage(getJsonValueIgnoreCase(obj, "commonUsage"));
	            bean.setFda(getJsonValueIgnoreCase(obj, "fda"));
	            bean.setFssai(getJsonValueIgnoreCase(obj, "fssai"));
	            bean.setEfsa(getJsonValueIgnoreCase(obj, "efsa"));

	            // Handle avoidBy list properly
	            Object avoidByValue = obj.opt("avoidBy");

	            if (avoidByValue instanceof JSONArray avoidArray) {
	                List<String> allowedGroups = List.of(
	                    "infant", "adult", "senior citizen", "pregnant woman", "breastfeeding woman"
	                );

	                List<String> selected = new ArrayList<>();
	                for (int i = 0; i < avoidArray.length(); i++) {
	                    String val = avoidArray.optString(i, "").toLowerCase();
	                    for (String group : allowedGroups) {
	                        if (group.toLowerCase().equals(val)) {
	                            selected.add(group);
	                            break;
	                        }
	                    }
	                }

	                bean.setAvoidBy(String.join(",", selected));
	            } else if (avoidByValue instanceof String) {
	                // Fallback if avoidBy is just a comma-separated string (legacy format)
	                String rawAvoidBy = ((String) avoidByValue).toLowerCase();
	                List<String> selectedGroups = new ArrayList<>();

	                if (rawAvoidBy.contains("infant") || rawAvoidBy.contains("child")) {
	                    selectedGroups.add("infant");
	                }
	                if (rawAvoidBy.contains("adult")) {
	                    selectedGroups.add("adult");
	                }
	                if (rawAvoidBy.contains("senior") || rawAvoidBy.contains("elderly")) {
	                    selectedGroups.add("senior citizen");
	                }
	                if (rawAvoidBy.contains("pregnant")) {
	                    selectedGroups.add("pregnant woman");
	                }
	                if (rawAvoidBy.contains("breastfeeding")) {
	                    selectedGroups.add("breastfeeding woman");
	                }

	                bean.setAvoidBy(String.join(",", selectedGroups));
	            } else {
	                bean.setAvoidBy(null);
	            }

	        } else {
	            System.out.println("No valid JSON found in response.");
	        }
	    } catch (JSONException e) {
	        System.out.println("Error parsing JSON: " + e.getMessage());
	    }

	    return bean;
	}





	private String getJsonValueIgnoreCase(JSONObject obj, String key) {
	    for (String k : obj.keySet()) {
	        if (k.equalsIgnoreCase(key)) {
	            Object val = obj.opt(k);
	            return (val != null && !val.toString().equalsIgnoreCase("null")) ? val.toString().trim() : null;
	        }
	    }
	    return null;
	}




}