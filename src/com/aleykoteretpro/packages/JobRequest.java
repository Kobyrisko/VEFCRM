package com.aleykoteretpro.packages;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class JobRequest{
/**A class representing a Coupon entity.
* @author Koby Risko
*/
	private int id;
	private int workOrderID;
	private String FreeLancerName;
	private int price;
	private int month;
	private String finishDate;
	private String nameOfJob;
	private String status;
	private String comments;
	
	public JobRequest(){};
	
	public JobRequest(int id, int workOrderID, String freeLancerName,
			int price, int month, String finishDate, String nameOfJob,
			String status, String comments) {
		super();
		this.id = id;
		this.workOrderID = workOrderID;
		FreeLancerName = freeLancerName;
		this.price = price;
		this.month = month;
		this.finishDate = finishDate;
		this.nameOfJob = nameOfJob;
		this.status = status;
		this.comments = comments;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public JobRequest(int id, int workOrderID, String freeLancerName,
			int month, String nameOfJob,
			String status) {
		super();
		this.id = id;
		this.workOrderID = workOrderID;
		FreeLancerName = freeLancerName;
		this.price = 0;
		this.month = month;
		this.nameOfJob = nameOfJob;
		this.status = status;
		this.comments = "";
		this.finishDate="";
	}
	
	@Override
	public String toString() {
		return "JobRequest [id=" + id + ", workOrderID=" + workOrderID
				+ ", FreeLancerName=" + FreeLancerName + ", price=" + price
				+ ", month=" + month + ", finishDate=" + finishDate
				+ ", nameOfJob=" + nameOfJob + ", status=" + status
				+ ", comments=" + comments + "]";
	}

	public int getWorkOrderID() {
		return workOrderID;
	}
	public void setWorkOrderID(int workOrderID) {
		this.workOrderID = workOrderID;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFreeLancerName() {
		return FreeLancerName;
	}
	public void setFreeLancerName(String freeLancerName) {
		FreeLancerName = freeLancerName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public String getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}
	public String getNameOfJob() {
		return nameOfJob;
	}
	public void setNameOfJob(String nameOfJob) {
		this.nameOfJob = nameOfJob;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public static void main(String args0[])
	{
		Session session= null;
		SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
		session = factory.openSession();
		JobRequest job = new JobRequest(1, 2, "Koby", 2, "Hello", "Opened");
		session.beginTransaction();
		session.save(job);
		session.beginTransaction().commit();
		session.close();
	}
	
}