package com.controller.user;

import com.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Service.PaymentService;
import com.bean.PaymentBean;

@Controller
public class PaymentController {
	
	
	@Autowired
	PaymentService paymentservice;
	
	
	@GetMapping("payment")
	public String payment() {
		return "payment";
	}
	
	@PostMapping("processPayment")
	public String processPayment(PaymentBean paymentBean) {
		System.out.println(paymentBean.getCardNumber());
		System.out.println(paymentBean.getCvv());
		System.out.println(paymentBean.getExpiryDate());
		
		
		paymentservice.ChargeCreditCard("58BQf6HfYF","78X4u7wj7QQuq9x6",500D,paymentBean);
		return "Homepay";
		
	}
	
	
}