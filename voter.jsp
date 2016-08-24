<%@ page import="eVote.DAO" import= "java.sql.ResultSet,java.util.*" import="javax.servlet.http.HttpSession" session="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Voter Card</title>
<style type="text/css">
tr, td{
border:none;
padding:10px;
padding-right:20px;
}
img:hover{
border:2px solid blue;
hight:110px;
width:130px;
}
</style>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/main1.css"/>
<link rel="shortcut icon" href="image/icon.jpg"/>
</head>
<body style="background-image:url(image/back.png)">
</head>
<body>
<div id="trav">
<header>
     <div style="float:left;"><span style="margin-left:20px; margin-top:10px; margin-bottom:5px;"><img src="image/logo.png" width="120" height="50"></span> </div>
    <div align="right" id="right" style="float:right;">
	<span style="font-size:14px; padding:5px;">
		<% 	 HttpSession session = request.getSession(false);
		 DAO ob = new DAO();
		 String name=(String)session.getAttribute("Userid");
		 String Usertype=(String)session.getAttribute("Usertype");%>
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
<%
if(Usertype.equals("U")){
%>
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
    	<div id="cont">

<%
int x=0,f=0,i;
String [] y= new String[5];
ResultSet ps = ob.fetch(name);
ps.next();
String dob=ps.getString("Dateofbirth");
f=dob.length();
for(i=f-4;i<f;i++)
y[x++]=Character.toString(dob.charAt(i));
String w=y[0]+y[1]+y[2]+y[3];
if(Integer.parseInt(w)<=1997){
	ResultSet rs = ob.viewvoterid(name);
if(rs.next()){
	if(rs.getInt("Approvedstatus")==0){
%>
    
    	<h1>Your Request is still pending.<br>You will be informed soon...</h1>
    

<%}
	else{%>
    <center><b><p style="font-family: Arial, Helvetica, sans-serif;font-size: 40px;color:red;">eVoter Card</p></b></center>
<center>
<h2 color="red">Voter Id</h2>
<table style="border:1px solid #d4d4d4;">
<caption>Election Commission of India</caption>
<tr>
<td colspan="2"><center>
<img src="image/uploadFiles/<%=rs.getString("photo")%>" height="100px" width="120px" border="1"/></td></center>
</tr>
<tr>
<td colspan="2"><center style="color:red; font-weight:bold;"><%= rs.getString("VoterId") %></center></td>
</tr>
<tr><td>Name:</td><td font-weighgt="bold"><%= ps.getString("Firstname")%> <%=ps.getString("Lastname") %></td></tr>
<tr><td>Gender:</td><td><%= ps.getString("Gender") %></td></tr>
<tr><td>DOB:</td><td><%=dob%></td></tr>
<tr>
<td>Constituency:</td>
<td><%=rs.getString("Constituency")%></td>
</tr>
<tr>
<td>Address:</td>
<td><%= ps.getString("Location") %></td>
</tr>
</table>
</center>
<% }}
else{%>
<a href="apply.jsp">Apply for Voter Id</a>
<%}}
else{%>
<h2>Not Eligible to vote</h2>
<%}}
else{%>
<jsp:forward page="home.jsp"></jsp:forward>
<%}%>
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