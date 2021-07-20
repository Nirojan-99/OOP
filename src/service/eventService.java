package service;

import java.sql.Date;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.customer;
import model.event;

public class eventService {
	
	public static void createEvent(event ev , customer cus) {
		DBconn database = new DBconn();
		
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("INSERT INTO events(name,cid,photography,catering,electric,flower,e_date,attendees) VALUES (?,?,?,?,?,?,?,?) "); 
			
			 //Date date1=(Date) new SimpleDateFormat("dd/MM/yyyy").parse(ev.getDate());  
			
			stmt.setString(1, ev.getName());
			stmt.setString(2, cus.getId());
			stmt.setString(3, ev.getPhotography());
			stmt.setString(4, ev.getCatering());
			stmt.setString(5, ev.getElectric_decoration());
			stmt.setString(6, ev.getFlower_decoration());
			stmt.setString(7, ev.getDate());
			stmt.setInt(8, ev.getAttendees());
			
			int rs =stmt.executeUpdate(); 
			
			PreparedStatement stmt2=(PreparedStatement) con.prepareStatement("SELECT id FROM events WHERE cid = ? ORDER BY id DESC LIMIT 1");
			stmt2.setString(1, cus.getId());
			
			ResultSet rs2 =stmt2.executeQuery();
			
			rs2.next();
			
			int eventid  = rs2.getInt("id");
			
			
					
			PreparedStatement stmt1=(PreparedStatement) con.prepareStatement("INSERT INTO invitees(eventid ) VALUES (?)");
			stmt1.setInt(1, eventid);
			
			
			try {
				int rs1 =stmt1.executeUpdate();
			}
			catch(Exception e){
				System.out.print(e);
			}
			
			PreparedStatement stmt3=(PreparedStatement) con.prepareStatement("INSERT INTO invitation(eventid , date , name ) VALUES (?,?,?)");
			stmt3.setInt(1, eventid);
			stmt3.setString(2, ev.getDate());
			stmt3.setString(3, ev.getName());
			
			try {
				int rs3 =stmt3.executeUpdate();
			} catch (Exception e) {
				System.out.print(e);
			}
			
		} catch (Exception e) {
			
		} 
		
	}
	
	
	public static event returnEvent(int i) {
		event ev = new event();
		
		DBconn database = new DBconn();
		
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT * FROM events WHERE id = ? "); 
			
			 //Date date1=(Date) new SimpleDateFormat("dd/MM/yyyy").parse(ev.getDate());  
			
			stmt.setInt(1, i);
			
			ResultSet rs =stmt.executeQuery(); 
			
			if(rs.next()) {
				ev.setId(rs.getString("id"));
				ev.setDate(rs.getString("e_date"));
				ev.setAttendees(rs.getInt("attendees"));
				ev.setCatering(rs.getString("catering"));
				ev.setElectric_decoration(rs.getString("electric"));
				ev.setFlower_decoration(rs.getString("flower"));
				ev.setName(rs.getString("name"));
				ev.setCid(rs.getInt("cid"));
				ev.setPhotography(rs.getString("photography"));
				ev.setConfirmed(rs.getBoolean("confirmed"));
			}
			
			
			
		} catch (Exception e) {
			System.out.print("error");
		} 
		return ev;
	}
	
	
	public static void updateEvent(event ev , String list) {
		
		DBconn database = new DBconn();
		
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("UPDATE events SET name =? , photography = ? , catering = ? , electric  = ? , flower = ? , e_date = ? , attendees = ? WHERE id = ? "); 
			  
			
			stmt.setString(1, ev.getName());
			stmt.setString(2, ev.getPhotography());
			stmt.setString(3, ev.getCatering());
			stmt.setString(4, ev.getElectric_decoration());
			stmt.setString(5, ev.getFlower_decoration());
			stmt.setString(6, ev.getDate());
			stmt.setInt(7, ev.getAttendees());
			stmt.setString(8, ev.getId());
			
			int rs =stmt.executeUpdate(); 
			
			PreparedStatement stmt1=(PreparedStatement) con.prepareStatement("UPDATE invitees SET  mail_list = ? WHERE eventid = ? ");
			stmt1.setString(2, ev.getId());
			stmt1.setString(1, list);
			
			int rs1 =stmt1.executeUpdate(); 
			
		} catch (Exception e) {
			System.out.print(e);
		} 
	}
	
	public static String returnList(event ev) {
		String list = "";
		DBconn database = new DBconn();
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("select mail_list from invitees WHERE eventid= ? "); 
			
			stmt.setString(1, ev.getId());
			
			ResultSet rs1 =stmt.executeQuery(); 
			
			while(rs1.next()) {
				list = rs1.getString("mail_list");
			}
			  
			
		} catch (Exception e) {
			System.out.print("error");
		}
		
		return list;
	}
	
	public static ArrayList<event> returnEventList() {
		DBconn database = new DBconn();
		ArrayList<event> eventList = new ArrayList<>();	
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT * FROM events ORDER BY e_date ASC "); 

			
			ResultSet rs =stmt.executeQuery(); 
			
			while(rs.next()) {
				event ev = new event();
				
				ev.setId(rs.getString("id"));
				ev.setName(rs.getString("name"));
				ev.setAttendees(rs.getInt("attendees"));
				ev.setCatering(rs.getString("catering"));
				ev.setCid(rs.getInt("cid"));
				ev.setDate(rs.getString("e_date"));
				ev.setElectric_decoration(rs.getString("electric"));
				ev.setFlower_decoration(rs.getString("flower"));
				ev.setPhotography(rs.getString("photography"));
				ev.setConfirmed(rs.getBoolean("confirmed"));
				
				eventList.add(ev);
			}
			
		} catch (Exception e) {
			
		} 
		return eventList;
	}
	
	
	public static void confirmEvent(int id) {
		DBconn database = new DBconn();
		
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("UPDATE events SET confirmed = true WHERE id = ? "); 
			stmt.setInt(1, id);
			
			int rs =stmt.executeUpdate(); 
						
			
		} catch (Exception e) {
			System.out.print("error");
		} 
	
	}
	
	
	public static void removeEvent(int id) {		
		DBconn database = new DBconn();
		
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("DELETE FROM events WHERE id = ? "); 
			PreparedStatement stmt1=(PreparedStatement) con.prepareStatement("DELETE FROM invitation WHERE eventid = ? "); 
			PreparedStatement stmt2=(PreparedStatement) con.prepareStatement("DELETE FROM invitees WHERE eventid = ? "); 
	
			stmt.setInt(1, id);
			stmt1.setInt(1, id);
			stmt2.setInt(1, id);
			
			int rs =stmt.executeUpdate();
			int rs1 =stmt1.executeUpdate();
			int rs2 =stmt2.executeUpdate();
						
			
		} catch (Exception e) {
			System.out.print(e);
		} 
		
	}
	
	
	public static String returnFullList(int id) {
		String list = "";
		DBconn database = new DBconn();
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("select mail_list from invitees i , events e WHERE e.cid= ? AND i.eventId = e.id "); 
			
			stmt.setInt(1, id);
			
			ResultSet rs1 =stmt.executeQuery(); 
			
			while(rs1.next()) {
				list += rs1.getString("mail_list")+"\r\n";
			}
			  
			
		} catch (Exception e) {
			System.out.print("error");
		}
		
		return list;
	}
	
	public static String returnEventOwner(int id) {
		DBconn database = new DBconn();
		String mail = "";
		
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT  c.email FROM customer c, events e WHERE e.id= ? AND e.cid = c.id"); 
			
			stmt.setInt(1, id);
			
			ResultSet rs1 =stmt.executeQuery(); 
			
			while(rs1.next()) {
				mail = rs1.getString("email");
			}
			  
			
		} catch (Exception e) {
			System.out.print("error");
		}
		
		return mail;
	}
}
