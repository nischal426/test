<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*,com.shoping.model.Item"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!ArrayList<Item> list = new ArrayList<Item>();%>
	<%!ArrayList<String> noOfItem = new ArrayList<String>();%>
	<%
		//for (int i = 0; i < noOfItem.size(); i++) {
	%>
	<%
		//System.out.println(noOfItem.size());
		//}
	%>
	<%
		String[] itemID = (String[]) session.getAttribute("itemID");
		//for(int i=0; i<itemID.length; i++) {
		//System.out.println(itemID[i]);
		//}
	%>
	<%
		//String[] quantity =(String[]) session.getAttribute("totalQuantity".toString());
	%>

	<%
		list = (ArrayList<Item>) session.getAttribute("itemList");
		noOfItem = (ArrayList<String>) session
				.getAttribute("totalQuantity");
	%>


	<form action="/myShopingCart/ServletController" method="post">


		<div align="center">
			<h2>Summary of your purchase</h2>
			<table border="1" cellpadding="4">
				<caption>
					<h2>List of Items</h2>
				</caption>
				<tr>
					<th>Item Name</th>
					<th>Item Price</th>
					<th>Quantity</th>
					<th>Price</th>
				</tr>
				<%
					int sum = 0;
				%>
				<%
					for (int i = 0; i < itemID.length; i++) {
				%>
				<tr>

					<th><%=list.get(Integer.parseInt(itemID[i]) - 1)
						.getItem_name()%></th>
					<th><%=list.get(Integer.parseInt(itemID[i]) - 1)
						.getItem_price()%></th>
					<th><%=noOfItem.get(i)%></th>
					<th><%=list.get(Integer.parseInt(itemID[i]) - 1)
						.getItem_price() * Integer.parseInt(noOfItem.get(i))%>
					</th>

					<%
						sum += list.get(Integer.parseInt(itemID[i]) - 1)
									.getItem_price() * Integer.parseInt(noOfItem.get(i));
					%>

				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>Total</th>
					<th><%=sum%></th>
				</tr>

			</table>
		</div>
		<div align="center"></div>
		<input type="hidden" name="page" value="summary"> <br> <input
			type="submit" name="action" value="Back to Cart"> <input
			type="submit" name="action" value="Checkout">
	</form>
</body>
</html>