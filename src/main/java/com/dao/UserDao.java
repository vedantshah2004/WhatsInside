package com.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

import com.bean.IngredentsBean;
import com.bean.UserBean;

@Repository
public class UserDao {

		@Autowired
		JdbcTemplate stmt;
		public int addIngredient(IngredentsBean bean) {
		    String sql = "INSERT INTO ingredients (name, scientificName, commonUsage, avoidBy, fda, fssai, efsa) VALUES (?, ?, ?, ?, ?, ?, ?)";
		    return stmt.update(sql, bean.getName(), bean.getScientificName(), bean.getCommonUsage(), bean.getAvoidBy(), bean.getFda(), bean.getFssai(), bean.getEfsa());
		}

		
		// return type no return type
		// argument type user bean
		public void addUser(UserBean user) {
		    stmt.update(
		        "INSERT INTO users (firstname, lastname, gender, email, password, role) VALUES (?, ?, ?, ?, ?, ?)",
		        user.getFirstname(),
		        user.getLastname(),
		        user.getGender(),
		        user.getEmail(),
		        user.getPassword(),
		        user.getRole() 
		    );
		}

			
		//select * from users
		public List<UserBean> getAllUsers()
		{
			List<UserBean> users=stmt.query("Select * from users",new BeanPropertyRowMapper<>(UserBean.class));
				
			return users;
		}
		
		public UserBean authenticate(String email)
		{
			try {
			UserBean user =stmt.queryForObject("select * from users where email =? ",new BeanPropertyRowMapper<>(UserBean.class),email);	
			return user;
			}
			catch (Exception e) {
				return null;
			
			}
		}
		
		
		public UserBean findByEmail(String email) {
		    try {
		        return stmt.queryForObject(
		            "SELECT * FROM users WHERE email = ?", 
		            new BeanPropertyRowMapper<>(UserBean.class),
		            email
		        );
		    } catch (Exception e) {
		        return null;
		    }
		}


		
		
}
