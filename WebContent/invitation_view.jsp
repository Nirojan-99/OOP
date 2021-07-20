<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%session.setAttribute("page", ""); %>
    <%@ page import="model.event"%>
    <%@ page import="model.Invitation"%>
    <%@ page import="service.InvitationService"%>
    <%
if (session.getAttribute("uname") == null ) {
	response.sendRedirect("login.jsp");
	
}
else if(session.getAttribute("eventsession") == null){
	response.sendRedirect("profile.jsp");
}
   Invitation invi =  (Invitation)InvitationService.returnInvitation((event)session.getAttribute("eventsession"));
   session.setAttribute("invitationsession", invi);
%>
<!DOCTYPE html>
<html>
<head>
	<title>Royal Events</title>
    <link rel="stylesheet" href=" index.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <div class="head_div" style="background-image: url(' image/invitation-cover.jpg');height: 250px;">
        <!-- <img src=" image/head_img.jfif" class="head_img"> -->
        <img src=" image/logo.png" class="head_log  w3-animate-top">
        
        <jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
        
            <div class=" colorC " style="margin-top: 40px;">
                <div class="gallery_hlG" id="wedding " style="color: #fff;">INVITATION VIEW</div>
                <div class="subheadG" style="color: #fff;">Golden evnts</div>
            </div>
            <br><br>
            <!-- body -->

            <div class="invitatio">
                <div style="margin-bottom:30px">
                    <form action="invitation" method="POST">
                        <br><br><br><br><br><br>
                        <div class="head-in">YOU ARE INVITED TO ATTEND</div>
                        <input type="text" name="event" class="in1" placeholder="event name" value="${eventsession.getName() }" readonly style="border:none"><br><br>
                        <label style="margin-left: 10px;">DATE : ${eventsession.getDate() }</label>
                        <label style="margin-left: 85px;">VENUE : </label><input type="text" name="venue" style="text-align:left" class="in3" value="${invitationsession.getVenue() }"><br>
                        <textarea placeholder="Description" class="in4" name="des">${invitationsession.getDescription() }</textarea><br>
                        <label class="in6">Invited By<br><input type="text" name="user" class="in5" value="${invitationsession.getInviter() }"></label>
                        <input type="submit" value="SAVE" name="invitation" id="in7">
                        <br><br>
                    </form>
                    <span style="font-size:12px" >Get your Invitation's LINK :</span> <span class="show-link"  >http://localhost:8081/oop/invitation?id=${ invitationsession.getId()}</span> 
                    
                </div>
            </div>

            <jsp:include page="/WEB-INF/views/footer.html"></jsp:include>
        </div>
    
        
    </body>
    </html>
       