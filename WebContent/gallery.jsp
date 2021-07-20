<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%session.setAttribute("page", "gallery"); %>
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
    <div class="gallery_div" id="top">
        <!-- <img src=" image/head_img.jfif" class="head_img"> -->
        <img src=" image/logo.png" class="head_log  w3-animate-top">
        
        <jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>

        <div class="gallery_head">
            <div class="gallery_hl">Gallery</div>
            <div class="subhead">GOLDEN event management</div>
        </div>


        <!-- body -->
        <br><br>
        <table class="gallery">
            <tr>
                <td><div class=" gallery_back" style="background-image: url(' image/wedding_1.jpg');"><div id="inner_gallery">WEDDING & RECEPTION <p><a class="linkG"  href="#wedding">View More</a></p></div></td>
                <td><div class="gallery_back" style="background-image: url(' image/birthday.jpeg');"><div id="inner_gallery">BIRTHDAY <p><a class="linkG"  href="#birthday">View More</a></p></div></td>
                <td><div class="gallery_back" style="background-image: url(' image/conference.jfif');"><div id="inner_gallery">CONFERENCES <p><a class="linkG"  href="#confrence">View More</a></p></div></td>
            </tr>
            <tr>
                <td><div class="gallery_back" style="background-image: url(' image/party.jpg');"><div id="inner_gallery">PARTIES <p><a class="linkG"  href="#party">View More</a></p></div></td>
                <td><div class="gallery_back" style="background-image: url(' image/festival.jpg');"><div id="inner_gallery">FESTIVALS <p><a class="linkG"  href="#festival">View More</a></p></div></td>
                <td><div class="gallery_back" style="background-image: url(' image/family_fun.jpg');"><div id="inner_gallery">FAMILY FUNCTIONS <p><a class="linkG"  href="#family">View More</a></p></div></td>
            </tr>
        </table>

        <br><br>
        <hr class="hori">
        <br><br>

        <div class="gallery_divs" style="background-image: url(' image/wedding_1.jpg');">
            <div class=" colorC ">
                <div class="gallery_hlG" id="wedding">WEDDING Gallery</div>
                <div class="subheadG">GOLDEN event management</div>
            </div>
        </div>
        <br><br>
        <div class="space">
        <table class="gallery_images_table">
            <tr>
                <td><div class="s_change" style="background-image: url(' image/wedding/1.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/wedding/2.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/wedding/3.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/wedding/4.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/wedding/5.jpeg');"></td>
            </tr>
            <tr>
                <td><div class="s_change" style="background-image: url(' image/wedding/6.jpeg');"></td>
                <td><div class="s_change" style="background-image: url(' image/wedding/7.jpeg');"></td>
                <td><div class="s_change" style="background-image: url(' image/wedding/8.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/wedding/9.jpeg');"></td>
                <td><div class="s_change" style="background-image: url(' image/wedding/10.jpg');"></td>
            </tr>
        </table>
      
        
        </div>

        <br><br>
        <hr class="hori">
        <br><br>

        <div class="gallery_divs" style="background-image: url(' image/birthday_cover.jfif');">
            <div class=" colorC ">
                <div class="gallery_hl" id="birthday">BIRTHDAY Gallery</div>
                <div class="subhead">GOLDEN event management</div>
            </div>
        </div>
        <br><br>
        <div class="space">
        <table class="gallery_images_table">
            <tr>
                <td><div class="s_change" style="background-image: url(' image/birthday/1.png');"></td>
                <td><div class="s_change" style="background-image: url(' image/birthday/2.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/birthday/3.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/birthday/4.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/birthday/5.jfif');"></td>
            </tr>
            <tr>
                <td><div class="s_change" style="background-image: url(' image/birthday//6.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/birthday/7.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/birthday/8.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/birthday/9.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/birthday/10.jfif');"></td>
            </tr>
        </table>
      
        
        </div>

        <br><br>
        <hr class="hori">
        <br><br>

        <div class="gallery_divs" style="background-image: url(' image/conference_cover.jpg');">
            <div class=" colorC ">
                <div class="gallery_hl" id="confrence">CONFERENCES Gallery</div>
                <div class="subhead">GOLDEN event management</div>
            </div>
        </div>
        <br><br>
        <div class="space">
        <table class="gallery_images_table">
            <tr>
                <td><div class="s_change" style="background-image: url(' image/conference/1.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/conference/2.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/conference/3.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/conference/4.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/conference/5.jfif');"></td>
            </tr>
            <tr>
                <td><div class="s_change" style="background-image: url(' image/conference//6.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/conference/7.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/conference/8.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/conference/9.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/conference/10.jpg');"></td>
            </tr>
        </table>
      
        
        </div>

        <br><br>
        <hr class="hori">
        <br><br>

        <div class="gallery_divs" style="background-image: url(' image/party_cover.jfif');">
            <div class=" colorC ">
                <div class="gallery_hl" id="party">PARTIES Gallery</div>
                <div class="subhead">GOLDEN event management</div>
            </div>
        </div>
        <br><br>
        <div class="space">
        <table class="gallery_images_table">
            <tr>
                <td><div class="s_change" style="background-image: url(' image/party/9.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/party/2.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/party/3.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/party/4.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/party/5.jfif');"></td>
            </tr>
            <tr>
                <td><div class="s_change" style="background-image: url(' image/party/6.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/party/7.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/party/8.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/party/9.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/party/10.jfif');"></td>
            </tr>
        </table>
      
        
        </div>

        <br><br>
        <hr class="hori">
        <br><br>

        <div class="gallery_divs" style="background-image: url(' image/festival/9.jfif');">
            <div class=" colorC ">
                <div class="gallery_hlG" id="festival">FESTIVALS Gallery</div>
                <div class="subheadG">GOLDEN event management</div>
            </div>
        </div>
        <br><br>
        <div class="space">
        <table class="gallery_images_table">
            <tr>
                <td><div class="s_change" style="background-image: url(' image/festival/3.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/festival/2.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/festival/2.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/festival/4.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/festival/5.jpg');"></td>
            </tr>
            <tr>
                <td><div class="s_change" style="background-image: url(' image/festival/6.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/festival/7.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/festival/8.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/festival/9.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/festival/10.jpg');"></td>
            </tr>
        </table>
      
        
        </div>

        <br><br>
        <hr class="hori">
        <br><br>

        <div class="gallery_divs" style="background-image: url(' image/family/7.jpg');">
            <div class=" colorC ">
                <div class="gallery_hlG" id="family">FAMILY FUNCTION Gallery</div>
                <div class="subheadG">GOLDEN event management</div>
            </div>
        </div>
        <br><br>
        <div class="space">
        <table class="gallery_images_table">
            <tr>
                <td><div class="s_change" style="background-image: url(' image/family/1.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/family/3.jfif');"></td>
                <td><div class="s_change" style="background-image: url(' image/family/2.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/family/4.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/family/5.jpg');"></td>
            </tr>
            <tr>
                <td><div class="s_change" style="background-image: url(' image/family/6.webp');"></td>
                <td><div class="s_change" style="background-image: url(' image/family/7.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/family/8.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/family/9.jpg');"></td>
                <td><div class="s_change" style="background-image: url(' image/family/10.jpg');"></td>
            </tr>
        </table>
      
        
        </div>
        <hr class="hori">


       <a href="#top"> <i class="fa fa-chevron-circle-up fa-3x"></i></a>
        <jsp:include page="/WEB-INF/views/footer.html"></jsp:include>
    </div>

    
</body>
</html>