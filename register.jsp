<%@ page language="java" import="net.codejava.servlet.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
input[type="text"].a {
    display:none;
}</style>
<title>eVote::SignUp</title>
<link rel="stylesheet" type="text/css" href="css/main1.css"/>
<link rel="shortcut icon" href="image/icon.jpg"/>
<script type="text/javascript">
function preparePage(){
		document.getElementById("raj").onchange = function(){
			 var i=0, method= document.getElementById("form1").citizen;
			 for(i=0;i<method.length;i++){
				 if(method[i].checked == true){
					 break;
				 }
			 }
			 if(i==0){
				document.getElementById("citizen3").style.display = "block";
				document.getElementById("party").style.display = "none";
				document.getElementById("candidate").style.display = "none";
			 }
			else if( i==1){
				 document.getElementById("citizen3").style.display = "none";
				 document.getElementById("party").style.display = "none";
				 document.getElementById("candidate").style.display = "block";
			}
			else if(i==2){
				 document.getElementById("citizen3").style.display = "none";
				 document.getElementById("party").style.display = "block";
					document.getElementById("candidate").style.display = "none";
			}
		}
	// now hide it on the initial page load.
	document.getElementById("citizen3").style.display = "none";
	document.getElementById("party").style.display = "none";
	document.getElementById("candidate").style.display = "none";
}
function fr(){
	document.getElementById('fr').value=document.getElementById('fl').value;
}

function validateForm(){
	var pass = document.getElementById("pass").value;
	var rpass = document.getElementById("rpass").value;
	if(pass===rpass){
	}
	else{
			alert("Passsword didn't matched!!!");
			return false;
		}
var mob = parseInt(document.getElementById("MobileNo").value ,10 ) || 0;
	for(var i =1 ;i<10;i++){
		if(i!=10 && mob<10){
				alert("Not a Valid Phone No");
				return false;
			}
		mob /= 10;
	}
	return true;
}
function validateForm1(){var mob = parseInt(document.getElementById("Mobileno").value ,10 ) || 0;
for(var i =1 ;i<10;i++){
	if(i!=10 && mob<10){
			alert("Not a Valid Phone No");
			return false;
		}
	mob /= 10;
}}
function validateForm2(){var mob = parseInt(document.getElementById("phone2").value ,10 ) || 0;
for(var i =1 ;i<10;i++){
	if(i!=10 && mob<10){
			alert("Not a Valid Phone No");
			return false;
		}
	mob /= 10;
}}
window.onload=function(){
	preparePage();
};
</script>
</head>
<body style="background-image:url(image/back.png)">
<div id="trav">
<header>
     <div style="float:left;"><span style="margin-left:20px; margin-top:10px; margin-bottom:5px;"><img src="image/logo.png" width="120" height="50"></span> </div>
       
    
    <div align="right" id="right" style="float:right;">
	<span style="font-size:14px; padding:5px;">
	<a href="index.jsp">About eVote</a>  | <a href="log.jsp">LogIn</a></span>
</div>
        <div id="clr"></div>
    </header>
