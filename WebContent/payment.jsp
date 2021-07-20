<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%session.setAttribute("page", ""); %>
   
    <%@ page import="model.event"%>
    <%@ page import="model.PriceDetails"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<% PriceDetails pd = new PriceDetails();
  event ev = (event)session.getAttribute("createdEvent");
%>

 <%
    if (session.getAttribute("uname") == null ) {
    	response.sendRedirect("login.jsp");
    }
    	else if(session.getAttribute("createdEvent") != null){
    		
    	
    
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
    <div class="head_div" style="background-image: url(' image/payment.jpg');height: 250px;">
        <!-- <img src=" image/head_img.jfif" class="head_img"> -->
        <img src=" image/logo.png" class="head_log  w3-animate-top">
        
        <jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
        
            <div class=" colorC " style="margin-top: 40px;">
                <div class="gallery_hlG" id="wedding " style="color: #fff;">Make Your Payments</div>
                <div class="subheadG" style="color: #fff;">in safest way</div>
            </div>



<!-- body -->

<br><br>
<table class="payment">
    <tr>
        <td>
            <!-- <div class="highlight" style="margin-bottom: 20px;margin-top: 20px; font-size: 23px;text-align: center;">PACKAGE details</div> -->
            <table class="payment_details">
                <tr>
                    <th></th>
                    <th><span class="titleP">${createdEvent.getName() }</span></th>
                    <th></th>
                </tr>
                <tr>
                    <td><span class="titleP">PHOTOGRAPHY</span></td>
                    <td><span class="rupee">${createdEvent.getPhotography() }</span></td>
                    <td><span class="rupee"> $<%= pd.photography.get(ev.getPhotography()) %></span></td>
                </tr>
                <tr>
                    <td><span class="titleP">CATERING</span></td>
                    <td><span class="rupee">${createdEvent.getCatering() }</span></td>
                    <td><span class="rupee"> $<%= pd.catering.get(ev.getCatering()) %></span></td>
                </tr>
                <tr>
                    <td><span class="titleP">ELECTRIC DECORATION</span></td>
                    <td><span class="rupee">${createdEvent.getElectric_decoration() }</span></td>
                    <td><span class="rupee"> $<%= pd.electric.get(ev.getElectric_decoration()) %></span></td>
                </tr>
                <tr>
                    <td><span class="titleP">FLOWER DECORATION</span></td>
                    <td><span class="rupee">${createdEvent.getFlower_decoration() }</span></td>
                    <td><span class="rupee"> $<%= pd.flower.get((String)ev.getFlower_decoration()) %></span></td>
                </tr>
                <tr>
                    <td><span class="titleP" style="background-color: blue;">TOTAL</span></td>
                    <td><span class=""></span></td>
                    <td><span class="rupee" style="background-color: blue;"> $${total }</span></td>
                </tr>
                <tr>
                    <td><span class="titleP" style="background-color: blue;">HALF TOTAL</span></td>
                    <td><span class=""></span></td>
                    <td><span class="rupee" style="background-color: blue;"> $${total/2 }</span></td>
                </tr>
            </table>
            <p class="subhead" style="font-size: 14px;">COMPLETE YOUR PAYMENT TO CONFORM THE EVENT<i class="fa fa-long-arrow-right point" style="font-size: 20px;"></i></p>
        </td>
        <td class="gap">

        </td>
        <td>
            <div class="payment_form">
                <form action="Payment" method="post" class="payment_form_A">
                    <center><img src=" image/visa1.png" class="visa"><br></center>
                    <input type="text" name="cardNo" placeholder="CARD NO" class="long_input" required>
                    <input type="text" name="cardowner" placeholder="CARD HOLDER NAME" class="long_input" required><br>
                    <input type="number" name="month" placeholder="MM" class="short_input" required>
                    <input class="short_input" name="year" type="number" placeholder="YY" required>
                    <input type="text" name="cvc" placeholder="CVC" class="short_input" required> <br>
                    <input type="submit" name="payment" value="COMPLETE PAYMENT" class="long_input" id="submit" style="width: 300px;">
                </form>
            </div>
        </td>
    </tr>
</table>


            <jsp:include page="/WEB-INF/views/footer.html"></jsp:include>
        </div>
    
        
    </body>
    </html>
    <%}else{response.sendRedirect("profile.jsp");} %>
       