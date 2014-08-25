package com.aleykoteretpro.packages;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class ClientDAO implements IClientDAO {
/**Data access object.
* Provides access to the data base
*/
	private SessionFactory factory;

	public static ClientDAO instance;

	public static ClientDAO getInstance()
	{
		if (instance == null)
		{
			instance = new ClientDAO();
		}
		return instance;
	}

	private ClientDAO()
	{
		factory = new AnnotationConfiguration().configure()
				.buildSessionFactory();
	}

	@Override
	public Client getClient(int id) throws MyExceptions {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Client> getClient() throws MyExceptions {
/**Return a list of all Clients currently in the data base.
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
		List<Client> clientList = session.createQuery("from Client").list();
		System.out.println(clientList.size());
		return clientList;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in open session",ce);
		}
		finally
		{
				session.close();
		}
	}
	@Override
	public Boolean addClient(Client cl) throws MyExceptions{
/**Add a new Client to the data base.
* @param cl the client entity to add.
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
		session.save(cl);
		session.beginTransaction().commit();
		return true;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in open session",ce);
		}
		finally
		{
				session.close();
		}
	}

	@Override
	public Boolean deleteClient(Client cl) throws MyExceptions{
/**Delete a Client from the data base.
* @param cl the client entity to delete.
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
		session.delete(cl);
		session.beginTransaction().commit();
		return true;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in open session",ce);
		}
		finally
		{
				session.close();
		}
	}

	@Override
	public Boolean updateClient(Client cl) throws MyExceptions{
/**Update a Client in the data base.
* @param cl the client entity to update.
* @exception MyExceptions occurs when the server fails to open a session
*/
		Session session= null;
		try 
		{
			//creating factory for getting sessions
			SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
			//creating a new session for adding products
			session = factory.openSession();
			List<Client> clientList= getClient();
			System.out.println(clientList.size());
			Iterator<Client> i = clientList.iterator();
			int flag=0;
			Client client3= new Client();
			System.out.println(cl);
			while(i.hasNext()) 
			{	
				Client client2= i.next();
				if(cl.getId()==client2.getId())
				{
					client3=client2;
					flag=1;
				}
				
			}
			if(!cl.getFirstName().equals(""))
				client3.setFirstName(cl.getFirstName());
			if(!cl.getLastName().equals(""))
				client3.setLastName(cl.getLastName());
			if(!cl.getPhone().equals(""))
				client3.setPhone(cl.getPhone());
			if(!cl.getEmail().equals(""))
				client3.setEmail(cl.getEmail());
			if(!cl.getAdress().equals(""))
				client3.setAdress(cl.getAdress());
			if(!cl.getCompanyName().equals(""))
				client3.setCompanyName(cl.getCompanyName());
			if(!cl.getCompanyCode().equals(""))
				client3.setCompanyCode(cl.getCompanyCode());
			session.update(client3);
			session.beginTransaction().commit();
			return true;
		} 
		
		
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in open session",ce);
		}
		finally
		{
				session.close();
		}
	}

}
