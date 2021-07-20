<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%session.setAttribute("page", ""); %>
    <%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
    <%
if (session.getAttribute("uname") == null ) {
	response.sendRedirect("login.jsp");
	
}
else if(session.getAttribute("eventsession") == null){
	response.sendRedirect("profile.jsp");
	
}

%>
<%@ page import="model.customer"%>
<%@ page import="service.eventService"%>
<%@ page import="model.event"%>
<% String list = eventService.returnList((event)session.getAttribute("eventsession")); %>
<% 
event ev = (event)session.getAttribute("eventsession");
if(session.getAttribute("eventsession") != null)
{
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
    <div class="head_div" style="background-image: url(' image/events_cover.jfif');height: 250px; background-position: 0px -500px;">
        <!-- <img src=" image/head_img.jfif" class="head_img"> -->
        <img src=" image/logo.png" class="head_log  w3-animate-top">
        
       <jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
       
            <div class=" colorC " style="margin-top: 40px;">
                <div class="gallery_hlG" id="wedding " style="color: #fff;">Customize Your Events</div>
                <div class="subheadG" style="color: #fff;">golden events</div>
            </div>
            <br><br>

            <!-- body -->

            <div class="editevent">
                <div class="edithead">Manage Your Event</div>
                <div class="absolute1">
                    <form action="editevent" method="POST" class="createF" >
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
                                    <input type="radio" name="event" value="BIRTHDAY" id="BIRTHDAY" <%= ev.getName().equals("BIRTHDAY") ? "checked": null %>><label for="BIRTHDAY"  > BIRTHDAY</label><br>
                                    <input type="radio" name="event" value="WEDDING" id="WEDDING" <%= ev.getName().equals("WEDDING") ? "checked": null %>><label for="WEDDING"  > WEDDING & RECEPTION</label><br>
                                    <input type="radio" name="event" value="CONFERENCE" id="CONFERENCES"  <%= ev.getName().equals("CONFERENCE") ? "checked": null %>><label for="CONFERENCES"> CONFERENCES</label><br>
                                    <input type="radio" name="event" value="PARTY" id="PARTIES" <%= ev.getName().equals("PARTY") ? "checked": null %>><label for="PARTIES"> PARTIES</label><br>
                                    <input type="radio" name="event" value="FESTIVAL" id="FESTIVALS" <%= ev.getName().equals("FESTIVAL") ? "checked": null %>><label for="FESTIVALS"> FESTIVALS</label><br>
                                    <input type="radio" name="event" value="FAMILY FUNCTION" id="FAMILY" <%= ev.getName().equals("FAMILY FUNCTION") ? "checked": null %>><label for="FAMILY"> FAMILY FUNCTIONS</label><br><br>
                                </td>
                                <td>
                                    <input type="radio" name="photo" value="Clasic" id="1" <%= ev.getPhotography().equals("Clasic") ? "checked": null %>><label for="1"> CLASIC</label><br>
                                    <input type="radio" name="photo" value="Deluxe" id="2" <%= ev.getPhotography().equals("Deluxe") ? "checked": null %>><label for="2" > DELUXE</label><br>
                                    <input type="radio" name="photo" value="Modern" id="3" <%= ev.getPhotography().equals("Modern") ? "checked": null %>><label for="3"> MODERN</label><br>
                                    <input type="radio" name="photo" value="Golden" id="4" <%= ev.getPhotography().equals("Golden") ? "checked": null %>><label for="4"> GOLDEN</label><br>
                                    <input type="radio" name="photo" value="Ultimate" id="5" <%= ev.getPhotography().equals("Ultimate") ? "checked": null %>><label for="5"> ULTIMATE</label><br>
                                    <input type="radio" name="photo" value="no need" id="6" <%= ev.getPhotography().equals("no need") ? "checked": null %> ><label for="6"> NO NEED</label><br><br>
                                </td>
                                <td>
                                    <input type="radio" name="catering" value="Veg" id="11" <%= ev.getCatering().equals("Veg") ? "checked": null %>><label for="11"> VEG ONLY</label><br>
                                    <input type="radio" name="catering" value="Non Veg" id="22" <%= ev.getCatering().equals("Non Veg") ? "checked": null %>><label for="22" > NON VEG</label><br>
                                    <input type="radio" name="catering" value="Continental" id="33" <%= ev.getCatering().equals("Continental") ? "checked": null %>><label for="33"> CONTINENTAL</label><br>
                                    <input type="radio" name="catering" value="Orental" id="44" <%= ev.getCatering().equals("Orental") ? "checked": null %>><label for="44"> ORENTAL</label><br>
                                    <input type="radio" name="catering" value="Chinese" id="55" <%= ev.getCatering().equals("Chinese") ? "checked": null %>><label for="55"> CHINESE</label><br>
                                    <input type="radio" name="catering" value="no need" id="66" <%= ev.getCatering().equals("no need") ? "checked": null %>><label for="66"> NO NEED</label><br><br>
                                </td>
                                <td>
                                    <input type="radio" name="electric" value="Chandeliers" id="111" <%= ev.getElectric_decoration().equals("Chandeliers") ? "checked": null %>><label for="111"> CHANDELIERS</label><br>
                                    <input type="radio" name="electric" value="Wall sconees" id="222" <%= ev.getElectric_decoration().equals("Wall sconees") ? "checked": null %>><label for="222" > WALL SCONEES</label><br>
                                    <input type="radio" name="electric" value="Clasic" id="333" <%= ev.getElectric_decoration().equals("Clasic") ? "checked": null %>><label for="333"> CLASIC</label><br>
                                    <input type="radio" name="electric" value="Basic" id="444" <%= ev.getElectric_decoration().equals("Basic") ? "checked": null %>><label for="444"> BASIC</label><br>
                                    <input type="radio" name="electric" value="pendant lighting" id="555" <%= ev.getElectric_decoration().equals("pendant lighting") ? "checked": null %>><label for="555"> PENDANT LIGGHTING</label><br>
                                    <input type="radio" name="electric" value="no need" id="666" <%= ev.getElectric_decoration().equals("no need") ? "checked": null %>><label for="666"> NO NEED</label><br><br>
                                </td>
                                <td>
                                    <input type="radio" name="flower" value="Basic" id="a" <%= ev.getFlower_decoration().equals("Basic") ? "checked": null %>><label for="a"> BASIC</label><br>
                                    <input type="radio" name="flower" value="Fully Natural" id="b" <%= ev.getFlower_decoration().equals("Fully Natural") ? "checked": null %>><label for="b" > FULLY NATURAL</label><br>
                                    <input type="radio" name="flower" value="Botanical Theme" id="c" <%= ev.getFlower_decoration().equals("Botanical Theme") ? "checked": null %>><label for="c"> BOTANICAL THEME</label><br>
                                    <input type="radio" name="flower" value="Crescent Corsage" id="d" <%= ev.getFlower_decoration().equals("Crescent Corsage") ? "checked": null %>><label for="d"> CRESCENT CORSAGE</label><br>
                                    <input type="radio" name="flower" value="Nosegay Corsage" id="e" <%= ev.getFlower_decoration().equals("Nosegay Corsage") ? "checked": null %>><label for="e"> NOSEGAY CORSAGE</label><br>
                                    <input type="radio" name="flower" value="no need" id="f" <%= ev.getFlower_decoration().equals("no need") ? "checked": null %>><label for="f"> NO NEED</label><br><br>
                                </td>
                            </tr>
                        </table>
                        <br><br>
                        <label class="lab">Event Date : </label><br>
                        <input type="date" placeholder="Event Date" name="date" class=" createinput" value="${eventsession.getDate() }"><br>
                        <input type="number" placeholder="Expected Attendees" class="createinput" name="attendees" value="${eventsession.getAttendees() }"><br>
                        
                        <br>
                        <input type="submit" value="Update Event" name="createE" id="<% if(ev.isConfirmed()){out.print("");}else{ out.print("submit");} %>"  class="resetC createinput" <% if(ev.isConfirmed()){out.print("disabled ");}else{ out.print("");} %>
                        style="background-color:gray;font-weight:bold"><br>
                        <label class="lab">Invitees Email Id : </label><br>
                        
                        <textarea class="createinput" style="height: 100px;" name="list"><%=list %></textarea><br>
                        
                        <input type="submit" value="Send Invitation" name="createE" id="sub1"  class="resetC createinput" style="background-color:gray"><br>
                       
                        </form>
                        <a href="invitation_view.jsp" class="linkP" ><input type="submit" value="Pre-View Invitation" name="createE" id="submit" class="resetC createinput"></a>
    					
    					<a class="link" style="background-color:<% if(ev.isConfirmed()){out.print("grey");}else{ out.print("");} %>;float:right"   href="<% if(ev.isConfirmed()){out.print("");}else{ out.print("DeleteEvent?id="+ev.getId()+"");} %>">DELETE EVENT</a>
                
            </div>


            <jsp:include page="/WEB-INF/views/footer.html"></jsp:include>
        </div>
    
        
    </body>
    </html>
    <%}%>