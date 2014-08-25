package com.aleykoteretpro.packages;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;


public class Users {
/**A class representing a User entity.
* @author Koby Risko
*  @author Liran Bar
*/
	private int id;
	private String username;
	private String password;
	private Date lastlogin;
	
	public Users(){
		super();
	}
	

	public Users(String username, String password) {
		super();
		this.username = username;
		this.password = password;
		this.lastlogin=new Date();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public Date getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(Date lastlogin) {
		this.lastlogin = lastlogin;
	}

	public Users(int id, String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.lastlogin= new Date();
	}
	public Users(int id, String username, String password, Date lastlogin) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.lastlogin=lastlogin;
	}


	@Override
	public String toString() {
		return "Users id=" + id + " username=" + username + " password="
				+ password + " lastlogin=" + lastlogin;
	}

	
	public static void main(String[] args0)
	{
		//creating factory for getting sessions
				SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
				//creating a new session for adding products
				Session session = factory.openSession();
		Users Koby= new Users(1,"Tech", "a123456A");
		session.beginTransaction();
		session.save(Koby);
		session.beginTransaction().commit();
		session.close();
		
	}

	

	

	
	
	
	

}
