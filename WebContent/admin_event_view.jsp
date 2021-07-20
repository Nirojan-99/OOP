<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.customer"%>
<%@ page import="service.eventService"%>
<%@ page import="model.event"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
    <%
    
    if (session.getAttribute("admin") != null ) {
 
    
    String id = request.getParameter("id");
    int eid = Integer.parseInt(id);
    event ev = eventService.returnEvent(eid);
    
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
<!-- body -->

<div class="card_view_event">
    
        
        <div class="">
            <div class="highlight" style="margin-top: 20px;color: rgb(192, 188, 188);">Event Name : <span class="highlight"><%= ev.getName() %></span></div>
            <div class="highlight" style="color: rgb(192, 188, 188);">Date : <span class="highlight"><%= ev.getDate() %> </span></div>
            <div class="highlight" style="color: rgb(192, 188, 188);">Photography : <span class="highlight"><%= ev.getPhotography() %></span></div>
            <div class="highlight" style="color: rgb(192, 188, 188);">Catering : <span class="highlight"><%= ev.getCatering() %></span></div>
            <div class="highlight" style="color: rgb(192, 188, 188);">Electric Decoration : <span class="highlight"><%= ev.getElectric_decoration() %></span></div>
            <div class="highlight" style="color: rgb(192, 188, 188);">Flower decoration : <span class="highlight"><%= ev.getFlower_decoration() %></span></div>
            <div class="highlight" style="color: rgb(192, 188, 188);">Attendees Count : <span class="highlight"><%= ev.getAttendees() %></span></div>
            <form action="eventConfirm" method="post">
                <br>
                <input hidden type="text" name="id" value=<%= ev.getId()%>>
                <input class="confirm" type="submit" value="Confirm Event" <%= ev.isConfirmed()? "disabled" : ""%>>
            </form>
            <br>
            <div class="highlight"><%= ev.isConfirmed() ?"Event Confirmed ! " :""  %></div>
        </div>
 
    </div>
    <%}else{response.sendRedirect("index.jsp");}%>