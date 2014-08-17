package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class AdminDao {



	public boolean is_admin(String username, String password)
	{
		String sql ="SELECT * FROM admin where name='"+username+"'";
		sql += " AND password='"+password+"'";
		try {
			Connection con = DBManager.getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			
			if (result.next()) {
				return true;
			}

			return false;
			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		return false;
	}



	
}