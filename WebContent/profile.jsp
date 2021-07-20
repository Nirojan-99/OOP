<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="404.jsp"%>
<%@ page import="model.customer"%>
<%@ page import="service.CustomerService"%>
<%@ page import="model.event"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="model.Payment"%>
<%@ page import="service.PaymentService , service.eventService"%>


<%
if (session.getAttribute("uname") == null ) {
	response.sendRedirect("login.jsp");
	
}
else{
	session.setAttribute("page", "profile");
}
String mail = (String)session.getAttribute("uname");
customer cus = CustomerService.returnCustomer(mail);
session.setAttribute("user", cus);
customer cust = (customer)session.getAttribute("user");
ArrayList<event> events = CustomerService.returnEvent(cust.getId());
session.setAttribute("events", events);
Payment pay = PaymentService.returnPayment(Integer.parseInt(cus.getId()));

String list = eventService.returnFullList(Integer.parseInt(cus.getId()));

%>

<!DOCTYPE html>
<html>
<head>
<title>Royal Events</title>
<link rel="stylesheet" href=" index.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src=" index.js"></script>
</head>
<body id="body">

<div class="deletemodule" id="module">
        <div>Delete Account ?</div>
        <form action="deleteAccount" method="post">
            <input type="password" name="password" placeholder="input your password"><br>
            <span onclick="closeModule()">Cancel</span><input type="submit" name="submit" value="Delete Account">
        </form>
    </div>
    
    
    <div class="covermodule" id="coverM">
    <div class="deletemodule" id="imgmodule">
        <div>Change Image</div>
        <form action="updateImage" enctype="multipart/form-data" method="post" enctype="multipart/form-date">
            <!-- <label for="imgU">upload here</label> -->
            <input  class="imglabel" placeholder="" type="file" name="file" placeholder="" id="imgU"><br>
            <span onclick="closeModuleimg()">Cancel</span><input type="submit" name="submit" value="Submit">
        </form>
    </div>
