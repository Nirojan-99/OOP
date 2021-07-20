package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.event;
import service.eventService;



@WebServlet("/events")
public class events extends HttpServlet {
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String index =  request.getParameter("sum");
		int index1 = Integer.parseInt(index);
		
		event ev = eventService.returnEvent(index1);
		
		HttpSession session = request.getSession();
		session.setAttribute("eventsession",ev);
	
		response.sendRedirect("events.jsp");
	}

	

}
