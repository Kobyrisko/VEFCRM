package com.aleykoteretpro.packages;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class Timlol extends Person 
{
/**A class representing a Transcriptor entity.
* Extends the Person class
* @author Koby Risko
* @author Liran Bar
*/
Timlol(){}
private String timlolCode;
private double timlolPrice;

public Timlol(int id, String firstName, String lastName,
		String phone, String email,String adress, double 
		timlolPrice, String timlolCode) 
{
	super(id, firstName, lastName, phone, email, adress);
	// TODO Auto-generated constructor stub
	this.timlolPrice=timlolPrice;
	this.timlolCode=timlolCode;
}


public String getTimlolCode() {
	return timlolCode;
}
public void setTimlolCode(String timlolCode) {
	this.timlolCode = timlolCode;
}
public double getTimlolPrice() {
	return timlolPrice;
}
public void setTimlolPrice(double timlolPrice) {
	this.timlolPrice = timlolPrice;
}
public String toString() {
	return "Person [id=" + getId() + ", firstName=" + getFirstName() + ", lastName="
			+ getLastName() + ", phone=" + getPhone() + ", email=" + getEmail()
			+ ", adress=" + getAdress() +", timlolPrice=" + getTimlolPrice()
			+ ", timlolCode="+ getTimlolCode() +"]";
	
}
public static void main(String[] args0)
{
Timlol newtm= new Timlol(1, "firstName", "lastName", "phone", "email", "adress", 3.5, "KR1");
//creating factory for getting sessions
SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
//creating a new session for adding products
Session session = factory.openSession();
session.beginTransaction();
session.save(newtm);
session.beginTransaction().commit();
session.close();
Session anotherSession = factory.openSession();
anotherSession.beginTransaction();
List timlol = anotherSession.createQuery("from Timlol").list();
System.out.println("There are " + timlol.size() + " timlol(s)");
Iterator i = timlol.iterator();
while(i.hasNext()) 
{
	System.out.println(i.next());
}
anotherSession.close();
}


}
