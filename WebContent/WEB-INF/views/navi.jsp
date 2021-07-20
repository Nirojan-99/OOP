<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<nav id="container">
            <nav class="drop_down">
                <ul>
                    <li><a href=index.jsp#" <%if(session.getAttribute("page").equals("home")){out.print("id='page'");}else{} %>>HOME</a></li>
                    <%if(session.getAttribute("user") != null){%>
                    <li <%if(session.getAttribute("page").equals("profile")){out.print("id='page'");}else{} %>><a href='profile.jsp#'>PROFILE</a></li>
                    <%}else{} %>
                    <li <%if(session.getAttribute("page").equals("gallery")){out.print("id='page'");}else{} %>><a href="#">EVENTS</a>
                    <!-- First Tier Drop Down -->
                    <ul class="event_link"  >
                        <li><a id="list" href="gallery.jsp#birthday">BIRTHDAY</a></li>
                        <li><a id="list" href="gallery.jsp#wedding">WEDDING & RECEPTION</a></li>
                        <li><a id="list" href="gallery.jsp#confrence">CONFERENCES </a></li>
                        <li><a id="list" href="gallery.jsp#party">PARTIES </a></li>
                        <li><a id="list" href="gallery.jsp#festival">FESTIVALS </a></li>
                        <li><a id="list" href="gallery.jsp#family">FAMILY FUNCTIONS </a></li>
                    </ul>        
                    </li>
                    <li><a href="#" <%if(session.getAttribute("page").equals("service")){out.print("id='page'");}else{} %>>SERVICES</a>
                    <!-- First Tier Drop Down -->
                    <ul>
                        <li><a id="list" href="#">FLOWER DECORATION</a></li>
                        <li><a id="list" href="#">ELECTRIC DECORATION</a></li>
                        <li><a id="list" href="#">CATERING </a></li>
                        <li><a id="list" href="#">PHOTOGRAPHY</a></li>
                        <!-- Second Tier Drop Down -->
                       
                      
                    </ul>
                    </li>
                    <li <%if(session.getAttribute("page").equals("contact")){out.print("id='page'");}else{} %>><a href="contact_us.jsp">CONTACT US</a></li>
                </ul>
            </nav>
        </nav>
</body>
</html>