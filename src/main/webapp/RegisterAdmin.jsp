<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="store.DBConnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
</style>
</head>

<style>

body{
background-color:rgb(175, 164, 164);
}
h1{
text-align: center;
padding-top:100px;
font-family: papyrus;
font-weight: 700;
}

img{
display:block;
height: 300px;
width: 300px;
border-radius: 100%;
margin-left: auto;
margin-right: auto;
}

</style> 

<body>
	<%!String mail, phone, name, cid, cname, password, cpassword;
	Connection connection;
	PreparedStatement statement, statement1, statement2;
	ResultSet result, result1;%>
	<%
	connection = DBConnection.getoracleConnection();
	String query = "insert into collageAdmin values(?,?,?,?,?,?)";
	statement = connection.prepareStatement(query);

	mail = request.getParameter("mail");
	phone = request.getParameter("phone");
	name = request.getParameter("name");
	cid = request.getParameter("cid");
	cname = request.getParameter("cname");
	password = request.getParameter("password");
	cpassword = request.getParameter("cpassword");

	statement.setString(1, mail);
	statement.setString(2, phone);
	statement.setString(3, name);
	statement.setString(4, cid);
	statement.setString(5, cname);
	statement.setString(6, password);
	%>
	<div class="p-5">
		<%
		if (mail.trim().isEmpty() || phone.trim().isEmpty() || name.trim().isEmpty() || cid.trim().isEmpty()
				|| cname.trim().isEmpty() || password.trim().isEmpty()) {
		%>
		<h1>give valid data</h1>
		<img src="./static/imgs/sorry.jpg">
		<%
		} else {
		String query1 = "select * from  collages where cid=?";
		statement1 = connection.prepareStatement(query1);
		statement1.setString(1, cid);
		result = statement1.executeQuery();

		String query2 = "select * from  collageAdmin where gmail=?";
		statement2 = connection.prepareStatement(query2);
		statement2.setString(1, mail);
		result1 = statement2.executeQuery();

		if (result1.next()) {
		%>
		<h1>You are already registered</h1>
		<img src="./static/imgs/sorry.jpg">
		<%
		} else if (!result.next()) {
		%>
		<h1>first register your college</h1>
		<img src="./static/imgs/sorry.jpg">
		<%
		} else if (!password.equals(cpassword)) {
		%>
		<h1>password must be same</h1>
		<img src="./static/imgs/sorry.jpg">
		<%
		} else if (phone.length() == 10 || phone.length() == 13) {
		statement.executeUpdate();
		response.sendRedirect("index.html");
		} else {
		%>
		<h1>give a valid phone number</h1>
		<img src="./static/imgs/sorry.jpg">
		<%
		}
		}
		%>
	</div>
</body>
</html>