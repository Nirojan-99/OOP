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
import service.InvitationService;
import service.MailService;
import service.eventService;


@WebServlet("/editevent")
public class editevent extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		event ev  = (event)session.getAttribute("eventsession");
		customer cus = (customer)session.getAttribute("user");
		
		String name1 = request.getParameter("createE");
		
		if(name1.equals("Update Event")) {
		String name = request.getParameter("event");
		String photo = request.getParameter("photo");
		String catering = request.getParameter("catering");
		String electric = request.getParameter("electric");
		String flower = request.getParameter("flower");
		String date = request.getParameter("date");
		int attendees = Integer.parseInt(request.getParameter("attendees"));
		String id = ev.getId() ;
		String list = request.getParameter("list");
		
		event ev1 = new event();
		
		ev1.setAttendees(attendees);
		ev1.setCatering(catering);
		ev1.setDate(date);
		ev1.setElectric_decoration(electric);
		ev1.setFlower_decoration(flower);
		ev1.setId(id);
		ev1.setName(name);
		ev1.setPhotography(photo);
		
		eventService.updateEvent(ev1,list);
		
		ArrayList<event> events = CustomerService.returnEvent(cus.getId());
		session.setAttribute("events", events);
		
		response.sendRedirect("profile.jsp");
		}
		else {
			String list = request.getParameter("list");
			event ev1 = (event)session.getAttribute("eventsession");
			int eid = Integer.parseInt(ev.getId());
			int inviID = InvitationService.returnInvitationID(eid);
			
			MailService.sendMail(list, "Invitation", "http://localhost:8081/oop/invitation?id="+inviID);
			
			response.sendRedirect("profile.jsp");
		}
		
	}

}
