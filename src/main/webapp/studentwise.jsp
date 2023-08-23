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
<style type="text/css">
#data {
	border-radius: 10px;
	border: 1px solid gray;
	display: inline-flex;
	max-width: 300px;
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>
<body
	style="background-image: linear-gradient(64.3deg, rgba(254, 122, 152, 0.81) 17.7%, rgba(255, 206, 134, 1) 64.7%, rgba(172, 253, 163, 0.64) 112.1%); padding: 20px">


	<%!Connection connection;
	Statement statement;
	ResultSet result;%>

	<%
	connection = DBConnection.getoracleConnection();
	String query = "select * from students";
	statement = connection.createStatement();
	result = statement.executeQuery(query);
	%>
	</div class="p-5">
	<span id="heading" class="p-5">Student Details</span>
	<form>
		<input type="text" id="searchInput" placeholder="Search...">
		<button type="submit">Search</button>
	</form>
	</div>
	<%
	while (result.next()) {
	%>
	<div class="container-fluid  my-3 items" id="data">
		<div class="col p-3 item">
			<h6><%=result.getString(2).toUpperCase()%></h6>
			<span>Gmail:<%=result.getString(1)%></span> <span><%=result.getString(3)%></span>
			<span><%=result.getString(4)%>(<%=result.getString(5)%>)</span> <span>batch:<%=result.getString(6)%></span>
			<span>DOB:<%=result.getString(7)%></span> <span>Phone number:<%=result.getString(8)%></span>
			<span>Currently:<%=result.getString(9)%></span>
		</div>
	</div>
	<%
	}
	%>

	<script>
		const searchInput = document.getElementById("searchInput");
		const itemsList = document.querySelectorAll(".items .item");

		searchInput.addEventListener("keyup", function(event) {
			const userInput = event.target.value.toLowerCase();

			for (let i = 0; i < itemsList.length; i++) {
				const itemText = itemsList[i].textContent.toLowerCase();

				if (itemText.includes(userInput)) {
					itemsList[i].style.display = "block";
				} else {
					itemsList[i].style.display = "none";
				}
			}
		});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>