package com.aleykoteretpro.packages;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class Trans extends Person 
{
/**A class representing a Translator entity.
* Extends the Person class
* @author Koby Risko
* @author Liran Bar
*/
	Trans(){}
private String transCode;
private double transPrice;
private String languages;

public Trans(int id, String firstName, String lastName,
		String phone, String email,String adress, double 
		transPrice, String transCode, String languages) 
{
	super(id, firstName, lastName, phone, email, adress);
	// TODO Auto-generated constructor stub
	this.transPrice=transPrice;
	this.transCode=transCode;
	this.languages=languages;
}

public String getLanguages() {
	return languages;
}

public void setLanguages(String languages) {
	this.languages = languages;
}
public String getTransCode() {
	return transCode;
}
public void setTransCode(String transCode) {
	this.transCode = transCode;
}
public double getTransPrice() {
	return transPrice;
}
public void setTransPrice(double transPrice) {
	this.transPrice = transPrice;
}
public String toString() {
	return "Person [id=" + getId() + ", firstName=" + getFirstName() + ", lastName="
			+ getLastName() + ", phone=" + getPhone() + ", email=" + getEmail()
			+ ", adress=" + getAdress() +", transPrice=" + getTransPrice()
			+ ", transCode="+ getTransCode() +", languages="+getLanguages()+"]";
	
}
public static void main(String[] args0)
{
Trans newtr= new Trans(1, "firstName", "lastName", "phone", "email", "adress", 3.5, "KR1","Hebrew");
//creating factory for getting sessions
SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
//creating a new session for adding products
Session session = factory.openSession();
session.beginTransaction();
session.save(newtr);
session.beginTransaction().commit();
session.close();
Session anotherSession = factory.openSession();
anotherSession.beginTransaction();
List trans = anotherSession.createQuery("from Trans").list();
System.out.println("There are " + trans.size() + " Translators(s)");
Iterator i = trans.iterator();
while(i.hasNext()) 
{
	System.out.println(i.next());
}
anotherSession.close();
}


}
