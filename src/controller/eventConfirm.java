package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.event;
import service.CustomerService;
import service.MailService;
import service.eventService;

@WebServlet("/eventConfirm")
public class eventConfirm extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.print(id );
		
		int eid = Integer.parseInt(id);
 		eventService.confirmEvent(eid);
 		
 		String mail = eventService.returnEventOwner(eid);
 		event ev = eventService.returnEvent(eid);
 		
 		MailService.sendMail(mail, "EVENT CONFIRMATION", "Your event "+ev.getName()+" has been confirmed. ");
 		
		response.sendRedirect("admin.jsp");
	}

}
