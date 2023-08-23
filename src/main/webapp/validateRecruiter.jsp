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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Document</title>
<style>
	body{
		background-image: linear-gradient( 67.6deg,  rgba(225,242,254,1) -2.8%, rgba(193,224,250,1) 44.6%, rgba(19,116,197,1) 102.4% );
	}
	.col-4{
		box-shadow: 3px 2px 3px 2px black;
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
</head>
<body>
	<%!String mail, password,notifications;
	Connection connection;
	PreparedStatement statement;
	Statement stmt;
	ResultSet result;%>
	

	<%
	connection = DBConnection.getoracleConnection();
	String query = "select * from Recruiter where mail=? and password=?";
	statement = connection.prepareStatement(query);

	mail = request.getParameter("mail");
	password = request.getParameter("password");

	statement.setString(1, mail);
	statement.setString(2, password);

	result = statement.executeQuery();

	if (result.next()) {
	%>
	
	<% 
	stmt=connection.createStatement();
	String query1="select * from Notifications";
	result=stmt.executeQuery(query1);
	int res=0;
	while(result.next()){
		res++;
	}
	notifications=String.valueOf(res);
	%>
	
	<div class="row p-5">
		<div class="col-6 my-3 p-5">
			<span style="font-family:papyrus;font-weight:600; font-size:19px;">You can Search the details of the students here by the college wise and can by the student wise.<br>You can also get the recent updates of new Recruitments.
			</span><br><br>
			<a href="studentwise.jsp"><div class="btn btn-secondary">Student Wise Details</div></a><br><br>
			<a href="collagewise.jsp"><div class="btn btn-secondary">Collage Wise Details</div><br><br></a>
			<a href="chat.jsp"><div class="btn btn-secondary">New Recruitments  <span class="badge bg-danger"><%=notifications%></span></div><br><br></a>
		</div>
		<div class="col-4 my-3 p-5" style="background-color:aliceblue;">
		<span>Post your Notifications here.</span><br><br>
			<form action="addNotifications.jsp" method="post">
				<div class="mb-3">
					<label for="org" class="form-label">Organization
						address</label> <input type="text" class="form-control"
						id="org" placeholder="Organization" name="oname">
				</div>
				<div class="mb-3">
					<label for="role" class="form-label">Role</label>
					<input type="text" class="form-control"
						id="role" placeholder="Role" name="role">
				</div>
				<div class="mb-3">
					<label for="desc" class="form-label">Description</label>
					<textarea  class="form-control"
						id="desc" style="height: 200px;" placeholder="Description" name="desc"></textarea>
				</div>
				<div class="mb-3">
					<label for="web" class="form-label">Website Link
					</label> <input type="text" class="form-control"
						id="web" placeholder="Web link" name="web">
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
	<%
	} else {
		%>
		<h1>Login Denied</h1>
		<img src="./static/imgs/sorry.jpg">
		<%
		}
	%>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>