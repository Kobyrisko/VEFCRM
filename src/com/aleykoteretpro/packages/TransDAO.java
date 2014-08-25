package com.aleykoteretpro.packages;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class TransDAO implements ITransDAO {
/**Data access object.
* Provides access to the data base
*/
	private SessionFactory factory;

	public static TransDAO instance;

	public static TransDAO getInstance()
	{
		if (instance == null)
			instance = new TransDAO();
		return instance;
	}
	private TransDAO()
	{
		factory = new AnnotationConfiguration().configure()
				.buildSessionFactory();
	}
	@Override
	public List<Trans> getTrans() throws MyExceptions {
/**Return a list of all Trans currently in the data base.
* @exception MyExceptions occurs when the server fails to open a session
*/
		Session session=null;
		try
		{
		//creating factory for getting sessions
		SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
		//creating a new session for adding products
		session = factory.openSession();
		session.beginTransaction();
		List<Trans> transList = session.createQuery("from Trans").list();
		System.out.println(transList.size());
		return transList;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in getting Translators List",ce);
		}
		finally
		{
				session.close();
		}
	}

	@Override
	public Boolean addTrans(Trans tr) throws MyExceptions {
/**Update a Trans in the data base.
* @param cl the Trans entity to update.
* @exception MyExceptions occurs when the server fails to open a session
*/
		Session session=null;
		try
		{
		//creating factory for getting sessions
		SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
		//creating a new session for adding products
		session = factory.openSession();
		session.beginTransaction();
		session.save(tr);
		session.beginTransaction().commit();
		return true;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in adding new Translator",ce);
		}
		finally
		{
				session.close();
		}
	}

	@Override
	public Boolean deleteTrans(Trans tr) throws MyExceptions {
/**Update a Trans in the data base.
* @param cl the Trans entity to update.
* @exception MyExceptions occurs when the server fails to open a session
*/
		Session session=null;
		try
		{
		//creating factory for getting sessions
		SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
		//creating a new session for adding products
		session = factory.openSession();
		session.beginTransaction();
		session.delete(tr);
		session.beginTransaction().commit();
		return true;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in deleting Translator",ce);
		}
		finally
		{
				session.close();
		}
	}

	@Override
	public Boolean updateTrans(Trans tr) throws MyExceptions {
/**Update a Trans in the data base.
* @param cl the Trans entity to update.
* @exception MyExceptions occurs when the server fails to open a session
*/
		Session session= null;
		try 
		{
			//creating factory for getting sessions
			SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
			//creating a new session for adding products
			session = factory.openSession();
			List<Trans> transList= getTrans();
			System.out.println(transList.size());
			Iterator<Trans> i = transList.iterator();
			Trans trans3= new Trans();
			while(i.hasNext()) 
			{	
				Trans trans2= i.next();
				if(tr.getId()==trans2.getId())
					trans3=trans2;
			}
			if(!tr.getFirstName().equals(""))
				trans3.setFirstName(tr.getFirstName());
			if(!tr.getLastName().equals(""))
				trans3.setLastName(tr.getLastName());
			if(!tr.getPhone().equals(""))
				trans3.setPhone(tr.getPhone());
			if(!tr.getEmail().equals(""))
				trans3.setEmail(tr.getEmail());
			if(!tr.getAdress().equals(""))
				trans3.setAdress(tr.getAdress());
			if(tr.getTransPrice()!=0)
				trans3.setTransPrice((tr.getTransPrice()));
			if(!tr.getTransCode().equals(""))
				trans3.setTransCode(tr.getTransCode());
			if(!tr.getLanguages().equals(""))
				trans3.setLanguages(tr.getLanguages());
			session.update(trans3);
			session.beginTransaction().commit();
			return true;
		} 
		
		
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in updating new Translator",ce);
		}
		finally
		{
				session.close();
		}
	}

}
