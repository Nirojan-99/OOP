
var i = 0;
function showsignup(){
    if(i==0 ){
    document.getElementById("signup").style.visibility ="visible";
    document.getElementById("sign").style.opacity ="1";
    document.getElementById("log_head").innerHTML ="Sign Up";
    document.getElementById("submit").disabled  =true;
    document.getElementById("reset_form").style.visibility ="hidden";
    document.getElementById("signup").style.backgroundImage ="URL('image/login_ui.jpg')";
    document.getElementById("log_head_s").style.opacity ="1";
    document.getElementById("form_swap").innerHTML ="Instead LogIn <i class='fa fa-long-arrow-left'></i>";
    i=1;
    x=0;
    }
    else{
        document.getElementById("signup").style.visibility ="hidden";
        document.getElementById("log_head").innerHTML ="Log In";
        document.getElementById("submit").disabled  =false;
        i =0;
        document.getElementById("form_swap").innerHTML ="Create New Account <i class='fa fa-long-arrow-right'></i>";
    }
    
}

var x = 0;
function showreset(){
    if(x==0){
        document.getElementById("reset_form").style.visibility ="visible";
    document.getElementById("signup").style.opacity ="1";
    document.getElementById("sign").style.opacity ="0";
    document.getElementById("signup").style.backgroundImage ="none";
    document.getElementById("log_head_s").style.opacity ="0";
    document.getElementById("submit").disabled  =true;
    document.getElementById("log_head").innerHTML ="Reset Password";
    document.getElementById("form_swap").innerHTML ="Create New Account <i class='fa fa-long-arrow-right'></i>";
    x=1;
    i=0;
    }
    else{
        document.getElementById("reset_form").style.visibility ="hidden";
        document.getElementById("signup").style.visibility ="hidden";
    document.getElementById("sign").style.opacity ="0";
    document.getElementById("signup").style.backgroundImage ="none";
    document.getElementById("log_head_s").style.opacity ="0";
    document.getElementById("submit").disabled  =false;
    document.getElementById("log_head").innerHTML ="Log In";
    x=0;
    }
    
}
var pro = 0;
function showprofile(){
    if(pro == 0){
       document.getElementById("a1").style.visibility="visible";
       document.getElementById("a2").style.visibility="hidden";
       document.getElementById("a3").style.visibility="hidden";
       document.getElementById("a4").style.visibility="hidden";
       document.getElementById("main").innerHTML="Your Profilet";
        document.getElementById("submain").innerHTML="Add information about yourself";
       closev =0;
        invitee=0;
        pay =0;
        pro =1;
    }
    else{
        document.getElementById("a1").style.visibility="hidden";
        pro =0;
    }
}

var pay =0;
function showpayment(){
    if(pay == 0){
        document.getElementById("a3").style.visibility="hidden";
        document.getElementById("a2").style.visibility="visible";
        document.getElementById("a1").style.visibility="hidden";
        document.getElementById("a4").style.visibility="hidden";
        document.getElementById("main").innerHTML="Your Payment Detail";
        document.getElementById("submain").innerHTML="";
        closev =0;
        invitee=0;
        pay =1;
        pro =0;
     }
     else{
         document.getElementById("a2").style.visibility="hidden";
         pay =0;
     }
    }

function enable(){
    document.getElementById("text").readOnly = false;
    document.getElementById("text").style.backgroundColor="#fff";
}

var invitee = 0;
function showinvitee(){
    if(invitee == 0){
        document.getElementById("a1").style.visibility="hidden";
        document.getElementById("a2").style.visibility="hidden";
        document.getElementById("a3").style.visibility="visible";
        document.getElementById("a4").style.visibility="hidden";
        document.getElementById("main").innerHTML="Choose your Invitees";
        document.getElementById("submain").innerHTML="";
        closev =0;
        invitee=1;
        pay =0;
        pro =0;
    }
    else{
        document.getElementById("a3").style.visibility="hidden";
        invitee=0;
    }
}


var closev =0;
function showclose(){
    if(closev == 0){
        document.getElementById("a1").style.visibility="hidden";
        document.getElementById("a2").style.visibility="hidden";
        document.getElementById("a3").style.visibility="hidden";
        document.getElementById("a4").style.visibility="visible";
        document.getElementById("main").innerHTML="Close Account";
        document.getElementById("submain").innerHTML="Close your account permanently.";
        closev =1;
        invitee=0;
        pay =0;
        pro =0;
    }
    else{
        document.getElementById("a4").style.visibility="hidden";
        closev=0;
    }
}

function isEqual(){
	var pass1 = document.getElementById("pass1").value;
	var pass2  = document.getElementById("pass2").value;
	
	if(pass1 != pass2 ){
		alert("incorrect passwords");
		document.getElementById("sign").action = "login.jsp";
	}
	else{
	document.getElementById("sign").action = "signup";
	}
}
