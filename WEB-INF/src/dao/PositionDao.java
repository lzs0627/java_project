package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import beans.PositionBean;

public class PositionDao {


	public List<PositionBean> getAllPositions(String limit, String offset) {

		String sql = "SELECT id, name, description ";
				sql +=" FROM position limit " + offset +"," + limit;
		List<PositionBean> positionList = new ArrayList<PositionBean>();
				
		try {
			Connection con = DBManager.getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			

			while (result.next()) {
				PositionBean bean = new PositionBean();
				bean.setId(result.getString(1));
				bean.setName(result.getString(2));
				bean.setDescription(result.getString(3));
				positionList.add(bean);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		

		return positionList;
	}

	public void addPosition(PositionBean position) {

		String id = position.getId();
		String name = position.getName();
		String desc = position.getDescription();
		String sql = "";

		
		try {
			Connection con = DBManager.getConnection();
			if (id==null) {
				PreparedStatement stmt = con.prepareStatement(
	                        "insert into position "
	                                + "(name,description) "
	                                + " values(?,?)");
				stmt.setString(1,name);
				stmt.setString(2,desc);
				stmt.execute();

			} else {
				sql += "update position set name='" + name + "',description='" + desc + "' where id=" + id;
				PreparedStatement stmt = con.prepareStatement(
	                        "update position set  "
	                                + "name=?,"
	                                + "description=?"
	                                + " where id=?");
				stmt.setString(1,name);
				stmt.setString(2,desc);
				stmt.setString(3,id);
				stmt.execute();

			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

	public void deletePosition(String id){
		try {
			Connection con = DBManager.getConnection();
			PreparedStatement stmt = con.prepareStatement(
	                        "delete from position  where id=?");
				stmt.setString(1,id);
				stmt.execute();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

}