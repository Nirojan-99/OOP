<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%session.setAttribute("page", ""); %>
    <%if(session.getAttribute("signup") != null){ %>
<!DOCTYPE html>
<html>
<head>
	<title>Royal Events</title>
    <link rel="stylesheet" href="index.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="index.js"></script>
</head>
<body>
    <div class="head_div" style="background-image: url(' image/login_ui.jpg');height: 250px; background-position: 0px -300px;">
        <!-- <img src=" image/head_img.jfif" class="head_img"> -->
        <img src=" image/logo.png" class="head_log  w3-animate-top">
        
        <jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
        
            <div class=" colorC " style="margin-top: 40px;">
                <div class="gallery_hlG" id="wedding " style="color: #fff;">We verify You</div>
                <div class="subheadG" style="color: #fff;">golden events</div>
            </div>
            <br><br>



<!-- body -->
            <div class="otpbox">
                <form action="OtpVerification" method="post" >
                    <div>Check Your Mail</div>
                    <div>OTP verification</div>
                    <input type="number" name="otp" placeholder="OTP*" pattern="^0[1-9]|[1-9]\d$" required><br>
                    <input type="submit" name="otpsubmit" value="SUBMIT" onclick="show()">
                </form>

            </div>
            


        <jsp:include page="/WEB-INF/views/footer.html"></jsp:include>
        </div>
    
        
    </body>
    </html>
    <%}else{response.sendRedirect("index.jsp");}%>