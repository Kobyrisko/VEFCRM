package com.aleykoteretpro.packages;


import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class WorkOrderDAO implements IWorkOrderDAO {
/**Data access object.
* Provides access to the data base
*/
	private SessionFactory factory;

	public static WorkOrderDAO instance;

	public static WorkOrderDAO getInstance()
	{
		if (instance == null)
		{
			instance = new WorkOrderDAO();
		}
		return instance;
	}
	private WorkOrderDAO()
	{
		factory = new AnnotationConfiguration().configure()
				.buildSessionFactory();
	}
	@Override
	public WorkOrder getWorkOrder(int iterator) throws MyExceptions {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WorkOrder> getWorkOrder() throws MyExceptions {
/**Return a list of all Work Order currently in the data base.
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
		List<WorkOrder> workOrderList = session.createQuery("from WorkOrder").list();
		System.out.println(workOrderList.size());
		return workOrderList;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in adding new Work Order",ce);
		}
		finally
		{
				session.close();
		}
	}

	@Override
	public Boolean addWorkOrder(WorkOrder wo) throws MyExceptions {
/**Add a new Client to the data base.
* @param wo the Work Order entity to add.
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
		session.save(wo);
		session.beginTransaction().commit();
		return true;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in adding new Work Order",ce);
		}
		finally
		{
				session.close();
		}
	}

	@Override
	public Boolean deleteWorkOrder(WorkOrder wo) throws MyExceptions {
/**Delete a Work Order from the data base.
* @param wo the Work Order entity to delete.
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
		session.delete(wo);
		session.beginTransaction().commit();
		return true;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in adding new Work Order",ce);
		}
		finally
		{
				session.close();
		}
	}

	@Override
	public Boolean updateWorkOrder(WorkOrder wo) throws MyExceptions {
/**Update a WorkOrder in the data base.
* @param cl the Workorder entity to update.
* @exception MyExceptions occurs when the server fails to open a session
*/
		Session session= null;
		try 
		{
			//creating factory for getting sessions
			SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
			//creating a new session for adding products
			session = factory.openSession();
			List<WorkOrder> workOrderList= getWorkOrder();
			System.out.println(workOrderList.size());
			Iterator<WorkOrder> i = workOrderList.iterator();
			WorkOrder updatedWorkOrder= new WorkOrder();
			while(i.hasNext()) 
			{	
				WorkOrder wo2= i.next();
				if(wo.getId()==wo2.getId())
					updatedWorkOrder=wo2;
			}
			System.out.println(wo);
			System.out.println("Doing oooooooooo");
			if(!wo.getClient().equals(""))
				updatedWorkOrder.setClient(wo.getClient());
			if(!wo.getJob().equals(""))
				updatedWorkOrder.setJob(wo.getJob());
			if(!wo.getLang1().equals(""))
				updatedWorkOrder.setLang1(wo.getLang1());
			if(!wo.getLang2().equals(""))
				updatedWorkOrder.setLang2(wo.getLang2());
			if(!wo.getLength().equals(""))
				updatedWorkOrder.setLength(wo.getLength());
			if(!wo.getTranslator().equals(""))
				updatedWorkOrder.setTranslator(wo.getTranslator());
			if(!wo.getTimlol().equals(""))
				updatedWorkOrder.setTimlol(wo.getTimlol());
			if(!wo.getStatus().equals(""))
				updatedWorkOrder.setStatus(wo.getStatus());
			if(!wo.getStartDate().equals(""))
				updatedWorkOrder.setStartDate(wo.getStartDate());
			if(!wo.getFinishDate().equals(""))
				updatedWorkOrder.setFinishDate(wo.getFinishDate());
			if(wo.getPrice()!=0)
				updatedWorkOrder.setPrice(wo.getPrice());
			if(!wo.getNotifications().equals(""))
				updatedWorkOrder.setNotifications(wo.getNotifications());
			if(!wo.getClientGet().equals(""))
				updatedWorkOrder.setClientGet(wo.getNotifications());
			if(!wo.getNameOfJob().equals(""))
				updatedWorkOrder.setNameOfJob(wo.getNameOfJob());
			session.update(updatedWorkOrder);
			session.beginTransaction().commit();
			return true;
		} 
		
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in updating new Work Order",ce);
		}
		finally
		{
				session.close();
		}
	}

}
