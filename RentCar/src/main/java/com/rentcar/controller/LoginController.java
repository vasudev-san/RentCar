package com.rentcar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rentcar.entity.Customer;
import com.rentcar.entity.User;
import com.rentcar.service.CustomerService;
import com.rentcar.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class LoginController {
	@Autowired
	CustomerService customerService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "sign-up",method = RequestMethod.GET)
	public String customerSignUpPage(ModelMap modelMap) {
		Customer customer = new Customer("","","","","");
		modelMap.put("customer",customer);
		return "customerSignUp";
	}
	
	@RequestMapping(value = "sign-up",method = RequestMethod.POST)
	public String customerSignUpPagePost(@Valid Customer customer,BindingResult result,@RequestParam String username,String password) {
		if(result.hasErrors()) {
			return "customerSignUp";
		}
		customerService.addCustomerDetail(customer);
		userService.addUserDetails(customer,username,password);
		return "redirect:login";
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String login1() {
		return "login";
	}
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(@RequestParam String username,@RequestParam String password,HttpServletRequest request ,ModelMap modelMap ) {
		
		if(userService.checkUsernamePassword(username,password)) {
			User user = userService.fetchUserDetailFromDataBase(username);
			HttpSession session = request.getSession();
			session.setAttribute("username", user.getUsername());

			if ("admin".equalsIgnoreCase(user.getRole())) {	
				return "redirect:/index";
			} else if ("user".equalsIgnoreCase(user.getRole())) {
				session.setAttribute("currentCustomer", user.getCustomer().getCustomerId());
				return "redirect:/home";
			} else {
				return "redirect:/login"; // Redirect back to login page if role is not valid
			}
		}else {
			modelMap.put("error", "Username Or Password does not Exist");
			return "login"; // Redirect back to login page if role is not valid
		}

		
	}
	
	@RequestMapping("logout")
	 public String logout(HttpServletRequest request) {
	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.invalidate();
	        }
	        return "redirect:/login"; // Redirect to login page after logout
	    }
}
