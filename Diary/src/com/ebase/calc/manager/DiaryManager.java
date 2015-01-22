package com.ebase.calc.manager;
import com.ebase.pojo.*;

import java.util.List;


import com.ebase.calc.dao.PostDAO;

public class DiaryManager {
	
	PostDAO postDAO;
	


	public PostDAO getPostDAO() {
		return postDAO;
	}



	public void setPostDAO(PostDAO postDAO) {
		this.postDAO = postDAO;
	}



	public List<Post> fetchPost(User user){
		List<Post> list = null;
		if(!user.getUsername().isEmpty()){
		return postDAO.retrivelPost(user);
		} 
		return list;
	}
}
