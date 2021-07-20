package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Inquirys;
import model.customer;
import model.event;
import service.CustomerService;
import service.InquiryService;
import service.eventService;


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		HttpSession session = request.getSession();
		String uname = request.getParameter("username");
		String pass = request.getParameter("password");
		
		if(uname.equals("admin@gmail.com") && pass.equals("1111")) {
			session.setAttribute("loginerror", "");
			
			ArrayList<event> eventList = eventService.returnEventList();
			
			session.setAttribute("uname", uname);
			session.setAttribute("admin", true);
			session.setAttribute("eventList", eventList);
			
			ArrayList<Inquirys> inquiryList = InquiryService.returnInquiryList();
			session.setAttribute("inquiryList", inquiryList);
			
			response.sendRedirect("admin.jsp");
		}
		else {
			CustomerService cs = new CustomerService();
			
			boolean verify = cs.verify(uname, pass);
			
			if(verify == true) {
				
				session.setAttribute("uname", uname);
				session.setAttribute("loginerror", "");
				customer cus = CustomerService.returnCustomer(uname);
				ArrayList<event> events = CustomerService.returnEvent(cus.getId());
				session.setAttribute("events", events);
				session.setAttribute("user", cus);
				response.sendRedirect("profile.jsp");
				
			}
			else {
				session.setAttribute("loginerror", "invalid details");
				response.sendRedirect("login.jsp");
			}
		}
		
		
		

	}


}


