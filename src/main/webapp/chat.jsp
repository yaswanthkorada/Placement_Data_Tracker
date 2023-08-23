<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@page import="store.DBConnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style type="text/css">
#data {
	border-radius: 10px;
	border: 1px solid gray;
	display: inline-flex;
	max-width: 300px;
	height:200px;
	background-color: aliceblue;
	box-shadow: 2px 3px 1px 3px gray;
}

span {
	display: block;
	text-transform: capitalize;;
}

#heading {
	font-size: xx-large;
	text-align: center;
	font-family: papyrus;
	font-weight: 1000;
	text-shadow: 2px 3px 3px 1px gray;
}
</style>
</head>
<body style="background-image: linear-gradient( 102.4deg,  rgba(253,189,85,1) 7.8%, rgba(249,131,255,1) 100.3% );
padding:20px">

	<%!String oname, role, desc, link;
	Connection connection;
	Statement statement;
	ResultSet result;%>

	<%
	connection = DBConnection.getoracleConnection();
	statement = connection.createStatement();
	String query = "select * from Notifications";
	result = statement.executeQuery(query);
	%>
	</div class="p-5">
	<span id="heading" class="p-5">New Recruitments</span>
	</div>
	<%
	while (result.next()) {
	%>
	<div class="container-fluid  my-3" id="data">
		<div class="col p-3">
			<div class="col">
				<h6 class="card-title"><%=result.getString(1).toUpperCase()%></h6>
				<span class="card-title"><%=result.getString(2)%></span> <span
					class="card-text"><%=result.getString(3)%></span> <a
					href="<%=result.getString(4)%>" style="color:red"><%=result.getString(4)%></a>
			</div>
		</div>
	</div>
	<%
	}
	%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>