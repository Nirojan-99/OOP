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


@WebServlet("/OtpVerification")
public class OtpVerification extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int otp = Integer.parseInt(request.getParameter("otp"));
		HttpSession session = request.getSession();
		
		customer cus  = (customer)session.getAttribute("OTPcus");
		
		System.out.print(cus);
		
		int dbotp = CustomerService.returnOTP(cus.getEmail_id());
		
		if(otp == dbotp) {
			CustomerService.addCustomer(cus);
			session.setAttribute("uname", cus.getEmail_id());
			customer cus1 = CustomerService.returnCustomer(cus.getEmail_id());
			ArrayList<event> events = CustomerService.returnEvent(cus.getId());
			session.setAttribute("events", events);
			session.setAttribute("user", cus1);
			session.setAttribute("OTPcus", null);
			session.setAttribute("signup", null);
			
			CustomerService.removeOTP(cus1.getEmail_id());
			response.sendRedirect("profile.jsp");
		}
		else {
			response.sendRedirect("verification.jsp");
		}
	}

}
