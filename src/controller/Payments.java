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
import service.PaymentService;
import service.eventService;
import model.Payment;


@WebServlet("/Payment")
public class Payments extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cardno =Integer.parseInt(request.getParameter("cardNo"));
		String owner = request.getParameter("cardowner");
		int month = Integer.parseInt(request.getParameter("month"));
		int year = Integer.parseInt(request.getParameter("year"));
		int cvc = Integer.parseInt(request.getParameter("cvc"));
		
		HttpSession session = request.getSession();
		customer cus  = (customer)session.getAttribute("user");
		
		Payment pay = new Payment();
		
		pay.setCardNo(cardno);
		pay.setCusId(Integer.parseInt(cus.getId()));
		pay.setCvc(cvc);
		pay.setMonth(month);
		pay.setOwnerName(owner);
		pay.setYear(year);
		
		PaymentService.addPayment(pay);
		
		event ev = (event)session.getAttribute("createdEvent");
		eventService.createEvent(ev,cus);
		ArrayList<event> events = CustomerService.returnEvent(cus.getId());
		session.setAttribute("events", events);
		session.setAttribute("createdEvent", null);
		session.setAttribute("total", null);
		
		response.sendRedirect("profile.jsp");
	}

}