</div>

	<div class="head_div"
		style="background-image: url(' image/profile_cover.jpg'); height: 250px; border-bottom: 2px solid rgb(255, 230, 6);">
		<!-- <img src=" image/head_img.jfif" class="head_img"> -->

		<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>

		<div class=" colorC " style="margin-top: 40px;">
			<div class="gallery_hlG" id="wedding " style="color: #fff;">We
				Keep Your Data Safer</div>
			<div class="subheadG" style="color: #fff;">Golden Events</div>
		</div>

		<img
			src=" image/user_profile/${user.getUrl() }"
			class="profile_img" onclick="change();">
		<div class="tri" id="ww"></div>
		<div class="fixed" id="change">
			<button onclick="showimgmodule()">Change Image</button>
			<br>
			<button><a style="text-decoration:none" href="removeImg">Remove Image</a></button>
		</div>

		<script type="text/javascript">
			var w = 0;
			function change() {
				if (w == 0) {
					document.getElementById("change").style.visibility = "visible";
					document.getElementById("ww").style.visibility = "visible";
					w = 1;
				} else {
					document.getElementById("change").style.visibility = "hidden";
					document.getElementById("ww").style.visibility = "hidden";
					w = 0
				}

			}
			
			let m = 0;
            function showModule(){
                if(m === 0){
                    document.getElementById("module").style.visibility ="visible"; 
                    m =1;
                }
                else{
                    //
                }
            }

            function closeModule(){
                if(m === 1){
                    document.getElementById("module").style.visibility ="hidden"; 
                    m =0;
                }
            }
            
            let img = 0 ;
            function showimgmodule(){
                if(img == 0){
                    document.getElementById("change").style.visibility ="hidden";
                   document.getElementById("imgmodule").style.visibility ="visible"; 
                   document.getElementById("coverM").style.visibility ="visible";  
                   document.getElementById("ww").style.visibility ="hidden"; 
                   img=1;
                   w=0;
                }
                else{
                    //
                }
                
            }

            function closeModuleimg(){
                if(img === 1){
                    document.getElementById("coverM").style.visibility ="hidden";
                    document.getElementById("imgmodule").style.visibility ="hidden"; 
                    img =0;
                }
            }
        
		</script>
		<div class="username">
			${user.getName() }
		</div>
		<form action="logOut" >
		<input type="submit"  style="float:right;margin-top:-100px;margin-right:25px;width:150px" id="submit" value="Log Out">
		</form>
		<br> <br>
		<hr class="long">
		<br> <br>


		<div class="highlight" style="text-align: center; font-size: 20px">CREATED
			EVENTS</div>
		<ul class="listofevent">
		<%
			if(session.getAttribute("events") != null){
			ArrayList<event> evs = (ArrayList<event>) session.getAttribute("events");
		for (int i = 0; i < evs.size(); i++) {
		%>
		<form action="events" >
			<input type="submit" name="sum" value=<%out.println(evs.get(i).getId());%> id="<%out.println(evs.get(i).getId());%>" hidden >
								 
							<label for="<%	out.println(evs.get(i).getId());%>">
							<ul class="listofevent"><li>
							<div class="box">
							<%out.println(evs.get(i).getName());%>
							<div style="color:red"><%= evs.get(i).isConfirmed() ? "Confirmed":"" %></div>
							</div>
							</li>
							</ul>
							</label>
		</form>

		<%
		}
			}
		%>
		<ul class="listofevent">
		<li><a href="create.jsp" class="www"><div class="box">
					CREATE NEW<br> <i class="fa fa-plus"
						style="font-size: 45px; color: #333;"></i>
				</div></a></li></ul> </ul><br> <br>
		<hr class="long">
		<br> <br>


		<div class="relativebox">
			<div class="absolutebox1">
				<img src=" image/user_profile/${user.getUrl() }" class="userimg"><br>
				<br>
				<div class="highlight centerA">${user.getName() }</div>
				<br>
				<hr class="hori">
				<br> <br>
				<ul class="list">
					<li><a href="#main" onclick="showprofile()">PROFILE</a></li>
					<li><a href="#main" onclick="showpayment()">PAYMENT METHOD</a></li>
					 <li><a href="#main" onclick="showinvitee()">INVITEE LIST</a></li> 
					<li><a href="#main" onclick="showclose()">CLOSE ACCOUNT</a></li>
				</ul>
			</div>
			<div class="absolutebox2">
				<div style="margin-top: 20px;" id="main">Your Profile</div>
				<div id="submain">Add information about yourself</div>
			</div>
			<div class="absolutebox3">

				<div class="abso1" id="a1">
					<form action="edit" method="POST">
						<br> <br> <label>Name : </label><br> <input
							type="text" name="name" value="${user.getName() }"
							placeholder="user name"><br> <br> <label>Email
							Id : </label><br> <input readonly type="text" name="mail"
							value="${user.getEmail_id() }" placeholder="Email Id"><br>
						<br> <label>Mobile No : </label><br> <input type="text"
							name="number" value="${user.getNumber() }"
							placeholder="Mobile No"><br> <br> <label>New
							Password : </label><br> <input type="password" name="newpass"
							id="pass1" value="${user.getPassword()}" placeholder="New Password" ><br>
						<br> <label>Re Type Password : </label><br> <input
							type="password" name="newpass" id="pass2" value=""
							placeholder="Re Type Password"><br> <br> <input
							type="submit" name="edit" value="Update Details" id="submit">
					</form>
				</div>

				<div class="abso1" id="a2">
					<form action="edit" method="POST">
						<div>
							<img src=" image/visa1.png" class="visa" style="width: 100px;">
							<span style="padding-left: 10px; font-size: 12px;">****
								**** **** <%= pay.getLastNum() %></span> <span
								style="font-size: 10px; color: gray; padding-left: 30px;">Expiration
								<%= pay.getMonth() %>/<%= pay.getYear() %></span> </span> <input <%if(pay.getId() == 0){out.print("disabled");}else{out.print("");} %> type="submit" name="edit" value="Remove Payment"
								class="remove">
						</div>
					</form>
				</div>

				 <div class="abso1" id="a3">
					<form action="edit" method="POST">
						<textarea class="textinvitee" readonly id="text"><%= list %></textarea>
						<br> <br>
						<!-- <button type="button" id="submitA" onclick="enable()">ADD
							More</button>
						<input type="submit" name="removeinvitee" value="Remove List"
							id="submitA">
							<input type="submit" name="edit" value="Update List"
							id="submitA"> -->
					</form>
				</div>

				<div class="abso1" id="a4">
					<div class="ina4">
						<div>
							close your account<br> <span style="color: red;">Warning
								: </span> If you close your account, your events will be canceled ,you
							will not be refunded , and will lose all data.
							
								<br> <br><a href="#body" style="text-decoration: none;"><div class="close" onclick="showModule()" style="width: 200px;">Close Account</div></a>
							
						</div>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/footer.html"></jsp:include>
	</div>


</body>
</html>