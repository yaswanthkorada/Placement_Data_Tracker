<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="store.DBConnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>Document</title>
<style>
body {
	background-image: linear-gradient( 67.6deg,  rgba(225,242,254,1) -2.8%, rgba(193,224,250,1) 44.6%, rgba(19,116,197,1) 102.4% );



}

.col-4 {
	box-shadow: 3px 2px 3px 2px black;
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
	<%!String mail, password, notifications;
	Connection connection;
	Statement statement;
	PreparedStatement stmt;
	ResultSet result, result1;%>

	<%
	connection = DBConnection.getoracleConnection();
	String query = "select * from students where gmail=? and password=?";
	stmt = connection.prepareStatement(query);

	mail = request.getParameter("mail");
	password = request.getParameter("password");

	stmt.setString(1, mail);
	stmt.setString(2, password);

	result = stmt.executeQuery();
	%>

	<%
	statement = connection.createStatement();
	String query1 = "select * from Notifications";
	result1 = statement.executeQuery(query1);
	int res = 0;
	while (result1.next()) {
		res++;
	}
	notifications = String.valueOf(res);
	%>


	<%
	if (result.next()) {
	%>
	<div class="row p-5">
		<div class="col-6 my-3 p-5">
			<span style="font-family:papyrus;font-weight:600; font-size:19px;">You can Search the details of the students here by the college wise and can by the student wise.<br>You can also get the recent updates of new Recruitments.
			</span><br><br> <a
				href="studentwise.jsp"><div class="btn btn-secondary">Student
					Wise Details</div></a><br> <br>
			<a href="collagewise.jsp"><div class="btn btn-secondary">College Wise Details</div></a>
			<br> <br> <a href="chat.jsp"><div
					class="btn btn-secondary">
					New Recruitments <span class="badge bg-danger"><%=notifications%></span>
				</div> <br> <br> </a>
		</div>
		<div class="col-4 my-3 p-5" style="background-color:aliceblue;">
			<span>Update your profile here.</span><br> <br>
			<form action="updateProfile.jsp" method="post">
				<div class="mb-3">
					<label for="mail" class="form-label">Gmail</label> <input
						type="email" class="form-control" id="mail" placeholder="Gmail"
						name="mail">
				</div>
				<div class="mb-3">
					<label for="name" class="form-label">Name</label> <input
						type="text" class="form-control" id="name" placeholder="Name"
						name="name">
				</div>
				<div class="mb-3">
					<label for="cname" class="form-label">Collage Name</label> <input
						type="text" class="form-control" id="cname"
						placeholder="Collage Name" name="cname">
				</div>
				<div class="mb-3">
					<label for="dob" class="form-label">DOB</label> <input type="date"
						class="form-control" id="dob" name="dob">
				</div>
				<div class="mb-3">
					<label for="phn" class="form-label">Phone number </label> <input
						type="text" class="form-control" id="phn"
						placeholder="Phone number" name="phn">
				</div>
				<div class="mb-3">
					<label for="status" class="form-label">Current Status</label> <select
						id="status" name="status">
						<option value="Hiered">Hiered</option>
						<option value="Not-hiered">Not-hiered</option>
					</select>
				</div>
				<button type="submit" class="btn btn-primary">Update</button>
			</form>
		</div>
	</div>
	<%
	} else {%>
		<h1>Login Denied</h1>
		<img src="./static/imgs/sorry.jpg">
	<%}
	%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>