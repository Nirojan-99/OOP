package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Invitation;
import model.event;
import service.InvitationService;

@WebServlet("/invitation")
public class invitation extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		System.out.print(id);
		
		Invitation invi = InvitationService.returnInvitation(Integer.parseInt(id));
		
		session.setAttribute("invitationsession", invi);
		response.sendRedirect("invitation.jsp");
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		event eve = (event)session.getAttribute("eventsession");
		String name  = eve.getName();
		String date = eve.getDate();
		int eid  =  Integer.parseInt(eve.getId());
		
		String venue = request.getParameter("venue");
		String description  = request.getParameter("des");
		String inviter  = request.getParameter("user");
		
		Invitation invi = new Invitation();
		
		invi.setDate(date);
		invi.setDescription(description);
		invi.setInviter(inviter);
		invi.setName(name);
		invi.setVenue(venue);
		invi.setEid(eid);
		
		InvitationService.createInvitation(invi);
		
		response.sendRedirect("profile.jsp");
	}

}
