package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PriceDetails;
import model.customer;
import model.event;
import service.CustomerService;
import service.eventService;


@WebServlet("/eventCreate")
public class eventCreate extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("event");
		String photo = request.getParameter("photo");
		String catering = request.getParameter("catering");
		String electric = request.getParameter("electric");
		String flower = request.getParameter("flower");
		String date = request.getParameter("date");
		int attendees = Integer.parseInt(request.getParameter("attendees"));
		
		event event1 = new event();
		
		event1.setName(name);
		event1.setAttendees(attendees);
		event1.setPhotography(photo);
		event1.setCatering(catering);
		event1.setDate(date);
		event1.setElectric_decoration(electric);
		event1.setFlower_decoration(flower);
		
		
		HttpSession session = request.getSession();
		
		PriceDetails pd = new PriceDetails();
		double total = pd.returnTotal(event1);
		
		session.setAttribute("createdEvent", event1);
		session.setAttribute("total", total);
		
		
		response.sendRedirect("payment.jsp");
		
		
	}

}
