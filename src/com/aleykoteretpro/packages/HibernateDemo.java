package com.aleykoteretpro.packages;

import java.util.List;
import java.util.Iterator;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateDemo
{
	public static void main(String[] args) 
	{
		//creating factory for getting sessions
		SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
		//creating a new session for adding products
		Session session = factory.openSession();
		session.beginTransaction();
		session.getTransaction().commit();
		session.close();
		//creating a new session for getting all products
		Session anotherSession = factory.openSession();
		anotherSession.beginTransaction();
		List co2 = anotherSession.createQuery("from Coupons").list();
		System.out.println("There are " + co2.size() + " WorkOrders");
		Iterator i = co2.iterator();
		while(i.hasNext()) 
		{
			System.out.println(i.next());
		}
		anotherSession.close(); 
	}
}