package service;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.Inquirys;
import model.customer;
import model.event;

public class InquiryService {
	
	public static void newInquiry(Inquirys inq) {
		DBconn database = new DBconn();
	
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("INSERT INTO inquiry (name,mobile,mail,inquiry) VALUES (?,?,?,?)"); 
			stmt.setString(1, inq.getName());
			stmt.setString(2, inq.getNumber());
			stmt.setString(3, inq.getEmail());
			stmt.setString(4, inq.getInquiry());
			
			int s = stmt.executeUpdate(); 
			System.out.print(s);
			
			
		} catch (Exception e) {
			
		} 
		
		
	}
	
	
	public static void userInquiry(Inquirys inq , customer cus) {
		DBconn database = new DBconn();
	
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("INSERT INTO inquiry (name,mobile,mail,inquiry) VALUES (?,?,?,?)"); 
			stmt.setString(1, inq.getName());
			stmt.setString(2, inq.getNumber());
			stmt.setString(3, cus.getEmail_id());
			stmt.setString(4, inq.getInquiry());
			
			int s = stmt.executeUpdate(); 
			
			
		} catch (Exception e) {
			
		} 
		
		
	}
	
	public static ArrayList<Inquirys> returnInquiryList() {
		DBconn database = new DBconn();
		ArrayList<Inquirys> InquiryList = new ArrayList<>();	
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT * FROM inquiry  "); 

			
			ResultSet rs =stmt.executeQuery(); 
			
			while(rs.next()) {
				Inquirys inq = new Inquirys();
				
				inq.setEmail(rs.getString("mail"));
				inq.setId(rs.getInt("id")+"");
				inq.setInquiry(rs.getString("inquiry"));
				inq.setName(rs.getString("name"));
				inq.setNumber(rs.getString("mobile"));
				
				InquiryList.add(inq);
			}
			
		} catch (Exception e) {
			
		} 
		return InquiryList;
	}
	
	public static void deleteInquiry(int id) {
		DBconn database = new DBconn();
	
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("DELETE FROM inquiry WHERE id =?"); 
			stmt.setInt(1, id);
			
			int s = stmt.executeUpdate(); 
			
			
		} catch (Exception e) {
			
		} 
	}
		
		
	
}
