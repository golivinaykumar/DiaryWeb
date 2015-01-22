package com.ebase.calc.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebase.calc.manager.DiaryManager;
import com.ebase.calc.manager.UserManager;
import com.ebase.pojo.Post;
import com.ebase.pojo.User;
@Controller
public class UserController {
	UserManager userManager;
	public UserManager getUserManager() {
		return userManager;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public DiaryManager getDiaryManager() {
		return diaryManager;
	}

	public void setDiaryManager(DiaryManager diaryManager) {
		this.diaryManager = diaryManager;
	}
	DiaryManager diaryManager;
	@RequestMapping("/default.do")
	public ModelAndView PassListPost(){
		ModelAndView index = new ModelAndView("login");
		return index;
	}

	@RequestMapping("/signup1.do")
	public ModelAndView signUpPage(){
		ModelAndView index = new ModelAndView("signup");
		return index;
	}
	@RequestMapping("/signup.do")
	public ModelAndView signUpCheckPage(@ModelAttribute() User signupDetails){
		signupDetails.setId(UUID.randomUUID().getMostSignificantBits());
		if(userManager.signUp(signupDetails)){
			ModelAndView index = new ModelAndView("login");
			return index;
		}
		else{
		ModelAndView index = new ModelAndView("signup");
		return index;
		}
	}
	@RequestMapping(value="/home1.do")
	public ModelAndView login(@ModelAttribute("login") User userdetails,HttpServletRequest request){
		
	
	
		if(userManager.loginManager(userdetails.getUsername(), userdetails.getPassword())){
			
			User details=userManager.getUserDetailsManager(userdetails.getUsername());
			request.getSession().setAttribute("userObject", details);
			request.getSession().setAttribute("username", userdetails.getUsername());
			request.getSession().setAttribute("firstName", details.getFirstName());
			request.getSession().setAttribute("lastName", details.getLastName());
			request.getSession().setAttribute("email", details.getEmail());
			
		
			List<Post> diaryList =null;
			  diaryList =  diaryManager.fetchPost((User) request.getSession().getAttribute("userObject"));
			 
	
		ModelAndView index = new ModelAndView("home");
		index.addObject("diaryList", diaryList);
		return index;
		
	}else{
		ModelAndView index = new ModelAndView("login");
		return index;
		
	}

	}
	}
