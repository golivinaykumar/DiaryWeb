package com.ebase.calc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ebase.pojo.User;

public class UserDAO extends HibernateDaoSupport {
	
	
	

	

	public boolean signUp(User signupDetails){
		
			User signupInsert = signupDetails;
			getHibernateTemplate().save(signupInsert);
			return true;
			
			
		
		
		
		
	}
	
	public boolean login(String username,String password){
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		List<User> loginList=getHibernateTemplate().findByExample(user);
		if(loginList.get(0).getPassword().equals(password)){
			return true;
		}
		        	return false;
			}
	public boolean checkUser(String username){
		User user = getUserDetails(username);
		if(user == null){
			return true;
		}else{
			return false;
		}
	
		
		    	
		}
	public User getUserDetails(String username){
		User getUserPOJO = new User();
		getUserPOJO.setUsername(username);
		List<User> getUserList=  getHibernateTemplate().findByExample(getUserPOJO);
		getUserPOJO = null;
			try{
		    	return getUserList.get(0);
			}
			catch (IndexOutOfBoundsException ex){
				return getUserPOJO;
			}
	}
	public boolean updateUser(User updateDetails){
			return false;
		
		
	}
	public boolean changePassword(String username,String oldPassword,String newPassword){
		    			return false;
		
	}
	
	}


