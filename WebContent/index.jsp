<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.customer"%>
   <%session.setAttribute("page", "home"); %>
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

        <!-- body -->
    <div class="body_part">
        <h2 class="body_head">Perfection For ANY Occasion</h2>
    </div>

    
    <table class="table_details">
        <tr>
            <th>RICH Decorations</th>
            <th>EXPERIENCED People</th>
            <th>FABULOUS Food</th>
        </tr>
        <tr>
            <td>Our Indoor Banquet Halls and Open-Air Lawns, set perfect tone for any event. With convenient location, we carve out a picture-perfect event for you.</td>
            <td>Our hands-on event management and staff team help create an unforgettable experience right from the set-up to special requests.</td>
            <td>When it comes to catering and hospitality, Gupta Brothers, as our Food Partner, has a lineage unparalleled by most.</td>
        </tr>
    </table>

    <table class="link_table">
        <tr>     
        <td class="create_link">
            <a href="create.jsp"><i class="fa fa-plus" style="font-size:34px"></i><div>Create Event</div>  </a>
        </td>
        <td class="gap" style="background-color: rgba(0, 0, 255, 0);"></td>
    
        <td class="create_link">
           <a href="login.jsp"> <i class="fa fa-user" style="font-size:34px"></i><div>Log In</div>    </a>
        </td>

        </tr>
    </table>
    <h2 class="body_head"><span class="highlight">Our COLLECTIONS</span></h2>

    <table class="gallery">
        <tr>
            <td><div class=" gallery_back" style="background-image: url('image/wedding_1.jpg');"><div id="inner_gallery">WEDDING & RECEPTION <p><a class="linkG"  href="gallery.jsp#wedding">View More</a></p></div></td>
            <td><div class="gallery_back" style="background-image: url('image/birthday.jpeg');"><div id="inner_gallery">BIRTHDAY <p><a class="linkG"  href="gallery.jsp#birthday">View More</a></p></div></td>
            <td><div class="gallery_back" style="background-image: url('image/conference.jfif');"><div id="inner_gallery">CONFERENCES <p><a class="linkG"  href="gallery.jsp#confrence">View More</a></p></div></td>
        </tr>
        <tr>
            <td><div class="gallery_back" style="background-image: url('image/party.jpg');"><div id="inner_gallery">PARTIES <p><a class="linkG"  href="gallery.jsp#party">View More</a></p></div></td>
            <td><div class="gallery_back" style="background-image: url('image/festival.jpg');"><div id="inner_gallery">FESTIVALS <p><a class="linkG"  href="gallery.jsp#festival">View More</a></p></div></td>
            <td><div class="gallery_back" style="background-image: url('image/family_fun.jpg');"><div id="inner_gallery">FAMILY FUNCTIONS <p><a class="linkG"  href="gallery.jsp#family">View More</a></p></div></td>
        </tr>
    </table>

    <hr class="hori">


    <table class="welcome_note">
        <tr>
            <td>We Are Always Ready To Serve YOU,<div>With Pleasure</div><div>Just Give A Call (077-8862-172)</div></td>
            <td><img src="image/waiter1.png" class="waiter"></td>
        </tr>
    </table>

    <!-- <hr class="hori"> -->
    <p></p>
    <table class="event_demo_video">
        <tr>
            <td><iframe width="460" height="215" src="https://www.youtube.com/embed/0yrUDvRfOPc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
            <td class="title">Here, One of Our PROJECT<em class="highlight"> </em> </td>
        </tr>
    </table>

    <hr class="long">

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

       <jsp:include page="/WEB-INF/views/footer.html"></jsp:include>
    </div>

    
</body>
</html>