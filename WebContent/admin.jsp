<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>
    <%@ page import="model.event"%>
    <%@ page import="model.Inquirys"%>
    <%@ page import="service.InquiryService"%>
    <%@ page import="service.eventService"%>
    <%
    if (session.getAttribute("admin") == null ) {
    	response.sendRedirect("login.jsp");
    	
    }
    ArrayList<event> eventList = eventService.returnEventList();
	session.setAttribute("eventList", eventList);
    ArrayList<Inquirys> inquiryList = InquiryService.returnInquiryList();
	session.setAttribute("inquiryList", inquiryList);
    %>
<!DOCTYPE html>
<html>
<head>
	<title>Royal Events</title>
    <link rel="stylesheet" href=" index.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src=" index.js"></script>
</head>
<body>
    <div class="head_div" style="background-image: url(' image/admin_cover.jfif');max-height: 200px; background-position: 0px -400px;">
        <!-- <img src=" image/head_img.jfif" class="head_img"> -->
        <img src=" image/logo.png" class="head_log  w3-animate-top">
     
            <div class=" colorC " style="margin-top: 40px;">
                <div class="gallery_hlG" id="wedding " style="color: #fff;">Manage Your Works</div>
                <div class="subheadG" style="color: #fff;">golden events</div>
            </div>
            <br><br>
			
			<form action="logOut" >
		<input type="submit"  style="float:right;margin-top:-100px;margin-right:25px;width:150px" id="submit" value="Log Out">
		</form>
            <!-- body -->

            <%
			if(session.getAttribute("eventList") != null){
			ArrayList<event> evs = (ArrayList<event>) session.getAttribute("eventList");
			for (int i = 0; i < evs.size(); i++) {
			%>
		
            <div class="card_view">
            <a class="click" href="admin_event_view.jsp?id=<%= evs.get(i).getId() %>" >
                <div class="card_img">
                    <img src=" image/event_png.jpg">
                </div>
                <div class="card_title">
                    <div class="highlight" style="margin-top: 20px;"><%= evs.get(i).getName()%> </div>
                    <div class="highlight" style="color: rgb(192, 188, 188);">Date : <%= evs.get(i).getDate()%>  </div>
                </div>
            </a>
                <div class="card_trail">
                    <form action="removeEvent" method="post">
                        <input type="submit" value=<%= evs.get(i).getId()%> name="id" hidden id="removeEvent">
                        <label for="removeEvent"><i class="fa fa-trash-o" style="font-size:40px;"></i></label>
                    </form>
                </div>
            </div>

            <%
		//out.println(evs.get(i).getName());
		}
			}
		%>
           
            
        
        
        <br><br>
                <hr class="long">
     
            
                    <br>
                    <div class="highlight" style="text-align: center; font-size: 25px;">Inquiries</div>
                    <br>
						
						 <%
			if(session.getAttribute("inquiryList") != null){
			ArrayList<Inquirys> evs = (ArrayList<Inquirys>) session.getAttribute("inquiryList");
			for (int i = 0; i < evs.size(); i++) {
			%>
						
                        <div class="card">
                        <div class="highlight card_view_inq">Name : <%= evs.get(i).getName() %></div>
                        <div class="highlight card_view_inq" style="color: rgb(192, 188, 188); border-bottom: 3px solid rgb(255, 255, 255);">Mail : <%= evs.get(i).getEmail() %></div>
                        <div class="Inquiries card_view_inq" id="inq"><%= evs.get(i).getInquiry() %></div>
                        <form action="SendAdminMail" method="post">
                        <input type="text" name="message" class="rplymsg" placeholder="enter your reply .." required> 
                        <input hidden type="text" name="mail" value="<%= evs.get(i).getEmail() %>" >
                        <input hidden type="text" name="id" value="<%= evs.get(i).getId() %>" >
                        <input hidden type="text" name="qui" value="<%= evs.get(i).getInquiry() %>" >
                        <input type="submit" class="rply" value="Send Reply" name="reply" >
                        </form>
                        </div> 
    		    <%
		//out.println(evs.get(i).getName());
		}
			}
		%>
        
    </body>
    </html>