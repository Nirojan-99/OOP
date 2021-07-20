package service;

import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.Invitation;
import model.event;

public class InvitationService {
	
	public static void createInvitation(Invitation invi) {
		DBconn database = new DBconn();
	
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("UPDATE invitation SET venue = ? , description = ? , inviter = ? WHERE eventid  =? "); 
			stmt.setString(1, invi.getVenue());
			stmt.setString(2, invi.getDescription());
			stmt.setString(3, invi.getInviter());
			stmt.setInt(4, invi.getEid());
			
			int rs =stmt.executeUpdate(); 
			
			
		} catch (Exception e) {
			
		} 
	
	}
	
	
	public static Invitation returnInvitation(event ev) {
		DBconn database = new DBconn();
		Invitation invi = new Invitation();
	
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT * FROM invitation WHERE eventid  = ? "); 
			stmt.setInt(1, Integer.parseInt(ev.getId()));
			
			
			ResultSet rs =stmt.executeQuery(); 
			
			while(rs.next()) {
				invi.setDate(rs.getString("date"));
				invi.setDescription(rs.getString("description"));
				invi.setEid(rs.getInt("eventid"));
				invi.setId(rs.getInt("id"));
				invi.setInviter(rs.getString("inviter"));
				invi.setName(rs.getString("name"));
				invi.setVenue(rs.getString("venue"));
			}
			
		} catch (Exception e) {
			
		} 
	return invi;
	
	}
	
	public static Invitation returnInvitation(int id) {
		DBconn database = new DBconn();
		Invitation invi = new Invitation();
	
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT * FROM invitation WHERE id  = ? "); 
			stmt.setInt(1, id);
			
			
			ResultSet rs =stmt.executeQuery(); 
			
			while(rs.next()) {
				invi.setDate(rs.getString("date"));
				invi.setDescription(rs.getString("description"));
				invi.setEid(rs.getInt("eventid"));
				invi.setId(rs.getInt("id"));
				invi.setInviter(rs.getString("inviter"));
				invi.setName(rs.getString("name"));
				invi.setVenue(rs.getString("venue"));
			}
			
		} catch (Exception e) {
			
		} 
	return invi;
	
	}
	
	public static int returnInvitationID(int eid) {
		DBconn database = new DBconn();
		int inviId = 0;
		
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT id FROM invitation WHERE eventid  = ? "); 
			stmt.setInt(1, eid);
			
			
			ResultSet rs =stmt.executeQuery(); 
			
			while(rs.next()) {
				inviId = rs.getInt("id");

			}
			
		} catch (Exception e) {
			
		} 
	return inviId;
	
	}
}
