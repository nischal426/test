<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>first web project</title>
</head>
<style>
p {
	color: red;
}
</style>
<body>

	<div>
		<%
			if (request.getAttribute("errorMsg") != null
					&& request.getAttribute("errorMsg").toString()
							.equalsIgnoreCase("null")) {
		%>
		<p>Username or Password must not be blank.</p>
		<%
			} else if (request.getAttribute("errorMsg") != null
					&& request.getAttribute("errorMsg").toString()
							.equalsIgnoreCase("false")) {
		%>
		<p>Invalid User or password .</p>
		<%
			}
		%>


	</div>
	<form action="/myShopingCart/ServletController" method="post">

		Username: <input type="text" name="username" /> <br />
		Password:<input type="password" name="password" /> <br />
		<input type="submit" name="action" value="Login" />
		
		 <input type="reset" value="Clear" />


	</form>

</body>
</html>