<%@ page language="java" import="eVote.DAO, java.sql.ResultSet" import="javax.servlet.http.HttpSession" import="net.codejava.servlet.*" session="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
input[type="text"].a {
    display:none;
}</style>
<title>eVoterCard Registration</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/main1.css"/>
<link rel="shortcut icon" href="image/icon.jpg"/>
<script type="text/javascript">
function fr(){
document.getElementById('dobd').value=document.getElementById('dob').value;
document.getElementById('adpd').value=document.getElementById('adp').value;
document.getElementById('photo').value=document.getElementById('phot').value;
}
</script>
</head>
<body style="background-image:url(image/back.png)">
<div id="trav">
<header>
     <div style="float:left;"><span style="margin-left:20px; margin-top:10px; margin-bottom:5px;"><img src="image/logo.png" width="120" height="50"></span> </div>
       
    
    <div align="right" id="right" style="float:right;">
	<span style="font-size:14px; padding:5px;">
<%HttpSession session = request.getSession(false);
String type=(String)session.getAttribute("Usertype");
String name=(String)session.getAttribute("Userid");%>
<select class="user" onchange="location = this.options[this.selectedIndex].value;">
                <option selected>
		 <%
                out.print(name);
            
            %>
		        </option>
                <option value="profile.jsp">Profile</option>
                <option value="pass.jsp">Change Password</option>
                <option value="reg.jsp?choice=12&logout=true">Log Out</option>
            </select>
	|<a href="index.jsp">About eVote</a>  | <a href="home.jsp">Home</a></span>
	<br>
	  <form action="results.jsp">
    Search:<input type="text" style="width:110px;" name="textinput">
    <button type="submit" class="heading">Go</button></form>
</div>
        <div id="clr"></div>
    </header>
</div>
<% if(type.equals("U")){%>
<nav id="menu" style="background:url(image/navBg.png repeat-x;)">
    	<ul id="submenu">
        	<li><a href="home.jsp" style="background-color:orange;" >Home</a></li>
            <li><a href="voter.jsp" >eVoter Card</a></li>
            <li><a href="details.jsp?clas=a">Election Details</a></li>
            <li><a href="cast.jsp">Cast Vote</a></li>
            <li><a href="electionresults.jsp">Election Result</a></li>
            <li><a href="viewcandidate.jsp?clas=a">Candidate Details</a></li>
            <li><a href="contact.jsp">Contacts</a></li>
            <li><a href="viewparty.jsp?clas=a">Party Details</a></li>
         </ul>
    </nav>
   <div id="whole">
     <section id="sec">
     <center><b><p style="font-family: Arial, Helvetica, sans-serif;font-size: 40px;color:red;">Apply for eVoterCard</p></b></center>
    	<div id="cont">
<div style="border:2px dotted black;">
<form method="post" target="_blank" enctype="multipart/form-data" onSubmit="fr()">
<p class="contact"><label for="text"><font color="blue">Date of Birth Proof:</font></label></p>
<input type="file" name="dob" id="dob" value="DOB"> 
<p class="contact"><label for="text1"><font color="blue">Address Proof:</font></label></p>
<input type="file" name="adp" id="adp" value="address">
<p class="contact"><label for="text2"><font color="blue">Photo:</font></label></p>
<input type="file" name="phot" id="phot" value="Photo">
<center><input type="submit" value="Upload" formaction="/EVM/UploadServlet"/></center>
</form>
</div>
<form method="post">
<input class="a" type="text" id="dobd" name="dobd"/>
<input class="a" type="text" id="adpd" name="adpd"/>
<input class="a" type="text" id="photo" name="photo"/>
<p class="contact"><label for="textfield1">constituency:</label></p>
<input type="text" name="Constituency" align="center" placeholder="Constituency" required>
<p class="contact"><label for="textfield2"> Password:</label></p>
<input type="text" name="Password" id="textfield" placeholder="Password" required>
<br/>
<input class="buttom" name="submit" id="submit" tabindex="5" value="Register!" type="submit" formaction="reg.jsp?choice=6">
</form>
</div>
    </section>
    <aside id="ad">
    <div="news>
    <table border="1" width="100px" bgcolor="#ffffff">
            <tr bordercolor="#FFFFFF"><td><center><img src="image/splWeekHeading.png"></center></td></tr>
   			<tr><td><marquee direction="up"><center><h3 style="color:red">Important Dates</h3><br><h5 style="color:blue">Party Registration Last Day&nbsp; &nbsp; &nbsp;06/15/2015</h5>
<br><h5 style="color:blue">Candidate Registration Last Day&nbsp; &nbsp; &nbsp;06/15/2015</h5>
<br><h5 style="color:blue">Voter ID Req  Last Day&nbsp; &nbsp; &nbsp;06/15/2015</h5>

<br><h5 style="color:blue">Voting Starts From&nbsp; &nbsp; &nbsp;06/15/2015</h5>
</center></marquee></td>
    	</tr></table>
        <div style="position:relative; right:-300px; top:-30px; margin-top:0px; width:40px;"><a href="#"><img src="image/viewAll.png"></a></div>
            <img src="image/add2.jpg">
</div>
    </aside>
    </div>
<%
}
else{%>
<jsp:forward page="home.jsp"></jsp:forward>
<%} %>
<div class="footer">	
	<div class="subFooter">
		<a href="#" class="back2Top" id="toTop"><img src="image/bk2Top.png" width="196px" height="40px" alt="" title="" /></a>
    	<div class="footerMenu marginRigh40">
        <h1>Quick Links</h1>
        	<ul>
            	<li><a href="home.jsp">Home</a></li>
                <li><a href="http://eci.nic.in/m/faqs.html">FAQ</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
            </ul>
        </div>
        <div class="footerMenu footerMenu2">
        <br>
        	<ul>
				<li><a href="https://en.m.wikipedia.org/wiki/Government_of_India">Govt. of India</a>
                <li><a href="https://en.m.wikipedia.org/wiki/Government_of_West_Bengal">Govt. West Bengal</a></li>
                <li><a href="https://en.m.wikipedia.org/wiki/Election_Commission_of_India">Election Commission</a></li> 
            </ul>
            <div class="clear"></div>
        </div>
        <div class="footerSocialIcon">
        <h1>Find us</h1>
        <a href="https://www.facebook.com"><img src="image/f_connect.png" alt="Connect to Facebook" title="Connect to Facebook" /></a>
        <a href="https://twitter.com"><img src="image/t_follow.png" alt="Follow on Twitter" title="Follow on Twitter" /></a>
        <a href="https://www.linkedin.com"><img src="image/l_connect.png" alt="Connect on LinkedIn" title="Connect on LinkedIn" /></a>
        </div>
        <div class="clear">&nbsp;</div><br>
        <div id="last"> <center><sup color="red">&copy;</sup> Election Commission Of India Devloped By Ankit Prasad & Designed by Suraj Shaw</center>
</div>
    </div>
    </div>
   
</body>
</html>