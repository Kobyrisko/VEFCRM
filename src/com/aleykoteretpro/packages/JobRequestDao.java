package com.aleykoteretpro.packages;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
/**Data access object.
* Provides access to the data base
 */
public class JobRequestDao implements IJobRequest {

	private SessionFactory factory;

	public static JobRequestDao instance;

	public static JobRequestDao getInstance()
	{
		if (instance == null)
		{
			instance = new JobRequestDao();
		}
		return instance;
	}
	private JobRequestDao()
	{
		factory = new AnnotationConfiguration().configure()
				.buildSessionFactory();
	}

	@Override
	public List<JobRequest> getAllJobRequest() throws MyExceptions {
		Session session=null;
		try
		{
		SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
		session = factory.openSession();
		List<JobRequest> JobRequest = session.createQuery("from JobRequest").list();
		return JobRequest;
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in getting Coupons List",ce);
		}
		finally
		{
				session.close();
		}
	}

	public Boolean addJobRequest(JobRequest jobRequest) throws MyExceptions {
		
		Session session=null;
		try
		{
		SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
		session = factory.openSession();
		session.beginTransaction();
		session.save(jobRequest);
		session.beginTransaction().commit();
		return true;
		
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in getting Coupons List",ce);
		}
		finally
		{
				session.close();
		}
	}
	@Override
	public Boolean deleteJobRequest(JobRequest jobRequest) throws MyExceptions {
		Session session=null;
		try
		{
		SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
		session = factory.openSession();
		session.beginTransaction();
		session.delete(jobRequest);
		session.beginTransaction().commit();
		return true;
		
		}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in getting Coupons List",ce);
		}
		finally
		{
				session.close();
		}
	}
	@Override
	public Boolean updateJobRequest(JobRequest jobRequest) throws MyExceptions {
		Session session=null;
		try
		{
		SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
		session = factory.openSession();
		List<JobRequest> jobRequestList = session.createQuery("from JobRequest").list();
		Iterator<JobRequest> i = jobRequestList.iterator();
		JobRequest updatedJobRequest = null;
		System.out.println(jobRequest);
		while(i.hasNext()) 
		{	
			JobRequest currentJobRequest = i.next();
			if(currentJobRequest.getId()==jobRequest.getId())
			{
				updatedJobRequest=currentJobRequest;
			}
		}
		if(!updatedJobRequest.equals(null))
		{
			
		if(jobRequest.getWorkOrderID() != 0)
		{
			updatedJobRequest.setWorkOrderID(jobRequest.getWorkOrderID());
		}
		
		if(!jobRequest.getFreeLancerName().equals(""))
		{
			updatedJobRequest.setFreeLancerName(jobRequest.getFreeLancerName());
		}
		
		if(jobRequest.getPrice() != 0 )
		{
			updatedJobRequest.setPrice(jobRequest.getPrice());
		}
		
		if(jobRequest.getMonth() != 0)
		{
			updatedJobRequest.setPrice(jobRequest.getPrice());
		}
		
		if(!jobRequest.getNameOfJob().equals(""))
		{
			updatedJobRequest.setNameOfJob(jobRequest.getNameOfJob());
		}
		
		if(!jobRequest.getFinishDate().equals(""))
		{
			updatedJobRequest.setFinishDate(jobRequest.getFinishDate());
		}
		
		if(!jobRequest.getStatus().equals(""))
		{
			updatedJobRequest.setStatus(jobRequest.getStatus());
		}
		
		if(!jobRequest.getComments().equals(""))
		{
		updatedJobRequest.setComments(jobRequest.getComments());
		}
	}
		session.update(updatedJobRequest);
		session.beginTransaction().commit();
		return true;
		
}
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in getting Coupons List",ce);
		}
		finally
		{
				session.close();
		}
	}
	@Override
	public List<JobRequest> getAllJobRequestByFreelancerName(String FreelancerName)
			throws MyExceptions {
		Session session=null;
		try
		{
		SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
		session = factory.openSession();
		List<JobRequest> jobRequestList = session.createQuery("from JobRequest").list();
		Iterator<JobRequest> i = jobRequestList.iterator();
		List<JobRequest> currentFreelancerJobRequestList = new ArrayList<JobRequest>();
		while(i.hasNext()) 
		{	
			JobRequest currentJobRequest = i.next();
			if(currentJobRequest.getFreeLancerName().equals(FreelancerName))
			{
				currentFreelancerJobRequestList.add(currentJobRequest);
			}
		}
		return currentFreelancerJobRequestList;
	}
		
		catch(HibernateException ce) 
		{
			if (session != null)
				session.getTransaction().rollback();
			throw new MyExceptions("failure in getting Coupons List",ce);
		}
		
		finally
		{
				session.close();
		}
	}
}
