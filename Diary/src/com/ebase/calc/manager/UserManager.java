package com.ebase.calc.manager;

import com.ebase.calc.dao.UserDAO;
import com.ebase.pojo.User;

public class UserManager {
	UserDAO userDAO ;
	public UserDAO getUserDAO() {
		return userDAO;
	}
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	public ValidationUserManager getValidationUserManager() {
		return validationUserManager;
	}
	public void setValidationUserManager(ValidationUserManager validationUserManager) {
		this.validationUserManager = validationUserManager;
	}
	ValidationUserManager validationUserManager;
	public boolean signUp(User signupData){
		
		String username = signupData.getUsername();
		System.out.println(username);
		if(validationUserManager.isEmptyData(signupData) && validationUserManager.isValidEmailAddress(signupData.getEmail())){
		if(userDAO.checkUser(username)){
			
			return userDAO.signUp(signupData);
		}else{
			System.out.println("signup mgr 1");
			return false;
		}
		}
		else {
			System.out.println("signup mgr 2");
			return false;
		}
		
	}
	public boolean checkUser(String username){
		return userDAO.checkUser(username);
	}
	public boolean loginManager(String username,String password){
		if(!username.isEmpty() && !password.isEmpty()){
		return userDAO.login(username, password);
		}else{
			System.out.println("manager");
			return false;
		}
			
		
	}
	public User getUserDetailsManager(String username){
		if(!username.isEmpty()){
		return userDAO.getUserDetails(username);
		}else{
			return null;
		}
		
		
		
	}
	public boolean updateUserManager(User updateDetails){
		if(validationUserManager.isEmptyData(updateDetails) && validationUserManager.isValidEmailAddress(updateDetails.getEmail())){
		return userDAO.updateUser(updateDetails);
		}else{
			return false;
		}
		
	}
	public boolean changePasswordManager(String username,String oldPassword,String newPassword,String newpassword2){
		if(!username.equals(null) && !oldPassword.equals(null) && !newPassword.equals(null) && newPassword.equals(newpassword2) ){
			return userDAO.changePassword(username, oldPassword, newpassword2);
		}else{
			return false;
		}
	}
}
