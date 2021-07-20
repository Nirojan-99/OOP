package model;

public class Invitation {
	private int id;
	private int eid;
	private String date;
	private String name;
	private String venue;
	private String description;
	private String inviter;
	
	
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getInviter() {
		return inviter;
	}
	public void setInviter(String inviter) {
		this.inviter = inviter;
	}
	@Override
	public String toString() {
		return "Invitation [id=" + id + ", eid=" + eid + ", date=" + date + ", name=" + name + ", venue=" + venue
				+ ", description=" + description + ", inviter=" + inviter + "]";
	}
	
	
	
}
