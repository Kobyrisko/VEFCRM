package com.aleykoteretpro.packages;

import java.lang.reflect.Field;

public class WorkOrder 
{
private int id;
private String client;
private String nameOfJob;
private String job;
private String lang1;
private String lang2;
private String length;
private String translator;
private String timlol;
private String status;
private String startDate;
private String finishDate;
private int price;
private String clientGet;
private String notifications;

WorkOrder() //default contractor
{
/**A class representing a Work Order entity.
* @author Koby Risko
* @author Liran Bar
*/
this.status= "Opend";
}

public static void main(String[] args0)
{
	
	WorkOrder wo= new WorkOrder();
	System.out.println(wo);
	Field[] fields = WorkOrder.class.getFields();
	for(int i=0;i<fields.length;i++)
		System.out.println(fields[i].getName());

}

public WorkOrder(int id, String client, String job, String lang1, String lang2,
		String length, String translator, String timlol, String status,
		String startDate, String finishDate, int price, String clientGet, String notifications, String nameOfJob) {
	super();
	this.id = id;
	this.client = client;
	this.job = job;
	this.lang1 = lang1;
	this.lang2 = lang2;
	this.length = length;
	this.translator = translator;
	this.timlol = timlol;
	this.status = status;
	this.startDate = startDate;
	this.finishDate = finishDate;
	this.price = price;
	this.clientGet = clientGet;
	this.notifications= notifications;
	this.nameOfJob= nameOfJob;
}

public String getNameOfJob() {
	return nameOfJob;
}

public void setNameOfJob(String nameOfJob) {
	this.nameOfJob = nameOfJob;
}

public String getClientGet() {
	return clientGet;
}

public void setClientGet(String clientGet) {
	this.clientGet = clientGet;
}

public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}


public String getClient() {
	return client;
}


public void setClient(String client) {
	this.client = client;
}


public String getJob() {
	return job;
}


public void setJob(String job) {
	this.job = job;
}


public String getLang1() {
	return lang1;
}


public void setLang1(String lang1) {
	this.lang1 = lang1;
}


public String getLang2() {
	return lang2;
}


public void setLang2(String lang2) {
	this.lang2 = lang2;
}


public String getLength() {
	return length;
}


public void setLength(String length) {
	this.length = length;
}


public String getTranslator() {
	return translator;
}


public void setTranslator(String translator) {
	this.translator = translator;
}


public String getTimlol() {
	return timlol;
}


public void setTimlol(String timlol) {
	this.timlol = timlol;
}


public String getStatus() {
	return status;
}


public void setStatus(String status) {
	this.status = status;
}


public String getStartDate() {
	return startDate;
}


public void setStartDate(String startDate) {
	this.startDate = startDate;
}


public String getFinishDate() {
	return finishDate;
}


public void setFinishDate(String finishDate) {
	this.finishDate = finishDate;
}


public int getPrice() {
	return price;
}


public void setPrice(int price) {
	this.price = price;
}


public String getNotifications() {
	return notifications;
}

public void setNotifications(String notifications) {
	this.notifications = notifications;
}

@Override
public String toString() {
	return "WorkOrder [id=" + id + ", client=" + client + ", job=" + job
			+ ", lang1=" + lang1 + ", lang2=" + lang2 + ", length=" + length
			+ ", translator=" + translator + ", timlol=" + timlol + ", status="
			+ status + ", startDate=" + startDate + ", finishDate="
			+ finishDate + ", price=" + price + ", clientGet="+ clientGet+ ", notifications="+notifications+","
					+ "nameOfJob=" + nameOfJob+"]";
}



	
	
	
	
}