</div>
<br>
<div id="content">
        <div id="raj" style="font-size:14px; color:red;"><form id="form1">
            <input type="radio" name="citizen" value="CIT" id="select"/>Register as Citizen&nbsp;&nbsp;
            <input type="radio" name="citizen" value="CAN" id="select1" />Register as Candidate&nbsp;&nbsp;
            <input type="radio" name="citizen" value="PAR" id="select2" />Create a New Party</form>
        </div><br>
        <div id="citizen3">
         	<form name="signUp" method="post" id="form" onSubmit="return validateForm()">
                <p class="contact"><label for="Firstname">First Name</label></p>
                <input type="text" name="Firstname" placeholder="First Name"  required id="Firstname"/>
                <p class="contact"><label for="Lastname">Last Name</label></p>
                <input type="text" name="Lastname" placeholder="Last Name" required id="Lastname"/>
                <p class="contact"><label for="email">Email</label></p>
                <input type="email" name="Emailid" placeholder="example@domain.com" required id="email"/>
                <p class="contact"><label for="Password">Create a Password</label></p>
                <input type="password" name="Password"  required id="pass"/>
                <p class="contact"><label for="rpass">Confirm your Password</label></p>
                <input type="password" name="rpass" required id="rpass"/>
                <p><label for="textfield4">Date of birth:</label>
                <input type="date" name="Dateofbirth" id="dob" placeholder="dd-mm-yyyy" /><br>
                <select class="select-style gender" name="Gender" >
                        <option value="select">I am..</option>
                        <option value="m">Male</option>
                        <option value="f">Female</option>
                        <option value="others">Other</option>
                 </select><br><br>      
                 <p class="contact"><label for="MobileNo">Mobile No</label></p> 
                 <input id="MobileNo" name="MobileNo" placeholder="Phone Number"  required type="text"> <br>
                 <p><label for="Cit">City:</label></p><br>
                <input type="text" name="City" id="Cit" placeholder="Enter Your City" ><br/>
                <p><label for="Sta">State:</label></p><br>
                <input type="text" name="State" id="Sta" placeholder="Enter Your State" ><br/>
                <p><label for="Pin">Pin Code:</label></p><br>
                <input type="text" name="Pincode" id="Pin" placeholder="Enter Your Pincode"><br/>
                <p><label for="Str">Street:</label></p><br>
                <input type="text" name="Street" id="Str" placeholder="Enter Your Street" ><br/>
                 <p><label for="Add">Full Address:</label></p><br>
                <textarea name="Location" id="add" placeholder="Enter Your Full Address"></textarea><br/>
               
                <input class="buttom" name="submit" id="submit" tabindex="5" value="Sign me up!" type="submit" formaction="reg.jsp?choice=1"/> 
            </form>
                
        </div>
        <div id="candidate">
        	<form name="signUp1" method="post" id="form" onSubmit="return validateForm1()">
             	<p class="contact"><label for="name">Name</label></p>
                <input type="text" name="Name" placeholder="First and Last Name" required id="name1"/>
                <p class="contact"><label for="Emailid">Email</label></p>
                <input type="email" name="Emailid" placeholder="example@domain.com" required id="email1"/>
                 <p class="contact"><label for="party">Partyname</label></p>
                <input type="text" name="Partyname" placeholder="PartyId" required id="partyid"/>
                <p><label for="dob">Date of birth:</label>
                <input type="date" name="Dateofbirth" id="dob1" placeholder="dd-mm-yyyy"/><br/>    
                 <p class="contact"><label for="Mobileno">Mobile No</label></p> 
                 <input id="Mobileno" name="Mobileno" placeholder="Phone Number" required type="text"> <br/>
                 <p class="contact"><label for="Constituency">Constituency</label></p>
                <input type="text" name="Constituency" placeholder="Constituncy" required id="Constituncy"/>
                <p class="contact"><label for="District">District</label></p>
                <input type="text" name="District" placeholder="District" required id="District"/>
                 <p><label for="Add">Full Address:</label></p><br>
                <textarea name="Address" id="add" placeholder="Enter Your Full Address"></textarea><br/>
                 <input class="buttom" name="submit" id="submit" tabindex="5" value="Sign me up!" type="submit" formaction="reg.jsp?choice=2"/> 
            </form>
        </div>
        <div id="party">
        <div>
        <form method="post" target="_blank" enctype="multipart/form-data" onSubmit="fr()">
          <p class= "contact"><label for="fl">Party Symbol</label></p>
			<input type="file" name="fl" size="60" id="fl"/>
			<input type="submit" value="Upload" formaction="/EVM/UploadServlet" />
		</form>
		</div>
        	<form name="signUp2" method="post" id="form" onSubmit="return validateForm2()">
        		<p class="contact"><label for="name">Party Name</label></p>
                <input type="text" name="Name" placeholder="Party Name" required id="name2"/>
                <p class="contact"><label for="leader">Leader Name</label></p>
                <input type="text" name="Leader" placeholder="Leader Name" required id="lname"/>
                <p class="contact"><label for="email">Party Email</label></p>
                <input type="email" name="email2" placeholder="example@domain.com" required id="email2"/>
                <p class="contact"><label for="phone2">Mobile No</label></p> 
                 <input id="phone2" name="phone2" placeholder="Phone Number" required type="text"> <br/>
                 <input class="a" type="text" id="fr" name="Symbol"/>
                <p class="contact"><label for="discription">About Party</label></p>
                <textarea placeholder="Party Details" id="details" name="Aboutus"></textarea>
                <input class="buttom" name="submit" id="submit" tabindex="5" value="Sign me up!" type="submit" formaction="reg.jsp?choice=3"/>
             </form>
        </div>
    
</div>
</body>
</html>