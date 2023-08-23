<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="store.DBConnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

</head>
<body>

	<%!String oname,role,desc,web;
	Connection connection;
	PreparedStatement statement;
	int res;%>

	<%
	connection = DBConnection.getoracleConnection();
	String query = "insert into notifications values(?,?,?,?)";
	statement = connection.prepareStatement(query);

	oname = request.getParameter("oname");
	role = request.getParameter("role");
	desc= request.getParameter("desc");
	web = request.getParameter("web");

	statement.setString(1, oname);
	statement.setString(2, role);
	statement.setString(3, desc);
	statement.setString(4, web);
	


	int res=statement.executeUpdate();	%>
	<h1>Done !</h1>
	<img src="./static/imgs/success.jpg">


</body>
</html>