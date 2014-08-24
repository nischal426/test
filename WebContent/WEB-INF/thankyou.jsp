<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
		<table>
			<tr>
				<td colspan="2"><jsp:include page="header.jsp" flush="true"></jsp:include></td>
			</tr>
			<tr>
				<td><jsp:include page="menu.jsp" flush="true" /> </td>
				<td><jsp:include page="bodythank.jsp" flush="true" /></td>
			</tr>
			<tr>
				<td colspan="2"><jsp:include page="footer.jsp" flush="true"></jsp:include></td>
			</tr>


		</table>
	</div>

</body>
</html>