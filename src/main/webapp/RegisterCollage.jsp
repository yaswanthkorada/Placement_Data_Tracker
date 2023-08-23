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
<title>register collage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
	<%!String cid, cname, state, city, pincode;
	Connection connection;
	PreparedStatement statement, statement1;
	ResultSet result;%>


	<%
	connection = DBConnection.getoracleConnection();
	String query = "insert into collages values(?,?,?,?,?)";
	statement = connection.prepareStatement(query);

	cid = request.getParameter("cid");
	cname = request.getParameter("cname");
	state = request.getParameter("state");
	city = request.getParameter("city");
	pincode = request.getParameter("pin");

	statement.setString(1, cid);
	statement.setString(2, cname);
	statement.setString(3, state);
	statement.setString(4, city);
	statement.setString(5, pincode);
	%>
	<div class="p-5">
	<%
	if (cid.trim().isEmpty() || cname.trim().isEmpty() || state.trim().isEmpty() || city.trim().isEmpty()
			|| pincode.trim().isEmpty()) {	%>
		<h1>Give valid data</h1>
		<img src="./static/imgs/sorry.jpg">
	<%} else {
		String query1 = "select * from  collages where cid=?";
		statement1 = connection.prepareStatement(query1);
		statement1.setString(1, cid);
		result = statement1.executeQuery();
		if (result.next()) {%>
			<h1>College already registered</h1>
			<img src="./static/imgs/sorry.jpg">
			<%} else {
			statement.executeUpdate();
			response.sendRedirect("index.html");
		}
	}
	%>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>