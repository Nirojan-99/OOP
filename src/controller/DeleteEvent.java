package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.eventService;


@WebServlet("/DeleteEvent")
public class DeleteEvent extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id =request.getParameter("id");
		int eid  = Integer.parseInt(id);
		eventService.removeEvent(eid);
		
		response.sendRedirect("profile.jsp");
	}

}
