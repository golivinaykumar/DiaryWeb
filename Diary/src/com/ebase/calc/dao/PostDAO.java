package com.ebase.calc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import javax.websocket.Session;

import org.hibernate.Criteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ebase.pojo.Post;
import com.ebase.pojo.User;

public class PostDAO extends HibernateDaoSupport {
	
	public  boolean insertDiaryDao(Post insertDiary){
			
		getHibernateTemplate().save(insertDiary);
		return true;
	}
		
		public boolean updatePost(Post updatePost,String username, int countid){
			return true;
			}
		public Post retrievalPost(int countid,String username){
			Post post = new Post();
			return post;
				
		}
		
		public boolean deletePost(Post dePost){
			getHibernateTemplate().delete(dePost);
			return true;
			}

		public List<Post> retrivelPost(User username) {
			Post post = new Post();
			post.setUser(username);
			
			
			List<Post> listOfPost = getHibernateTemplate().findByExample(post);
			return listOfPost;
		}
		
		
		
	
}
