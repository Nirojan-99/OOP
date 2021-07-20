package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.event;
import service.eventService;


@WebServlet("/removeEvent")
public class removeEvent extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		
		int eid = Integer.parseInt(id);
		
		eventService.removeEvent(eid);
		
		ArrayList<event> eventList = eventService.returnEventList();
		session.setAttribute("eventList", eventList);
		
		response.sendRedirect("admin.jsp");
	}

}
