<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@page import="store.DBConnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
    
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	
	body{
		background-image: linear-gradient( 67.6deg,  rgba(225,242,254,1) -2.8%, rgba(193,224,250,1) 44.6%, rgba(19,116,197,1) 102.4% );
	}
	
	h1 {
	text-align: center;
	padding-top: 100px;
	font-family: papyrus;
	font-weight: 700;
}

img {
	display: block;
	height: 300px;
	width: 300px;
	border-radius: 100%;
	margin-left: auto;
	margin-right: auto;
}
	
	
</style>

<body>



<%!String name,cname,dob,phno,status,mail;
	Connection connection;
	PreparedStatement statement;
	int result;
	%>

	<%
	mail=request.getParameter("mail");
	name=request.getParameter("name");
	cname=request.getParameter("cname");
	dob=request.getParameter("dob");
	phno=request.getParameter("phn");
	status=request.getParameter("status");
	
	connection = DBConnection.getoracleConnection();
	String query = "update students set name=?,cname=?,dob=?,phone_number=?,status=? where gmail=?";
	statement = connection.prepareStatement(query);

	statement.setString(6, mail);
	statement.setString(1, name);
	statement.setString(2, cname);
	statement.setString(3, dob);
	statement.setString(4, phno);
	statement.setString(5, status);

	result = statement.executeUpdate();
	
	if(result==1){%>
		<h1>Successfully Updated</h1>
		<img src="./static/imgs/success.jpg">
		<%}
	else{
		%>
		<h1>sorry</h1>
		<img src="./static/imgs/sorry.jpg">
		<%
	}
	%>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>