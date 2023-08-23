<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="store.DBConnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

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


</head>
<body>
	<%!String name, Oname, gmail, password, cpassword;
	Connection connection;
	PreparedStatement statement,statement1;
	ResultSet result;%>

	<%
	connection = DBConnection.getoracleConnection();
	String query = "insert into  Recruiter values(?,?,?,?)";
	statement = connection.prepareStatement(query);

	gmail = request.getParameter("mail");
	name = request.getParameter("name");
	Oname = request.getParameter("Oname");
	password = request.getParameter("password");
	cpassword = request.getParameter("cpassword");

	statement.setString(1, gmail);
	statement.setString(2, name);
	statement.setString(3, Oname);
	statement.setString(4, password);
	%>
	
	<div class="context">
	<%
	if (gmail.trim().isEmpty() || name.trim().isEmpty() || Oname.trim().isEmpty()  || password.trim().isEmpty()) {%>
		<h1>give valid data</h1>
		<img src="./static/imgs/sorry.jpg">
	<%} else {
		String query1 = "select * from  recruiter where mail=?";
		statement1 = connection.prepareStatement(query1);
		statement1.setString(1, gmail);
		result=statement1.executeQuery();
		
		if(result.next()){%>
		<h1>You are already registered</h1>
		<img src="./static/imgs/sorry.jpg">
		<%}
		else if (!password.equals(cpassword)) {%>
		<h1>passwords must be same</h1>
		<img src="./static/imgs/sorry.jpg">
		<%} else {
			statement.executeUpdate();
			response.sendRedirect("index.html");
		}
	}
	%>
	</div>
</body>
</html>