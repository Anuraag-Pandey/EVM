<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>eVote::Home</title>
<%
String clas=request.getParameter("clas"); 
if(clas==null){
	clas="";
	}
String s=request.getParameter("s");
if(s==null){
	s="";
	}
String textinput1=request.getParameter("textinput1");
if(textinput1==null){
	textinput1="";
	}
String textinput2=request.getParameter("textinput2");
if(textinput2==null){
	textinput2="";
	}
%>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="shortcut icon" href="image/icon.jpg"/>
</head>
<body style="background-image:url(image/back.png) "><center>
    <img src="image/logo.png" alt="eVote Logo" height="40%" width="30%">
    <p>Welcome to eVoting, the online Voting for West Bengal VidhanSabha Election.<br/>
            You can vote here and you don't have to go to the voting booth,<br/>
            But you must have a eVoter Card 
            For voting you must have to LogIn first.<br/>
            Happy Elections!!</p>
            
	<form method="post" action="reg.jsp?choice=9&clas=c">
    Search Candidate Approval:<input type="text" style="width:110px;" name="textinput1" value=<%=textinput1%>>
    <button type="submit" class="heading">Go</button>
    <%if(clas.equals("c")==true){%>
     <label><%=s%></label>
     <%} %></form>
     <form method="post" action="reg.jsp?choice=9&clas=p">
    Search Party Approval:<input type="text" style="width:110px;" name="textinput2" value=<%=textinput2%>>
    <button type="submit" class="heading">Go</button>
    <%if(clas.equals("p")==true){%>
     <label><%=s%></label>
     <%} %></form>
    <div class="bottom">
    <a href="log.jsp">LogIn</a>&nbsp;|
    <a href="register.jsp" >Register</a>
    </div>
    </center></body>
</html>