<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*, com.shoping.model.Item"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%!ArrayList<Item> list = new ArrayList<Item>();%>

	<%
		list = (ArrayList<Item>) session.getAttribute("itemList");
	%>
	<% String[] itemID = null;
//ArrayList <String> noOfItem = new ArrayList<String> ();
//noOfItem = null;
ArrayList <String> noOfItem =null;
noOfItem = (ArrayList<String>)session.getAttribute("totalQuantity");
 itemID =(String[]) session.getAttribute("itemID"); 
System.out.println("***************.........********");
if(itemID !=null){
for(int i =0 ;i <itemID.length;i++){
	System.out.println(itemID[i]);
}
}
if(noOfItem !=null){
	for(int i=0; i<noOfItem.size();i++){
		System.out.println(noOfItem);
	}
}
%>

	

	<div align="center">
		<form action="/myShopingCart/ServletController" method="post">
			<table border="1" cellpadding="5">
				<caption>
					<h2>List of Items</h2>
				</caption>
				<tr>
					<th>Choose Item</th>
					<th>Item Id</th>
					<th>Item Name</th>
					<th>Unit Price</th>
					<th>Quntity</th>
					<%
						for (int i = 0; i < list.size(); i++) {
					%>
				
				<tr>
					<th><input id="<%=list.get(i).getId()%>" type="checkbox" name="item"
						value="<%=list.get(i).getId()%>"></th>
					<th><%=list.get(i).getId()%></th>
					<th><%=list.get(i).getItem_name()%></th>
					<th><%=list.get(i).getItem_price()%></th>
					<th><input id="quantity<%=list.get(i).getId()%>" type="text" name="quantity<%=list.get(i).getId()%>"></th>

					<%
						}
					%>


				</tr>
			</table>
			<div align="center"></div>
			<input type="hidden" name="page" value="cart"> <br> <input
				type="submit" name="action" value="Add to Cart"> <input
				type="submit" name="action" value="Checkout"> <input
				type="reset" name = "action" value="Clear Cart" />

		</form>
	</div>
	<% if(itemID != null){ 
	for(int i=0; i< itemID.length; i++) {%>
	<script>
document.getElementById("<%=itemID[i]%>").checked = "true";
document.getElementById("quantity<%=itemID[i]%>").value = "<%=noOfItem.get(i)%>";
	</script>
	<%
		}
	noOfItem.clear();
		}
	
	%>
</body>
</html>