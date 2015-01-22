package com.ebase.calc.manager;

import java.text.SimpleDateFormat;
import java.sql.Date;

import com.ebase.calc.dao.PostDAO;
import com.ebase.pojo.Post;

public class PostManager {
	PostDAO postDAO;
	
	ValidationPostManager validationPostManager ;
	public PostDAO getPostDAO() {
		return postDAO;
	}
	public void setPostDAO(PostDAO postDAO) {
		this.postDAO = postDAO;
	}
	public ValidationPostManager getValidationPostManager() {
		return validationPostManager;
	}
	public void setValidationPostManager(ValidationPostManager validationPostManager) {
		this.validationPostManager = validationPostManager;
	}
	
	public boolean insertDiaryManager(Post insertDiary){
		
		insertDiary.setPostedDate(validationPostManager.addDate());
		if(validationPostManager.checkIsEmpty(insertDiary) && !insertDiary.getUser().getUsername().isEmpty()){
			return postDAO.insertDiaryDao(insertDiary);
		}
		return false;
	}
	public boolean updatePostManager(Post updatePost,String username,int countid){
		
		if(validationPostManager.checkIsEmpty(updatePost) && !username.isEmpty()){
			return postDAO.updatePost(updatePost, username,countid);
		}
		return false;
		
		
	}
	public boolean deletePostManager(Post deletePost){
		
		if(deletePost.getCountId() != 0 && !deletePost.getUser().getUsername().isEmpty()){
			return postDAO.deletePost(deletePost);
		}
		return false;
	}
	public Post retrivelManager(int countid,String username){
	
		
		return postDAO.retrievalPost(countid, username);
		
	}
	
}
