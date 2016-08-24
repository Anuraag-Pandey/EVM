<%@ page language="java" import="eVote.DAO, java.sql.ResultSet,java.text.*" import="javax.servlet.http.HttpSession" session="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>eVote::Home</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/main1.css"/>
<link rel="shortcut icon" href="image/icon.jpg"/>
</head>
<body style="background-image:url(image/back.png)">
<div id="trav">
<header>
     <div style="float:left;"><span style="margin-left:20px; margin-top:10px; margin-bottom:5px;"><img src="image/logo.png" width="120" height="50"></span> </div>
       
    
    <div align="right" id="right" style="float:right;">
	<span style="font-size:14px; padding:5px;">
<%
HttpSession session = request.getSession(false);
DAO ob = new DAO();
String name=(String)session.getAttribute("Userid");
String type=(String)session.getAttribute("Usertype");
%>
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
   <%}
else if(type.equals("A")){%>
  <nav id="menu" style="background:url(image/navBg.png repeat-x;)">
    	<ul id="submenu">
        	<li><a href="home.jsp" style="background-color:orange;" >Home</a></li>
            <li><a href="Viewcandfrparty.jsp?clas=c" >View Candidate Partywise</a></li>
            <li><a href="details.jsp?clas=b">Election Details</a></li>
            <li><a href="viewcandidate.jsp?clas=b">Candidate Details</a></li>
            <li><a href="electionresults.jsp">Election Result</a></li>
            <li><a href="viewparty.jsp?clas=b">Party Details</a></li>
         </ul>
    </nav>
      <%} 
	else{%>
    <jsp:forward page="home.jsp"></jsp:forward>
   <%} %>
          <div id="whole">
       <section id="sec">
       <center><b><p style="font-family: Arial, Helvetica, sans-serif;font-size: 40px;color:red;">Election Results</p></b></center>
       	<div id="cont">
 <%java.util.Calendar calendar = new java.util.GregorianCalendar();
java.util.Date date = calendar.getTime();
DateFormat format=new SimpleDateFormat("dd-MM-yyyy");
String dateval=format.format(date);
boolean rs=false;
ResultSet pes=ob.getConstituency();
ResultSet es=ob.getParty();
String [] l=new String [100],d=new String [100];
int k=0,u=0,p=0,c=0;
int [] w=new int [100],g=new int [100],h=new int [100],z=new int [100],v=new int [100];
while(es.next()){
l[k++]=es.getString("Partyname");
}
while(pes.next()){
String Constituency=pes.getString("Constituency");
int Votercount=pes.getInt("Votercount");
 rs=ob.pending2(Constituency,dateval);
if(rs){
ResultSet s=ob.view(Constituency);
if(s.next()){
	c++;
	%>
	<h3><%=Constituency%>(Winner:<%=s.getString("Partyname")%> )</h3>
	<%
	z[p]=Votercount;
	g[p]=s.getInt("Votecount");
	d[p++]=s.getString("Partyname");
%>
<table border="1">
<tr><td><b>Party</b></td><td><b>Candidate</b></td><td><b>Votecount</b></td></tr>
<%}
ResultSet res=ob.viewresult(Constituency);
while(res.next()){%>
<tr>
	<td><%=res.getString("Partyname") %></td>
	<td><%=res.getString("CandidateName") %></td> 
	<td><%=res.getString("Votecount") %></td>
</tr>
<%}%></table><%} }
for(int q=0;q<k;q++)
	for(int j=0;j<p;j++){
	if(l[q].equals(d[j])){
	w[q]=w[q]+1;
	h[q]+=g[j];
	v[q]+=z[j];
	}}
	int m=w[0];
	for(int q=1;q<k;q++){
		if(w[q]>m){
		m=w[q];
		u=q;
	}
	else if(w[q]==m){
		if((v[u]!=0)&&(v[q]!=0)){
		if((h[u]/v[u])<(h[q]/v[q])){
		m=w[q];
		u=q;
		}}}}
	if(c!=0){%>
	<h1>The Election is won by <%=l[u]%></h1>
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