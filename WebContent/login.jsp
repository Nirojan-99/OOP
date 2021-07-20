<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%session.setAttribute("page", ""); %>
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
    <div class="head_div">
        <!-- <img src=" image/head_img.jfif" class="head_img"> -->
        <img src=" image/logo.png" class="head_log  w3-animate-top">
       
       <jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>

        <central><h1 class="head_name"><nav class="color_change ">GOLDEN</nav> Event Management</h1></central>
        <div class="phone_num">(077-8862-172)</div>


<!-- body -->
<!-- <p id="login">bb</p> -->
<table class="form_table">
    <div id="log_head" class="w3-animate-left">LOG IN</div>
    <hr class="hori">
    <tr>
        <td>
            <div class="login_bag" id="login">
                <nav id="log_head_f">Log In</nav>
                <form action="login" method="POST" class="login_ui" id="">
                    <input type="text" name="username" placeholder="Email or Mobile" required>
                    <!-- <i class="fa fa-user"></i> -->
                    <br>
                    <input type="password" name="password" placeholder="Password" required>
                    <!-- <i class="fa fa-eye"></i> -->
                    <br>
                    <div class="forget">forgot <a onclick="showreset()" id="reset">password ?</a></div>
                    <input type="submit" value="Log In" name="login" id="submit" ><br>
                    <div style="text-align:center;margin-top:-15px;color:red"><% if(session.getAttribute("loginerror") != null) {out.print(session.getAttribute("loginerror"));}else{} %></div>
                </form>
                <button id="form_swap" onclick="showsignup()">Create New Account  <i class="fa fa-long-arrow-right"></i></button><br>
            </div>
        </td> 
        <td class="gap"></td>
        <td>
            <div id="signup" class="signup_bag">
                <nav id="log_head_s">Sign Up</nav>
                <!-- action="signup" -->
                <form  method="POST" id="sign" class="signup_ui">
                    <input type="text" name="username" placeholder="User Name" required><br>
                    <input type="text" name="email" placeholder="Email Address" required><br>
                    <input type="text" name="number" placeholder="Mobile Number" required><br>
                    <input type="password" id="pass1" name="password" placeholder="Type Password" required><br>
                    <input type="password" id="pass2" name="pass2" placeholder="Re-Type passwrod" required><br>
                    <div style="text-align:center;color:red">${errorMsg}</div>
                    <input type="submit" name="signUp" value="Sign Up" id="submit" onclick="isEqual()">
                </form>
                <div id="reset_form">
                    <form action="ResetPass" method="POST" id="reset_form_q">
                        <input type="text" name="email_reset" placeholder="Email Id" required><br>
                        <input type="submit" name="reset_sub" value="submit" onclick="enable()" id="submit"><br>
                    </form>
                </div>
            </div>
            
        </td>
    </tr>
</table>

        
       <jsp:include page="/WEB-INF/views/footer.html"></jsp:include>
</div>


</body>
</html>