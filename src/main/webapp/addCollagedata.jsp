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

	<%!String cname,ayear,batch,course,total,hired,nothired;
	Connection connection;
	PreparedStatement statement;
	int res;%>

	<%
	connection = DBConnection.getoracleConnection();
	String query = "insert into collagesdata values(?,?,?,?,?,?,?)";
	statement = connection.prepareStatement(query);

	cname = request.getParameter("cname");
	ayear = request.getParameter("ayear");
	batch = request.getParameter("batch");
	course = request.getParameter("course");
	total = request.getParameter("total");
	hired = request.getParameter("hired");
	nothired = request.getParameter("not");

	statement.setString(1, cname);
	statement.setString(2, ayear);
	statement.setString(3, batch);
	statement.setString(4, course);
	statement.setString(5, total);
	statement.setString(6, hired);
	statement.setString(7, nothired);


	int res=statement.executeUpdate();	%>
	<h1>Done !</h1>
	<img src="./static/imgs/success.jpg">


</body>
</html>