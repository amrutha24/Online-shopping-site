
package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider 
{
	public static Connection getcon()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp","root","admin");
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

}
