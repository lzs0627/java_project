package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import beans.*;

import java.io.*;

public class AttendanceDao {


	public List<AttendanceBean> getAllAttendances(String limit, String offset) {

		String sql = "SELECT a.id, a.employe_id, a.date_at, a.start_at, a.end_at";
				sql +=" FROM attendance limit " + offset +"," + limit;
		List<AttendanceBean> attendanceBList = new ArrayList<AttendanceBean>();
				
		try {
			Connection con = DBManager.getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			

			while (result.next()) {
				AttendanceBean bean = new AttendanceBean();
				bean.setId(result.getString(1));
				bean.setEmployeId(result.getString(2));
				bean.setDateAt(result.getString(3));
				bean.setStartAt(result.getString(4));
				bean.setEndAt(result.getString(5));
				attendanceBList.add(bean);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		

		return attendanceBList;
	}

	public List<AttendanceBean> getListById(String employe_id, String date_at) {

		String sql = "SELECT a.id, a.employe_id, a.date_at, a.start_at, a.end_at";
				sql +=" FROM attendance as a where a.employe_id="+employe_id;

	    if (date_at != null && date_at.length() > 0) {
	    	sql += " and a.date='" + date_at + "'";
	    }


		List<AttendanceBean> attendanceBList = new ArrayList<AttendanceBean>();
				
		try {

			Connection con = DBManager.getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			

			while (result.next()) {
				AttendanceBean bean = new AttendanceBean();
				bean.setId(result.getString(1));
				bean.setEmployeId(result.getString(2));
				bean.setDateAt(result.getString(3));
				bean.setStartAt(result.getString(4));
				bean.setEndAt(result.getString(5));
				attendanceBList.add(bean);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		

		return attendanceBList;
	}


	

	public String add(AttendanceBean bean) {

		String id = bean.getId();
		String employe_id = bean.getEmployeId();
		String date_at = bean.getDateAt();
		String start_at = bean.getStartAt();
		String end_at = bean.getEndAt();

		String sql = "";

		
		try {
			Connection con = DBManager.getConnection();
			if (id==null || id.length()==0) {
				PreparedStatement stmt = con.prepareStatement(
	                        "insert into attendance"
	                                + "(employe_id,date_at,start_at,end_at) "
	                                + " values(?,?,?,?)");
				stmt.setString(1,employe_id);
				stmt.setString(2,date_at);
				stmt.setString(3,start_at);
				stmt.setString(4,end_at);
				stmt.execute();

			} else {
				
				sql += "update attendance set date_at=?";
				sql += ",employe_id=?";
				sql += ",start_at=?";
				sql += ",end_at=?";
				sql	+= " where id=?";
				
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1,date_at);
				stmt.setString(2,employe_id);
				stmt.setString(3,start_at);
				stmt.setString(4,end_at);
				stmt.setString(5,id);
				stmt.execute();
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return sql;
	}

	public void delete(String id){
		try {
			Connection con = DBManager.getConnection();
			PreparedStatement stmt = con.prepareStatement(
	                        "delete from attendance  where id=?");
				stmt.setString(1,id);
				stmt.execute();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

}