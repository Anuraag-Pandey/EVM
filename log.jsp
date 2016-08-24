<%@ page language="java" import="eVote.DAO" import= "java.sql.ResultSet" import="javax.servlet.http.HttpSession" session="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>eVote::LogIn</title>
<link rel="stylesheet" type="text/css" href="css/main1.css"/>
<link rel="shortcut icon" href="image/icon.jpg"/>
</head>
<body style="background-image:url(image/back.png)">
<div id="trav">
<header>
     <div style="float:left;"><span style="margin-left:20px; margin-top:10px; margin-bottom:5px;"><img src="image/logo.png" width="120" height="50"></span> </div>
       
    
    <div align="right" id="right" style="float:right;">
	<span style="font-size:14px; padding:5px;">
	<a href="index.jsp">About eVote</a>  | <a href="register.jsp">Register</a></span>
</div>
        <div id="clr"></div>
    </header>
</div>
<br>
<%String choice = request.getParameter("choice"); %>
<div id="content" >
    <form method="post" action="log.jsp?choice=4">
    <p class="contact">Userid:</p>
    <input type="text" name="Userid" placeholder="Userid" required>
    <p class="contact">Password:</p>
    <input type="password" name="Password" placeholder="Password" required>
    <p class="contact">User Type:</p>
    <input type="text" name="Usertype" placeholder="Usertype" required>
    <div id="error" style="color:Red; font-size:12px;"></div></span><br>
    <input type="submit"  value="Log In" class="buttom"/>
    <a href="register.jsp"><input type="button" value="Sign Up" class="buttom"></a>
    </form>
</div>
<%

DAO ob = new DAO();
if(choice != null && choice.equals("4")){
	String Userid=request.getParameter("Userid");
	String Password=request.getParameter("Password");
	String Usertype=request.getParameter("Usertype");
	boolean z =ob.login(Userid,Password,Usertype);
	if(z==true){
		HttpSession session = request.getSession(true);
		session.setAttribute("Userid", Userid);
		session.setAttribute("Usertype", Usertype);
		%>
		<jsp:forward page="home.jsp"></jsp:forward><%
	}
	else{
		%>
		<script type="text/javascript">
		document.getElementById("error").innerHTML = "<u>Invalid User Name or Password</u>";
		</script><%
	}

}
%>