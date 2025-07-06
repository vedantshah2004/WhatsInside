package com.controller.user;
import com.dao.UserDao;
import jakarta.servlet.http.HttpSession;
import com.bean.IngredentsBean;
import com.bean.UserBean;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

	@Autowired
	UserDao userDao;
	
	@Autowired
	JdbcTemplate stmt;
	
	
	@GetMapping("logout")
	public String openlogout()
	{
		return "Login";
	}
	
	@GetMapping("listusers")
	public String listUsers(Model model)
	{
		List<UserBean> users=userDao.getAllUsers();
		model.addAttribute("users",users);
		return "ListUser";
	}
	
	@GetMapping("deleteuser")
	public String deleteUser(Integer id)
	{
		System.out.println(id);
		String deleteQuery="Delete from users where id= ?";
		stmt.update(deleteQuery,id);
		return "redirect:/listusers";
	}
	
	
	@GetMapping("forgetpassword")
	public String openforgetpass()
	{
		return "ForgetPassword";
	}
	
	@GetMapping("home")
	public String openadmindashboard()
	{
		return "Home";
	}
	
	@GetMapping("search")
	public String searchingreduser(Model model)
	{
		return "UserSearchIngredent";
	}
	
	@PostMapping("usersearchingredient")
	public String searchingredindbuser(String name,Model model,HttpSession session)
	{
		UserBean userbean=(UserBean) session.getAttribute("user");
		
		Integer userId=userbean.getId();
		
		
		List<IngredentsBean> ingred = stmt.query(
		        "SELECT * FROM ingredients WHERE name LIKE ? OR scientificName LIKE ?",
		        new BeanPropertyRowMapper<>(IngredentsBean.class),
		        new Object[] { "%" + name + "%", "%" + name + "%" }
		    );		
		
		 if (ingred.size()== 0) {
			 model.addAttribute("error","No data found");
			 	
			 	
			 
			    stmt.update("INSERT INTO search_log (name,userId) VALUES (?,?)", name,userId);

			 
			 return "UserSearchIngredent";
		    }
		
		
		model.addAttribute("ingred",ingred.get(0));
		return "UserViewIngredient";
	}
	
	
	
	@GetMapping("userdashboard")
	public String openuserdashboard()
	{
		return "UserDashboard";
	}
	
	
	
	
}
