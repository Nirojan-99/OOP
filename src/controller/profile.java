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


@WebServlet("/profile")
public class profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public profile() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =  request.getSession();
		if(session.getAttribute("uname") == null) {
			response.sendRedirect("login.jsp");
		}
		else {
			customer cus = (customer)session.getAttribute("user");
			ArrayList<event> events = CustomerService.returnEvent(cus.getId());
			session.setAttribute("events", events);
			response.sendRedirect("profile.jsp");
		}
	}


}
