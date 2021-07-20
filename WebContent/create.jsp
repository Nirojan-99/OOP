<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.customer"%>
    <%
if (session.getAttribute("uname") == null ) {
	response.sendRedirect("login.jsp");
	
}
session.setAttribute("page", "");
%>
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
        <!-- <img src=" image/head_img.jfif" class="head_img"> -->
        <img src=" image/logo.png" class="head_log  w3-animate-top">
        
        <jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>

        <central><h1 class="head_name"><nav class="color_change ">GOLDEN</nav> Event Management</h1></central>
        <div class="phone_num">(077-8862-172)</div>

        <!-- body -->
        <h2> <span class="highlight">CREATE YOUR OWN EVENTS</span> </h2>
        <br>
        <form action="eventCreate" method="POST" class="createF" >
        <table class="create_table">
            <tr>
                <td>
                    <div class="create_head">Event Type</div><br>
                </td>
                <td>
                    <div class="create_head">Photography</div><br>
                </td>
                <td>
                    <div class="create_head">catering</div><br>
                </td>
                <td>
                    <div class="create_head">electric decoration</div><br>
                </td>
                <td>
                    <div class="create_head">flower decoration</div><br>
                </td>
            </tr>
            <tr>
                <td>
                    <input required type="radio" name="event" value="BIRTHDAY" id="BIRTHDAY"><label for="BIRTHDAY"> BIRTHDAY</label><br>
                    <input type="radio" name="event" value="WEDDING" id="WEDDING"><label for="WEDDING"> WEDDING & RECEPTION</label><br>
                    <input type="radio" name="event" value="CONFERENCE" id="CONFERENCES"><label for="CONFERENCES"> CONFERENCES</label><br>
                    <input type="radio" name="event" value="PARTY" id="PARTIES"><label for="PARTIES"> PARTIES</label><br>
                    <input type="radio" name="event" value="FESTIVAL" id="FESTIVALS"><label for="FESTIVALS"> FESTIVALS</label><br>
                    <input type="radio" name="event" value="FAMILY FUNCTION" id="FAMILY"><label for="FAMILY"> FAMILY FUNCTIONS</label><br><br>
                    <a href="gallery.jsp" class="link">VIEW COLLECTIONS</a>
                </td>
                <td>
                    <input required type="radio" name="photo" value="Clasic" id="1" ><label for="1"> CLASIC</label><br>
                    <input type="radio" name="photo" value="Deluxe" id="2" ><label for="2" > DELUXE</label><br>
                    <input type="radio" name="photo" value="Modern" id="3" ><label for="3"> MODERN</label><br>
                    <input type="radio" name="photo" value="Golden" id="4" ><label for="4"> GOLDEN</label><br>
                    <input type="radio" name="photo" value="Ultimate" id="5" ><label for="5"> ULTIMATE</label><br>
                    <input type="radio" name="photo" value="No need" id="6" ><label for="6"> NO NEED</label><br><br>
                    <a href="gallery.jsp#party" class="link">VIEW COLLECTIONS</a>
                </td>
                <td>
                    <input required type="radio" name="catering" value="Veg" id="11" ><label for="11"> VEG ONLY</label><br>
                    <input type="radio" name="catering" value="Non Veg" id="22" ><label for="22" > NON VEG</label><br>
                    <input type="radio" name="catering" value="Continental" id="33" ><label for="33"> CONTINENTAL</label><br>
                    <input type="radio" name="catering" value="Orental" id="44" ><label for="44"> ORENTAL</label><br>
                    <input type="radio" name="catering" value="Chinese " id="55" ><label for="55"> CHINESE</label><br>
                    <input type="radio" name="catering" value="No need" id="66" ><label for="66"> NO NEED</label><br><br>
                    <a href="gallery.jsp" class="link">VIEW COLLECTIONS</a>
                </td>
                <td>
                    <input required type="radio" name="electric" value="Chandeliers" id="111" ><label for="111"> CHANDELIERS</label><br>
                    <input type="radio" name="electric" value="Wall sconees" id="222" ><label for="222" > WALL SCONEES</label><br>
                    <input type="radio" name="electric" value="Clasic" id="333" ><label for="333"> CLASIC</label><br>
                    <input type="radio" name="electric" value="Basic" id="444" ><label for="444"> BASIC</label><br>
                    <input type="radio" name="electric" value="pendant lighting" id="555" ><label for="555"> PENDANT LIGGHTING</label><br>
                    <input type="radio" name="electric" value="No need" id="666" ><label for="666"> NO NEED</label><br><br>
                    <a href="gallery.jsp" class="link">VIEW COLLECTIONS</a>
                </td>
                <td>
                    <input required type="radio" name="flower" value="Basic" id="a" ><label for="a"> BASIC</label><br>
                    <input type="radio" name="flower" value="Fully Natural" id="b" ><label for="b" > FULLY NATURAL</label><br>
                    <input type="radio" name="flower" value="Botanical Theme" id="c" ><label for="c"> BOTANICAL THEME</label><br>
                    <input type="radio" name="flower" value="Crescent Corsage" id="d" ><label for="d"> CRESCENT CORSAGE</label><br>
                    <input type="radio" name="flower" value="Nosegay Corsage" id="e" ><label for="e"> NOSEGAY CORSAGE</label><br>
                    <input type="radio" name="flower" value="No need" id="f" ><label for="f"> NO NEED</label><br><br>
                    <a href="gallery.jsp" class="link">VIEW COLLECTIONS</a>
                </td>
            </tr>
        </table>
        <br><br>
        <label class="lab">Event Date : </label><br>
        <input type="date" placeholder="Event Date" name="date" class=" createinput"><br>
        <input type="number" placeholder="Expected Attendees" class="createinput" name="attendees"><br>

        <!-- <input type="reset" value="Reset Selection" name="resert" id="submit" class="reset"><br><br> -->
        <input type="submit" value="Create Event" name="createE" id="submit" class="resetC createinput"><br>
        </form>
        <br>
        <hr class="long">
        <div class="form_image">
            <table>
                <tr>
                    <td>
                        <form action="inquiry" method="post" class="form_quiry">
                            <p class="inquiry_head">Any Inquiry ?</p>
                            <input type="text"  placeholder="Your Name " name="name" value="${user.getName() }" readonly><br>
                            <input type="text"  placeholder="Contact No " name="number" readonly value="${user.getNumber() }"><br>
                            <!-- <input type="text" id="name" placeholder="Your Name" name="name"><br> -->
                            <textarea id="w3review" name="inquiry"  cols="200" placeholder="your inquiry / feedback"></textarea>
                            <input type="submit" name="inquirysub" value="Submit">
                        </form>
                    </td>
                    <td>
                        <p class="inquiry_details">We'll contact You ASAP,<div class="inquiry_details italic">you can also send feedback through it</div></p>
                    </td>
                </tr>
            </table>
           </div>

       <jsp:include page="/WEB-INF/views/footer.html"></jsp:include>
    </div>

    
</body>
</html>