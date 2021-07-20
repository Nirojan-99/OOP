package controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CustomerService;
import service.MailService;


@WebServlet("/ResetPass")
public class ResetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail = request.getParameter("email_reset");
		HttpSession session = request.getSession();
		session.setAttribute("uname", mail);
		
		if(CustomerService.isMailExist(mail)) {
			
			Random random = new Random();
	        int otp = random.nextInt(99999) ;
	        CustomerService.createOTP(mail, otp);
	        
	        try {
	        	MailService.sendMail(mail, "Reset Password", "Your One Time Password is "+otp);
	        	session.setAttribute("isValidOtp", false);
	        	response.sendRedirect("reset_password.jsp");
	        }
	        catch(Exception e) {
	        	System.out.print(e);
	        }
		}
		else {
			response.sendRedirect("login.jsp");
		}
		
		
		
		
		
	}

}
