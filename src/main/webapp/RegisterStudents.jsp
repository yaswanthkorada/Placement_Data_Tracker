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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
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
	<%!String gmail, sname, cname, course, branch, batch, dob, phone, status, password, cpassword;
	Connection connection;
	PreparedStatement statement, statement1;
	ResultSet result;%>

	<%
	connection = DBConnection.getoracleConnection();
	String query = "insert into students values(?,?,?,?,?,?,?,?,?,?)";
	statement = connection.prepareStatement(query);

	gmail = request.getParameter("email");
	sname = request.getParameter("sname");
	cname = request.getParameter("cname");
	course = request.getParameter("course");
	branch = request.getParameter("branch");
	batch = request.getParameter("batch");
	dob = request.getParameter("dob");
	phone = request.getParameter("phone");
	status = request.getParameter("status");
	password = request.getParameter("password");
	cpassword = request.getParameter("cpassword");

	statement.setString(1, gmail);
	statement.setString(2, sname);
	statement.setString(3, cname);
	statement.setString(4, course);
	statement.setString(5, branch);
	statement.setString(6, batch);
	statement.setString(7, dob);
	statement.setString(8, phone);
	statement.setString(9, status);
	statement.setString(10, password);
	%>


	<div class="p-5">
		<%
		if (sname.trim().isEmpty() || cname.trim().isEmpty() || batch.trim().isEmpty() || gmail.trim().isEmpty()
				|| course.trim().isEmpty() || branch.trim().isEmpty() || phone.trim().isEmpty() || status.trim().isEmpty()
				|| password.trim().isEmpty() || cpassword.trim().isEmpty()) {
		%>
		<h1>Give valid data</h1>
		<img src="./static/imgs/sorry.jpg">
		<%
		} else {

		String query1 = "select * from  students where gmail=?";
		statement1 = connection.prepareStatement(query1);
		statement1.setString(1, gmail);
		result = statement1.executeQuery();

		if (result.next()) {
		%>
		<h1>You are already registered</h1>
		<img src="./static/imgs/sorry.jpg">
		<%
		} else if (!password.equals(cpassword)) {
		%>
		<h1>Passwords must be same</h1>
		<img src="./static/imgs/sorry.jpg">
		<%
		} else if (phone.length() == 10 || phone.length() == 13) {
		statement.executeUpdate();
		response.sendRedirect("index.html");
		} else {
		%>
		<h1>Give a valid phone number</h1>
		<img src="./static/imgs/sorry.jpg">
		<%
		}
		}
		%>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>