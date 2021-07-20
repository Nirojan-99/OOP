package model;

public class event {
	private String id;
	private int cid;
	private String name;
	private String photography;
	private String catering;
	private String electric_decoration;
	private String flower_decoration;
	private String date;
	private int attendees;
	private boolean confirmed; 
	
	
	
	public boolean isConfirmed() {
		return confirmed;
	}
	public void setConfirmed(boolean confirmed) {
		this.confirmed = confirmed;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getPhotography() {
		return photography;
	}
	public void setPhotography(String photography) {
		this.photography = photography;
	}
	public String getCatering() {
		return catering;
	}
	public void setCatering(String catering) {
		this.catering = catering;
	}
	public String getElectric_decoration() {
		return electric_decoration;
	}
	public void setElectric_decoration(String electric_decoration) {
		this.electric_decoration = electric_decoration;
	}
	public String getFlower_decoration() {
		return flower_decoration;
	}
	public void setFlower_decoration(String flower_decoration) {
		this.flower_decoration = flower_decoration;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getAttendees() {
		return attendees;
	}
	public void setAttendees(int attendees) {
		this.attendees = attendees;
	}
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
	@Override
	public String toString() {
		return "event [id=" + id + ", cid=" + cid + ", name=" + name + ", photography=" + photography + ", catering="
				+ catering + ", electric_decoration=" + electric_decoration + ", flower_decoration=" + flower_decoration
				+ ", date=" + date + ", attendees=" + attendees + "]";
	}
	
	
	
}
