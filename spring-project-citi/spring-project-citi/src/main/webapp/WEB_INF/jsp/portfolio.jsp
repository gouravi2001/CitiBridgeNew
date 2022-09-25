<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.BufferedReader" %>
<%@page import="java.io.FileReader" %>


<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "spring_jsp_demo";
String userId = "root";
String password = "gouravi";

try {
	Class.forName(driverName);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}

Connection connection = null;
PreparedStatement statement = null;
ResultSet resultSet = null;
%>
<html>
<head>
<title>Portfolio</title>
<style type="text/css">
<%@ include file="style.css" %>
#summary{
display:none;
}

#PriceTotal{
display:none;
}

#TotalQuantity{
display:none;
}

</style>
<link href="webjars/bootstrap/4.6.0/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

</head>
<body
	style="background-color: #8EC5FC; background-image: linear-gradient(129deg, #8EC5FC 0%, #E0C3FC 100%);">

	<form method="post" action="welcome">
		<div class="menu-wrap">
			<input type="checkbox" class="toggler" />
			<div class="hamburger">
				<div></div>
			</div>
			<div class="menu">
				<div>
					<div>
						<ul>
							<li><a href="welcome">Home</a></li>
							<li><input type="submit" name="Auto"
								value="Automobile and Auto Components" id="auto1"
								class="no-outline" /></li>
							<li><input type="submit" name="Auto"
								value="Fast Moving Consumer Goods" id="fast1" class="no-outline" /></li>
							<li><input type="submit" name="Auto"
								value="Financial Services" id="finance1" class="no-outline" /></li>
							<li><input type="submit" name="Auto" value="Healthcare"
								id="health1" class="no-outline" /></li>
							<li><input type="submit" name="Auto"
								value="Information Technology" id="it1" class="no-outline" /></li>
							<li><input value="My portfolio" type="submit" name="Auto"
								class="no-outline" /></li>
							<li><input value="Log out" type="submit" name="Auto"
								class="no-outline" /></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<header class=" ">
	<div class="container portFolio">
			<h2 align="center">
				<font><strong>Summary</strong></font>
			</h2>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Stock Name</th>
						<th scope="col">Quantity of each stock</th>
						<th scope="col">Total Price of each stock</th>

					</tr>
				</thead>
				<tbody>
					<%
					try {
						BufferedReader input = new BufferedReader(new FileReader("C://Users//DeLL//OneDrive//Desktop//user.txt"));
					    String last = null, line;

					    while ((line = input.readLine()) != null) { 
					        last = line;
					    }
						connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
						String sql = "select stockname,sum(totalprice) as price,sum(quantity) as quantity from userhistory where user_id='"+last+"' group by stockname;";
						statement= connection.prepareStatement(sql);
						resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
								%>
								<tr>
									<td><%=resultSet.getString("stockname")%></td>
									<td><%=resultSet.getInt("quantity")%></td>
									<td><%=resultSet.getDouble("price")%></td>
								</tr>
			
								<%
							}
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>
				</tbody>


			</table>
		</div>
		
		<div class="container">
		<div class="row">
		<div class="col-md-4 align-self-center">
		<input value="View history" type="submit" class="tableButtons" onclick="showDiv()">
		</div>
		<div class="col-md-4 align-self-center">
		<input value="Total money spent" type="submit" class="tableButtons" onclick="showDiv1()">
		</div>
		<div class="col-md-4 align-self-center">
		<input value="Total quantity of stock bought" type="submit" class="tableButtons" onclick="showDiv2()">
		</div>
		</div>
		</div>
		<div class="container portFolio" id="summary">
			<h2 align="center">
				<font><strong>History</strong></font>
			</h2>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Stock Name</th>
						<th scope="col">Quantity bought</th>
						<th scope="col">Total Price</th>

					</tr>
				</thead>
				<tbody>
					<%
					try {
						BufferedReader input = new BufferedReader(new FileReader("C://Users//DeLL//OneDrive//Desktop//user.txt"));
					    String last = null, line;

					    while ((line = input.readLine()) != null) { 
					        last = line;
					    }
						connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
						String sql = "SELECT * FROM userhistory where user_id='"+last+"'";
						statement= connection.prepareStatement(sql);
						resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
								%>
								<tr>
									<td><%=resultSet.getString("stockname")%></td>
									<td><%=resultSet.getString("quantity")%></td>
									<td><%=resultSet.getDouble("totalprice")%></td>
								</tr>
			
								<%
							}
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>
				</tbody>
				

			</table>
		</div>
		<div class="container portFolio" id="PriceTotal">
		<%
					try {
						BufferedReader input = new BufferedReader(new FileReader("C://Users//DeLL//OneDrive//Desktop//user.txt"));
					    String last = null, line;

					    while ((line = input.readLine()) != null) { 
					        last = line;
					    }
						connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
						String sql = "SELECT sum(totalprice) as price FROM userhistory where user_id='"+last+"'";
						statement= connection.prepareStatement(sql);
						resultSet = statement.executeQuery(sql);
						resultSet.next();
						String foundType=Double.toString(resultSet.getDouble("price"));
						%>
							<h5>You spent total Rs.<%=foundType%> on the stocks.</h5>
						<%
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>
		</div>
		<div class="container portFolio" id="TotalQuantity">
		<%
					try {
						BufferedReader input = new BufferedReader(new FileReader("C://Users//DeLL//OneDrive//Desktop//user.txt"));
					    String last = null, line;

					    while ((line = input.readLine()) != null) { 
					        last = line;
					    }
						connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
						String sql = "SELECT sum(quantity) as quantity FROM userhistory where user_id='"+last+"'";
						statement= connection.prepareStatement(sql);
						resultSet = statement.executeQuery(sql);
						resultSet.next();
						String foundType=Integer.toString(resultSet.getInt("quantity"));
						%>
							<h5>You have bought total <%=foundType%> stocks.</h5>
						<%
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>
		</div>
	</header>
	<script>
	function showDiv(){
		document.getElementById("summary").style.display="block";
	}
	function showDiv1(){
		document.getElementById("PriceTotal").style.display="block";
	}
	function showDiv2(){
		document.getElementById("TotalQuantity").style.display="block";
	}
	</script>
</body>
</html>