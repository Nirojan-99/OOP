<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%session.setAttribute("page", "contact"); %>
<!DOCTYPE html>
<html>
<head>
	<title>Royal Events</title>
    <link rel="stylesheet" href="index.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <div class="head_div">
        <!-- <img src="image/head_img.jfif" class="head_img"> -->
        <img src="image/logo.png" class="head_log  w3-animate-top">
       
       <jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>

        <central><h1 class="head_name"><nav class="color_change ">GOLDEN</nav> Event Management</h1></central>
        <div class="phone_num">(077-8862-172)</div>
        <br><br><br>
        
        <div class="contact">
        
        <div class="map">
		<div class="mapouter">
			<div class="gmap_canvas">
				<iframe width="662" height="500" id="gmap_canvas"  src="https://maps.google.com/maps?q=jaffna%20kfc&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="2"  scrolling="no" marginheight="0" marginwidth="0"></iframe>
				<a href="https://putlocker-is.org"></a><br>
				<style>.mapouter{position:relative;text-align:right;height:100%;width:100%;margin-left:30px;margin-top: 40px;}</style>
				<a href="https://www.embedgooglemap.net">html embed google map</a>
				<style>.gmap_canvas {overflow:hidden;background:none!important;height:475px;width:100%;}</style>
			</div>
		</div>
        </div>
        <br><br>
		
		<div class="inqu">
            <div class="form_image">
                <table>
                    <tr>
                        <td>
                            <form action="inquiry" method="post" class="form_quiry">
                                <p class="inquiry_head">Any Inquiry?</p>
                                <input type="text" id="name" placeholder="Your Name *" name="name" value="${user.getName()}"><br>
                                <input type="text" id="name" placeholder="Email ID *" name="email" value="${user.getEmail_id()}"><br>
                                <input type="text" id="name" placeholder="Contact No *" name="number" value="${user.getNumber()}"><br>
                                <!-- <input type="text" id="name" placeholder="Your Name" name="name"><br> -->
                                <textarea id="w3review" name="inquiry"  cols="80" placeholder="your inquiry / feedback"></textarea>
                                <input type="submit" name="inquirysub" value="Inquiry">
                            </form>
                        </td>
                        <td>
                            <p class="inquiry_details">We'll contact You ASAP,<div class="inquiry_details italic">you can also send feedback through it</div></p>
                        </td>
                    </tr>
                </table>
               </div>
        </div>
		</div>
		

		
		<jsp:include page="/WEB-INF/views/footer.html"></jsp:include>
</body>
</html>