package com.controller;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.Service.Smsservice;
import com.bean.UserBean;
import com.dao.UserDao;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Controller
public class SessionController {

	
    @Autowired
    Smsservice sms;
    
	@Autowired
	PasswordEncoder passencode;
	
	
	 @Autowired
	 private UserDao userDao;
	 
	@Autowired
    private JavaMailSender mailSender;
	
	
	@Autowired 
	private JdbcTemplate stmt;

 
	
	@GetMapping("signup")
	public String signup()
	{
		return "Signup";
		
	}
	
	@GetMapping(value={"login","/"})
	public String openlogin()
	{
		return "Login";
	}
	
//	@PostMapping("saveuser")
//	public String ProductUser(@Validated UserBean user, BindingResult result, Model model) {
//
//	    model.addAttribute("result", result);
//	    System.out.println(user.getGender());
//	    System.out.println(user.getFirstname());
//
//	    if (result.hasErrors()) {
//	        model.addAttribute("res", result);
//	        return "Signup";
//	    } else {
//	        // Encrypt password
//	        String epwd = passencode.encode(user.getPassword());
//	        user.setPassword(epwd);
//
//	        // ✅ Set default role if not provided
//	        if (user.getRole() == null || user.getRole().isEmpty()) {
//	            user.setRole("user");
//	        }
//
//	        // Save to DB
//	        userDao.addUser(user);
//	        
//	        // Send welcome email (same as before)...
//	        try {
//	            MimeMessage message = mailSender.createMimeMessage();
//	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
//	            String htmlContent = loadEmailTemplate("templates/welcomemail.jsp");
//	            helper.setTo(user.getEmail());
//	            helper.setFrom("vedantmshah206@gmail.com");
//	            helper.setText(htmlContent, true);
//	            helper.setSubject("Welcome to What's Inside");
//	            mailSender.send(message);
//	        } catch (MessagingException | IOException e) {
//	            e.printStackTrace();
//	        }
//
//	        return "Login";
//	    }
//	}
//
	
	@PostMapping("saveuser")
	public String ProductUser(@Validated UserBean user,BindingResult result,Model model) {
		
		
		model.addAttribute("result", result);
        System.out.println(user.getGender());
        System.out.println(user.getFirstname());

        if (result.hasErrors()) {
            model.addAttribute("res", result);
            return "Signup";
        } else {
        	
        	//Encryption
//        	BCryptPasswordEncoder bcrypt= new BCryptPasswordEncoder();
        	String epwd=passencode.encode(user.getPassword());
        	System.out.println(epwd);
        	user.setPassword(epwd);//60
        	
        	 if (user.getRole() == null || user.getRole().isEmpty()) {
 	            user.setRole("user");
 	        }
        	
        	//db insert	
        	userDao.addUser(user);
        	sms.sendWelcomeSms(user.getContactNo());
        	
        	
        	try {
                MimeMessage message = mailSender.createMimeMessage();
                MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

                String htmlContent = loadEmailTemplate("templates/welcomemail.jsp"); // Should ideally be HTML
                helper.setTo(user.getEmail());
                helper.setFrom("vedantmshah206@gmail.com");
                helper.setText(htmlContent, true);
                helper.setSubject("Welcome to What's Inside");

                mailSender.send(message);

            } catch (MessagingException | IOException e) {
                e.printStackTrace();
            }

            return "Login";
        }
    }

	private String loadEmailTemplate(String path) throws IOException {
	    ClassPathResource resource = new ClassPathResource(path);
	    try (InputStream inputStream = resource.getInputStream()) {
	        return new String(inputStream.readAllBytes(), StandardCharsets.UTF_8);
	    }
	}


	
	@PostMapping("/login")
	public  String authenticate(String email,String password,Model model,HttpSession session)
	{
		UserBean userBean=userDao.authenticate(email);
		if(userBean==null)
		{
			model.addAttribute("error","invalid credentials");
			return "Login";
		}
		System.out.println(password);
		System.out.println(userBean.getPassword());
		System.out.println(email);

		
		
		if(passencode.matches(password,userBean.getPassword())==false)
		{
			model.addAttribute("error","invalid credentials");
			return "Login";
		}
	
		
		session.setAttribute("user", userBean);
		
		if(userBean.getRole().equals("user"))
		{		
			
			return "redirect:/home";
		}
		else if(userBean.getRole().equals("admin"))
		{
			return "redirect:/admindashboard";
		}
		
			return "redirect:/listingredients";
				
	}
	
	@PostMapping("sendotp")
	public String sendOtp(String email, Model model, HttpSession session) {
	    UserBean user = userDao.findByEmail(email);
	    	
	    if (user == null) {
	        model.addAttribute("error", "Email not registered.");
	        return "ForgetPassword";
	    }

	    // Generate 6-digit OTP using Math.random()
	    int otp = (int)(Math.random() * 900000) + 100000;

	    // Save email and OTP in session
	    session.setAttribute("otp", otp);
	    session.setAttribute("otpEmail", email);

	    // Compose and send OTP email
	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	        String subject = "Your OTP for Password Reset";
	        String content = "<h3>Hello " + user.getFirstname() + ",</h3>"
	                       + "<p>Your OTP for password reset is: <strong style='font-size: 18px;'>" + otp + "</strong></p>"
	                       + "<p>Please use this OTP to reset your password.</p>"
	                       + "<p>If you did not request this, please ignore this email.</p>";

	        helper.setTo(email);
	        helper.setFrom("vedantmshah206@gmail.com");
	        helper.setSubject(subject);
	        helper.setText(content, true);

	        mailSender.send(message);

	        model.addAttribute("message", "OTP sent to your email.");
	        return "enterotp"; // Create this JSP to let the user enter the OTP

	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("error", "Failed to send OTP. Please try again.");
	        return "forgotpassword";
	    }
	}

	
	@GetMapping("/resetpassword")
	public String showResetPasswordPage() {
	    return "resetpassword";  // This should match resetpassword.jsp in /WEB-INF/views/
	}

	
	
	@PostMapping("/verifyotp")
	public String verifyOtp(String email, int otp, HttpSession session, Model model) {
	    Object sessionOtp = session.getAttribute("otp");
	    Object sessionEmail = session.getAttribute("otpEmail");

	    if (sessionOtp == null || sessionEmail == null || !email.equals(sessionEmail)) {
	        model.addAttribute("error", "Session expired or invalid email.");
	        return "Login";
	    }

	    if ((int) sessionOtp != otp) {
	        model.addAttribute("error", "Invalid OTP.");
	        return "enterotp";
	    }

	    
	    session.removeAttribute("otp");
	    session.setAttribute("verifiedEmail", email);

	    return "redirect:/resetpassword"; 
	}
	
	
	@PostMapping("/savepassword")
	public String savePassword(String newPassword, String confirmPassword, HttpSession session, Model model) {
	    String email = (String) session.getAttribute("verifiedEmail");

	    if (email == null) {
	        model.addAttribute("error", "Session expired. Please restart password reset.");
	        return "Login";
	    }

	    if (!newPassword.equals(confirmPassword)) {
	        model.addAttribute("error", "Passwords do not match.");
	        return "resetpassword";
	    }

	    // Hash the new password using BCrypt
	    String hashedPassword = passencode.encode(newPassword);

	    String sql = "UPDATE users SET password=? WHERE email=?";
	    stmt.update(sql, hashedPassword, email);  // Now storing securely

	    session.removeAttribute("verifiedEmail");
	    model.addAttribute("msg", "New password saved successfully!");

	    return "Login";
	}


	
	


}
	

