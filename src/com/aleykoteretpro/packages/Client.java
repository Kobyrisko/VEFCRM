package com.aleykoteretpro.packages;
import java.io.ObjectInputStream.GetField;
import java.lang.reflect.Field;

public class Client extends Person 
{
/**A class representing a Client entity.
 * Extends the Person class
 * @author Koby Risko
 * @author Liran Bar
 */
	private String companyName;
	private String companyCode;
	public Client(){}; 
	public Client(int id, String firstName, String lastName,
			String phone, String email,String adress, String 
			companyName, String companyCode) 
	{
		super(id, firstName, lastName, phone, email, adress);
		// TODO Auto-generated constructor stub
		this.companyName=companyName;
		this.companyCode=companyCode;
		//this.userName=userName;
		//this.passWord=passWord;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	@Override
	public String toString() {
		return "Person [id=" + getId() + ", firstName=" + getFirstName() + ", lastName="
				+ getLastName() + ", phone=" + getPhone() + ", email=" + getEmail()
				+ ", adress=" + getAdress() +", companyName=" + getCompanyName()
				+ ", companyCode="+ getCompanyCode() +"]";
	}
	
	
	public static void main(String args0[])
	{
	}
}
