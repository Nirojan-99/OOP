package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.customer;
import service.CustomerService;
import service.PaymentService;


@WebServlet("/edit")
public class edit extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value = request.getParameter("edit");
		HttpSession session = request.getSession();
		String uname = session.getAttribute("uname").toString();
		
		
		if(value.equals("Update Details")) {
			
			customer cus1  =(customer)session.getAttribute("user");
			String id = cus1.getId();
			
			String name = request.getParameter("name");
			String mail = request.getParameter("mail");
			String number = request.getParameter("number");
			String pass = request.getParameter("newpass");
			
			customer cus = new customer();
			cus.setEmail_id(mail);
			cus.setName(name);
			cus.setNumber(number);
			cus.setPassword(pass);
			cus.setId(id);
			
			CustomerService.updateCustomer(cus);
			
			customer cus2 = CustomerService.returnCustomer(uname);
			session.setAttribute("user", cus2);
			
			response.sendRedirect("profile.jsp");
			
		}
		else if(value.equals("Save Password")) {
			String pass = request.getParameter("newpass");
			
			CustomerService.updatePassword(uname,pass);
			
			customer cus2 = CustomerService.returnCustomer(uname);
			session.setAttribute("user", cus2);
			
			response.sendRedirect("profile.jsp");
		}
		else if(value.equals("Remove Payment")) {
			
			customer cus = (customer)session.getAttribute("user");
			int id =Integer.parseInt(cus.getId());
			
			PaymentService.removePayment(id);
			
			customer cus2 = CustomerService.returnCustomer(uname);
			session.setAttribute("user", cus2);
			
			response.sendRedirect("profile.jsp");
		}
	}

}
