package model;

public class Inquirys {
	@Override
	public String toString() {
		return "Inquirys [id=" + id + ", name=" + name + ", email=" + email + ", number=" + number + ", inquiry="
				+ inquiry + "]";
	}
	private String id;
	private String name;
	private String email;
	private String number;
	private String inquiry;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getInquiry() {
		return inquiry;
	}
	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}
	
	
}
