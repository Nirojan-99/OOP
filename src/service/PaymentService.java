package service;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.Payment;
import model.customer;

public class PaymentService {
	
	public static void addPayment(Payment pay) {
		DBconn database = new DBconn();
		try {
			Connection con = (Connection) database.addConnection();

			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("insert into payment(cusId,cardNo,year,month,cvc,ownerName) values(?,?,?,?,?,?)"); 
			stmt.setInt(1, pay.getCusId());
			stmt.setInt(2, pay.getCardNo());
			stmt.setInt(3, pay.getYear());
			stmt.setInt(4, pay.getMonth());
			stmt.setInt(5, pay.getCvc());
			stmt.setString(6, pay.getOwnerName());
			
			int i=stmt.executeUpdate();  
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	public static Payment returnPayment(int id) {
		DBconn database = new DBconn();
		Payment pay = new Payment();
		
		try {
			Connection con = (Connection) database.addConnection();

			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("SELECT * FROM payment WHERE cusId = ?"); 
			stmt.setInt(1, id);
			
			ResultSet rs =stmt.executeQuery();  
			
			if(rs.next()) {
				pay.setCardNo(rs.getInt("cardNo"));
				pay.setCusId(id);
				pay.setCvc(rs.getInt("cvc"));
				pay.setId(rs.getInt("id"));
				pay.setMonth(rs.getInt("month"));
				pay.setOwnerName(rs.getString("ownerName"));
				pay.setYear(rs.getInt("year"));
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		return pay;
	}
	
	
	public static void removePayment(int id) {
		DBconn database = new DBconn();
		try {
			Connection con = (Connection) database.addConnection();

			PreparedStatement stmt=(PreparedStatement) con.prepareStatement("DELETE FROM payment WHERE cusId = ?"); 
			stmt.setInt(1, id);
			
			int i=stmt.executeUpdate();  
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
	}
}
