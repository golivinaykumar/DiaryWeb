package com.ebase.calc.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.ebase.calc.manager.DiaryManager;
import com.ebase.calc.manager.PostManager;
import com.ebase.pojo.Post;
import com.ebase.pojo.User;

@Controller
public class DiaryController  {
	DiaryManager diaryManager;
	PostManager postManager;
	
	public PostManager getPostManager() {
		return postManager;
	}
	public void setPostManager(PostManager postManager) {
		this.postManager = postManager;
	}
	public DiaryManager getDiaryManager() {
		return diaryManager;
	}
	public void setDiaryManager(DiaryManager diaryManager) {
		this.diaryManager = diaryManager;
	}
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request){
		request.getSession().invalidate();
		ModelAndView logoutmv = new ModelAndView("login"); 
		return logoutmv;
	}
	@RequestMapping(value="/addpost.do", method=RequestMethod.POST)
	public ModelAndView addPost(@ModelAttribute() Post addPostObject ,HttpServletRequest request){
	

		String username = (String) request.getSession().getAttribute("username");
		
		List<Post> diaryList =null;
		User user = (User) request.getSession().getAttribute("userObject");
	
		addPostObject.setUser( (User) request.getSession().getAttribute("userObject"));
		addPostObject.setCountId(UUID.randomUUID().getMostSignificantBits());
		
		if(postManager.insertDiaryManager(addPostObject)){
			
			diaryList =  diaryManager.fetchPost(user);
	
		ModelAndView index = new ModelAndView("home");
		index.addObject("diaryList", diaryList);
		return index;
		}else{
			diaryList =  diaryManager.fetchPost(user);
			ModelAndView index = new ModelAndView("home");
			index.addObject("diaryList", diaryList);
			return index;
			
		}
		
		
		
	}
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public ModelAndView editDeletePost(HttpServletRequest request,@ModelAttribute() Post editPost){
			System.out.println(editPost.getCountId());
			System.out.println(editPost.getDescription());
			ModelAndView index = new ModelAndView("editpost");
			index.addObject("editList",editPost );
			return index;
			
		}
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public ModelAndView deletePost(HttpServletRequest request,@ModelAttribute() Post editPost){
		User user = (User) request.getSession().getAttribute("userObject");
		editPost.setUser(user);
		postManager.deletePostManager(editPost);
			List<Post> diaryList =  diaryManager.fetchPost((User) request.getSession().getAttribute("userObject"));
			
			ModelAndView index = new ModelAndView("home");
			index.addObject("diaryList", diaryList);
			return index;
			
		}
}
