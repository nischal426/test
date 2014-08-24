package com.shoping.model;


import java.sql.*;



public class LoginCheck {
	
	public boolean authenticate(String username, String password){
		boolean isValidUser = false;
		
	try {
		
		Statement stmt = null;
		Connection conn = null;
		String connectionUrl = "jdbc:mysql://localhost:3306/user_login";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection) DriverManager.getConnection(connectionUrl,"root","buki");
		System.out.println("Connection made to database..............");
		
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from login ");
		
		while (rs.next()){
		String un = rs.getString("username");
		String pw = rs.getString("password");
		//System.out.println(un + "\t" + pw);
		
				if(username !=null && password !=null){
					if(username.trim().equalsIgnoreCase(un) && password.trim().equals(pw)){
						isValidUser = true;
					}
				}
			
		
		
	}
		
		
	}
		
	catch (Exception e){
			e.printStackTrace();
		}
		
		
	return isValidUser;
		
	}
	
}
	
	
	
	
	


	
	

