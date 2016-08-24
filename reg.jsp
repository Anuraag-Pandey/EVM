<%@ page import="java.sql.*" import="eVote.DAO" import= "java.sql.ResultSet" import="javax.servlet.http.HttpSession" session="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession session = request.getSession(false);
double choice = Double.parseDouble(request.getParameter("choice"));
DAO ob = new DAO();
if(choice==1){
	String Firstname=request.getParameter("Firstname");
	String Lastname=request.getParameter("Lastname");
	String Dateofbirth=request.getParameter("Dateofbirth");
	String Gender=request.getParameter("Gender");
	String Street=request.getParameter("Street");
	String Location=request.getParameter("Location");
	String City=request.getParameter("City");
	String State=request.getParameter("State");
	String Pincode=request.getParameter("Pincode");
	String Mobileno=request.getParameter("MobileNo");
	String Emailid=request.getParameter("Emailid");
	String Password=request.getParameter("Password");
	String Userid=ob.usr_register(Firstname,Lastname,Dateofbirth,Gender,Street,Location,City,State,Pincode,Mobileno,Emailid,Password);
		%>
		<h2>Userid:</h2><%= Userid %><%
}
else if(choice==2){
	String Name=request.getParameter("Name");
	String Partyname=request.getParameter("Partyname");
	String District=request.getParameter("District");
	String Constituency=request.getParameter("Constituency");
	String Dateofbirth=request.getParameter("Dateofbirth");
	String Mobileno=request.getParameter("Mobileno");
	String Address=request.getParameter("Address");
	String Emailid=request.getParameter("Emailid");
	String Canid=ob.can_register(Name,Partyname,District,Constituency,Dateofbirth,Mobileno,Address,Emailid);
		%>
		<h2>Canid:</h2><%=Canid %><%
}
else if(choice == 3){

	String Name=request.getParameter("Name");
	String Leader=request.getParameter("Leader");
	String Symbol=request.getParameter("Symbol");
	String Aboutus=request.getParameter("Aboutus");
	String email2=request.getParameter("email2");
	String phone2=request.getParameter("phone2");
	String Parid=ob.party_register(Name,Leader,Symbol,Aboutus,email2,phone2);
		%>
		<h2>Partyid:</h2><%=Parid%><%
}
else if(choice==4){
	String Party=request.getParameter("Party");
	String Userid=request.getParameter("Userid");
	String Constituency=request.getParameter("Constituency");
	boolean s=ob.caste(Constituency,Party,Userid);
	if(s==true){
	%>
	<h2>Your vote has been Successfully registered</h2>
	<% 
	}
	else{%>
	<h2>Your vote has not been registered</h2>
	<%	
	}
}
else if(choice==5){
	String Username=request.getParameter("Userid");
	String Firstname=request.getParameter("Firstname");
	String Lastname=request.getParameter("Lastname");
	String Dateofbirth=request.getParameter("Dateofbirth");
	String Gender=request.getParameter("Gender");
	String Street=request.getParameter("Street");
	String Location=request.getParameter("Location");
	String City=request.getParameter("City");
	String State=request.getParameter("State");
	String Pincode=request.getParameter("Pincode");
	String Mobileno=request.getParameter("MobileNo");
	String Emailid=request.getParameter("Emailid");
	boolean z= ob.edit(Username, Firstname, Lastname, Dateofbirth, Gender, Street,Location,City,State,Pincode,Mobileno,Emailid);%>
	<%= z %><%
}
else if(choice==6){
	String Userid=(String)session.getAttribute("Userid");
	String dobd=request.getParameter("dobd");
	String Constituency=request.getParameter("Constituency");
	String adpd=request.getParameter("adpd");
	String Password=request.getParameter("Password");
	String photo=request.getParameter("photo");
	boolean s=ob.req_voterid(Userid,Password,Constituency,dobd,adpd,photo);
	if (s==true){
		%>
		<h2>Registration for voter id Successfully</h2>
		<%} 
	else {%>
		<h2>Registration for voter id failed</h2>
	<%} %>
<% }
else if(choice==7){
	String Partyname=request.getParameter("Partyname");
	String Constituency=request.getParameter("Constituency");
	String Name=request.getParameter("Name");
	boolean z=ob.addcandidates(Partyname,Constituency,Name);
	%>
	<jsp:forward page="home.jsp"></jsp:forward>
<%
}
else if(choice==8){
	String Name=request.getParameter("Name");
	String Leader=request.getParameter("Leader");
	boolean z=ob.addparty(Name,Leader);
	%>
	<jsp:forward page="home.jsp"></jsp:forward>
	<%
}
else if(choice==9){
	String clas=request.getParameter("clas");
	String id,site;
	if(clas.equals("c")==true){
	id=request.getParameter("textinput1");
	}
	else{
	id=request.getParameter("textinput2");
	}
	String s=ob.approval(clas,id);
	if(clas.equals("c")==true){
	site="index.jsp?clas="+clas+"&s="+s+"&textinput1="+id;
	}
	else{
	site="index.jsp?clas="+clas+"&s="+s+"&textinput2="+id;
	}
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location",site);
}
else if(choice==10){
	String Userid=request.getParameter("Userid");
	String Constituency=request.getParameter("Constituency");
	ob.Approve(Userid,Constituency);
	%>
	<jsp:forward page="home.jsp"></jsp:forward>
	<%
}
else if(choice==11){
	String Electiondate=request.getParameter("Electiondate");
	String Constituency=request.getParameter("Constituency");
	String Countingdate=request.getParameter("Countingdate");
	boolean z=ob.addschedule(Electiondate,Constituency,Countingdate);
	%>
	<jsp:forward page="home.jsp"></jsp:forward>
<%}
else if(choice==12){
String logout  = request.getParameter("logout");
if(logout != null && logout.equals("true")){
	session.invalidate();%>
	<script>var x = confirm("You are successfully logout!!");
	console.log(x);
	if(x){
		alert("Thanks For Using our site!!");
	}</script>
	<jsp:forward page="log.jsp"></jsp:forward>
	
<%}}
else if(choice==13){%>
	<h2>${requestScope.message}</h2>
	<%
}
%>

</body>
</html>