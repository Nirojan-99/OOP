package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.customer;
import service.CustomerService;

import java.util.List;
import java.io.File;


@WebServlet("/updateImage")
public class updateImage extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
		HttpSession session = request.getSession();
		String mail = (String) session.getAttribute("uname");
		
		List<FileItem> fle = null;
		
		
		
		try {
			fle = sf.parseRequest(request);
		} catch (FileUploadException e) {
			System.out.print(e);
			System.out.print("here3");
		}
		
		for(FileItem item : fle) {
			try {
				item.write(new File("C:\\Users\\Niro\\Documents\\eclipse\\oop\\WebContent\\image\\user_profile\\"+item.getName()));
				CustomerService.updateImage(mail , item.getName());
				customer cus = CustomerService.returnCustomer(mail);
				session.setAttribute("user", cus);
				break;
			}
			catch(Exception e) {
				System.out.print(e);
			}
			
		}
		
		response.sendRedirect("profile.jsp");
		
	}

}
