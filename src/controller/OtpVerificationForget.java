package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.customer;
import model.event;
import service.CustomerService;

@WebServlet("/OtpVerificationForget")
public class OtpVerificationForget extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int otp = Integer.parseInt(request.getParameter("otp"));
		
		HttpSession session = request.getSession();
		String mail = (String) session.getAttribute("uname");
		
		int dbotp = CustomerService.returnOTP(mail);
		
		if(otp == dbotp) {
			customer cus1 = CustomerService.returnCustomer(mail);
			ArrayList<event> events = CustomerService.returnEvent(mail);
			
			session.setAttribute("events", events);
			session.setAttribute("user", cus1);
			session.setAttribute("isValidOtp", true);
			session.setAttribute("errormsg", "");
			
			CustomerService.removeOTP(mail);
			
			response.sendRedirect("reset_password.jsp");
		}
		else {
			session.setAttribute("errormsg", "invalid OTP");
			session.setAttribute("isValidOtp", false);
			response.sendRedirect("reset_password.jsp");
		}
	}

}
