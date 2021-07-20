package controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.customer;
import service.CustomerService;
import service.MailService;


@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public signup() {
        super();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		customer cus = new customer();
		HttpSession session=request.getSession(); 
		cus.setName(request.getParameter("username"));
		cus.setEmail_id(request.getParameter("email"));
		cus.setNumber(request.getParameter("number"));
		cus.setPassword(request.getParameter("password"));
		
		
		if(CustomerService.isMailExist(cus.getEmail_id())) {
			 
	        session.setAttribute("errorMsg","email id already exist!");  
	        
			response.sendRedirect("login.jsp");
			
		}
		else {
			session.setAttribute("errorMsg","");
			
			session.setAttribute("OTPcus", cus);
			
			Random random = new Random();
	        int otp = random.nextInt(99999) ;
	        CustomerService.createOTP(cus.getEmail_id(), otp);
	        String msg = "Your OTP code is "+otp;
			
	        try {
	        	MailService.sendMail(cus.getEmail_id() , "OTP verification" ,msg  );
	        	session.setAttribute("signup", true);
	        	response.sendRedirect("verification.jsp");
	        }
			catch(Exception e) {
				System.out.print(e);
			}
			
			

		}
		
		

	}



}
