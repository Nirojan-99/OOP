package service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.customer;
import model.event;

public class CustomerService {
	
	//add customer
	public static void addCustomer(customer cus) {
		DBconn database = new DBconn();
		try {
			Connection con = (Connection) database.addConnection();
			 
//			String name =  cus.getName();
//			String number  = cus.getNumber();
//			String email = cus.getEmail_id();
//			String pass  = cus.getPassword().toString();
//	
//			Statement stmt = con.createStatement();
//			String sql = "INSERT into customer(name,mobile,email,password) VALUES ("+name+","+number+","+email+","+pass+")";
//			
//			stmt.executeUpdate(sql);  
			


			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("insert into customer(name,mobile,email,password) values(?,?,?,?)"); 
			stmt.setString(1, cus.getName());
			stmt.setString(2, cus.getNumber());
			stmt.setString(3, cus.getEmail_id());
			stmt.setString(4, cus.getPassword());
			
			int i=stmt.executeUpdate();  
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
}
	
	public static boolean isMailExist(String mail) {
		DBconn database = new DBconn();
		boolean x = false;
		
		Connection con;
		try {
			con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT * FROM customer WHERE email = ?"); 
			stmt.setString(1, mail);
			
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				x= true;
			}
			else {
				x = false;
			}
		} catch (ClassNotFoundException | SQLException e) {
			//
		}
		
		return x;
		
	}
	
	//login
	public boolean verify(String uname , String pass) {
		DBconn database = new DBconn();
		boolean verify = false;
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT * FROM customer WHERE email = ? AND password = ?"); 
			stmt.setString(1, uname);
			stmt.setString(2, pass);
			
			ResultSet rs =stmt.executeQuery(); 
			
			if(rs.next()) {
				verify = true;
			}
			
		} catch (Exception e) {
			
		} 
		
		return verify;
	}
	
	
	public static customer returnCustomer(String mail) {
		DBconn database = new DBconn();
		customer cus1 = new customer();
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT * FROM customer WHERE email = ? "); 
			stmt.setString(1, mail);
			
			ResultSet rs =stmt.executeQuery(); 
			
			if(rs.next()) {
				customer cus = new customer();
				cus.setEmail_id(rs.getString("email"));
				cus.setId(rs.getString("id"));
				cus.setName(rs.getString("name"));
				cus.setNumber(rs.getString("mobile"));
				cus.setPassword(rs.getString("password"));
				cus.setUrl(rs.getString("url"));
				
				cus1 =  cus;
			}
			
		} catch (Exception e) {
			
		} 
		return cus1;
	}
	
	//event
	public static ArrayList<event> returnEvent(String mail) {
		DBconn database = new DBconn();
		ArrayList<event> evs = new ArrayList<>();	
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT * FROM events WHERE cid = ? "); 
			stmt.setString(1, mail);
			
			ResultSet rs =stmt.executeQuery(); 
			
			while(rs.next()) {
				event ev = new event();
				
				ev.setId(rs.getString("id"));
				ev.setName(rs.getString("name"));
				ev.setConfirmed(rs.getBoolean("confirmed"));
				
				evs.add(ev);
			}
			
		} catch (Exception e) {
			
		} 
		return evs;
	}
	
	
	public static void updateCustomer(customer cus) {
		DBconn database = new DBconn();
			
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("UPDATE customer SET name = ? ,email = ? , password = ? ,mobile = ? WHERE id = ? "); 
			stmt.setString(1, cus.getName());
			stmt.setString(2, cus.getEmail_id());
			stmt.setString(3, cus.getPassword());
			stmt.setString(4, cus.getNumber());
			stmt.setString(5, cus.getId());
			
			int rs =stmt.executeUpdate(); 
			
			
		} catch (Exception e) {
			
		} 
		
	}
	
	public static boolean deleteCustomer(customer cus) {
		DBconn database = new DBconn();
		boolean result = false;
			
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt1=(PreparedStatement) con.prepareStatement("SELECT password FROM customer WHERE email = ? "); 
			stmt1.setString(1, cus.getEmail_id());
			ResultSet rs1 =stmt1.executeQuery();
			
			rs1.next();
			
			if(rs1.getString("password").equals(cus.getPassword())) {
				
				PreparedStatement stmt=(PreparedStatement) con.prepareStatement("DELETE customer WHERE email = ? "); 
				stmt.setString(1, cus.getEmail_id());
				int rs =stmt.executeUpdate();
				
				result = true;
				
			}
			else {
				result = false;
			}
			
			
		} catch (Exception e) {
			
		} 
		
		return result;
	}
	
	public static void updateImage(String mail , String url) {
		DBconn database = new DBconn();
			
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("UPDATE customer SET url = ? WHERE email = ? "); 
			stmt.setString(1, url);
			stmt.setString(2, mail);
			
			int rs =stmt.executeUpdate(); 
			
			
		} catch (Exception e) {
			
		} 
		
	}
	
	public static void deleteImage(String mail ) {
		DBconn database = new DBconn();
			
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("UPDATE customer SET url = DEFAULT WHERE email = ? "); 
			stmt.setString(1, mail);
			
			int rs =stmt.executeUpdate(); 
			
			
		} catch (Exception e) {
			
		} 
		
	}
	
	
	public static void createOTP(String mail ,int otp ) {
		DBconn database = new DBconn();
			
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("INSERT INTO verification(mail,otp) VALUES (?,?) "); 
			stmt.setString(1, mail);
			stmt.setInt(2, otp);
			
			int rs =stmt.executeUpdate(); 
			
			
		} catch (Exception e) {
			
		} 
		
	}
	
	public static int returnOTP(String mail ) {
		DBconn database = new DBconn();
		int otp = 0;
			
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT * FROM verification WHERE mail =? "); 
			stmt.setString(1, mail);
			
			ResultSet rs =stmt.executeQuery(); 
			
			if(rs.next()) {
				otp = rs.getInt("otp");
			}
			
		} catch (Exception e) {
			
		} 
		return otp;
	}
	
	public static void removeOTP(String mail ) {
		DBconn database = new DBconn();
			
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("DELETE FROM verification WHERE mail =? "); 
			stmt.setString(1, mail);
			
			int rs =stmt.executeUpdate(); 
			
	
			
		} catch (Exception e) {
			
		} 
		
	}
	
	public static void updatePassword(String mail , String pass) {
		DBconn database = new DBconn();
			
		try {
			Connection con = (Connection) database.addConnection();
			
			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("UPDATE customer SET password = ?  WHERE email = ? "); 
			stmt.setString(1, pass );
			stmt.setString(2, mail);
			
			int rs =stmt.executeUpdate(); 
			
			
		} catch (Exception e) {
			
		} 
		
	}
	
	
}
