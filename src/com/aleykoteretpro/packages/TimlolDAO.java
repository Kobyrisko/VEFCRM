package com.aleykoteretpro.packages;


import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class TimlolDAO implements ITimlolDAO {
/**Data access object.
* Provides access to the data base
*/
	private SessionFactory factory;

	public static TimlolDAO instance;

	public static TimlolDAO getInstance()
	{
		if (instance == null)
		{
			instance = new TimlolDAO();
		}
		return instance;
	}
	private TimlolDAO()
	{
		factory = new AnnotationConfiguration().configure()
				.buildSessionFactory();
	}
	@Override
	public Timlol getTimlol(int iterator) throws MyExceptions {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
/**Return a list of all Timlols currently in the data base.
* @exception MyExceptions occurs when the server fails to open a session
*/
	public List<Timlol> getTimlol() throws MyExceptions {
		/**Update a Timlol in the data base.
		* @param cl the Timlol entity to update.
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
		List<Timlol> timlolList = session.createQuery("from Timlol").list();
		System.out.println(timlolList.size());
		return timlolList;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in adding new coupon",ce);
		}
		finally
		{
				session.close();
		}
	}

	@Override
	public Boolean addTimlol(Timlol tl) throws MyExceptions {
/**Update a Timlol in the data base.
* @param cl the Timlol entity to update.
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
		session.save(tl);
		session.beginTransaction().commit();
		return true;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in adding new coupon",ce);
		}
		finally
		{
				session.close();
		}
	}

	@Override
	public Boolean deleteTimlol(Timlol tl) throws MyExceptions {
/**Update a Timlol in the data base.
* @param cl the Timlol entity to update.
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
		session.delete(tl);
		session.beginTransaction().commit();
		return true;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in adding new coupon",ce);
		}
		finally
		{
				session.close();
		}
	}

	@Override
	public Boolean updateTimlol(Timlol tm) throws MyExceptions {
/**Update a Timlol in the data base.
* @param cl the Timlol entity to update.
* @exception MyExceptions occurs when the server fails to open a session
*/
		Session session= null;
		try 
		{
			//creating factory for getting sessions
			SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
			//creating a new session for adding products
			session = factory.openSession();
			List<Timlol> timlolList= getTimlol();
			System.out.println(timlolList.size());
			Iterator<Timlol> i = timlolList.iterator();
			int flag=0;
			Timlol timlol3= new Timlol();
			while(i.hasNext()) 
			{	
				Timlol timlol2= i.next();
				if(tm.getId()==timlol2.getId())
				{
					timlol3=timlol2;
					flag=1;
				}
				
			}
			if(!tm.getFirstName().equals(""))
				timlol3.setFirstName(tm.getFirstName());
			if(!tm.getLastName().equals(""))
				timlol3.setLastName(tm.getLastName());
			if(!tm.getPhone().equals(""))
				timlol3.setPhone(tm.getPhone());
			if(!tm.getEmail().equals(""))
				timlol3.setEmail(tm.getEmail());
			if(!tm.getAdress().equals(""))
				timlol3.setAdress(tm.getAdress());
			if(tm.getTimlolPrice()!=0)
				timlol3.setTimlolPrice((tm.getTimlolPrice()));
			if(!tm.getTimlolCode().equals(""))
				timlol3.setTimlolCode(tm.getTimlolCode());
			session.update(timlol3);
			session.beginTransaction().commit();
			return true;
		} 
		
		
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in updating new timlol",ce);
		}
		finally
		{
				session.close();
		}
	}

}
