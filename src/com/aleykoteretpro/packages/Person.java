package com.aleykoteretpro.packages;

public class Person {
/**A class representing a Person entity.
* @author Koby Risko
* @author Liran Bar
*/
	
	private int id;
	private String firstName;
	private String lastName;
	private String phone;
	private String email;
	private String adress;


	public Person() {}

	public Person(int id, String firstName, String lastName,
			String phone, String email, String adress) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.email = email;
		this.adress=adress;
	}
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAdress() {
		return adress;
	}


	public void setAdress(String adress) {
		this.adress = adress;
	}



	@Override
	public String toString() {
		return "Person [id=" + id + ", firstName=" + firstName + ", lastName="
				+ lastName + ", phone=" + phone + ", email=" + email
				+ ", adress=" + adress + "]";
	}

		
}
