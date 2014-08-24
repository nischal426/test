package com.shoping.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DatabaseConect {
	public ArrayList<Item> getItem(){
		 ArrayList<Item> items = new ArrayList<Item>();
		 try {
				
				Statement stmt = null;
				Connection conn = null;
				ResultSet rs = null;
				String connectionUrl = "jdbc:mysql://localhost:3306/mall";
				
				Class.forName("com.mysql.jdbc.Driver");
				conn = (Connection) DriverManager.getConnection(connectionUrl,"root","buki");
				System.out.println("Connection made to database..............Item Item");
				
				stmt = conn.createStatement();
				 rs = stmt.executeQuery("select * from sports_center ");
				
				while (rs.next()){
					Item item = new Item();
					item.setId(rs.getInt("item_id"));
					item.setItem_name(rs.getString("item_name"));
					item.setItem_price(rs.getInt("item_price"));
					items.add(item);
								
				
			}
				rs.close();
				
			}
				
			catch (Exception e){
					e.printStackTrace();
				}
				
		    
		    return items ;
	}
	
	 
	
	
	
	

}
