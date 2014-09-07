package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import beans.*;

public class DepartmentDao {

	public List<DepartmentBean> getAllDepartments(String limit, String offset) {

		String sql = "SELECT id, name, description ";
				sql +=" FROM department limit " + offset +"," + limit;
		List<DepartmentBean> departmentList = new ArrayList<DepartmentBean>();
				
		try {
			Connection con = DBManager.getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			

			while (result.next()) {
				DepartmentBean bean = new DepartmentBean();
				bean.setId(result.getString(1));
				bean.setName(result.getString(2));
				bean.setDescription(result.getString(3));
				departmentList.add(bean);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		

		return departmentList;
	}

	public DepartmentBean getDetail(String id) {

		String sql = "SELECT id, name, description ";
				sql +=" FROM department where id = "+id+" limit 0,1";
		
				
		try {
			Connection con = DBManager.getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			

			if (result.next()) {
				DepartmentBean bean = new DepartmentBean();
				bean.setId(result.getString(1));
				bean.setName(result.getString(2));
				bean.setDescription(result.getString(3));
				return bean;
			} else {
				return null;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		

		return null;
	}

	public void addDepartment(DepartmentBean department) {

		String id = department.getId();
		String name = department.getName();
		String desc = department.getDescription();
		String sql = "";

		
		try {
			Connection con = DBManager.getConnection();
			if (id==null) {
				PreparedStatement stmt = con.prepareStatement(
	                        "insert into department "
	                                + "(name,description) "
	                                + " values(?,?)");
				stmt.setString(1,name);
				stmt.setString(2,desc);
				stmt.execute();

			} else {
				sql += "update department set name='" + name + "',description='" + desc + "' where id=" + id;
				PreparedStatement stmt = con.prepareStatement(
	                        "update department set  "
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

	public void deleteDepartment(String id){
		try {
			Connection con = DBManager.getConnection();
			PreparedStatement stmt = con.prepareStatement(
	                        "delete from department  where id=?");
				stmt.setString(1,id);
				stmt.execute();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

}