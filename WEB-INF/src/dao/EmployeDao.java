package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import beans.EmployeBean;

import java.io.*;

public class EmployeDao {


	public List<EmployeBean> getAllEmployes(String limit, String offset) {

		String sql = "SELECT e.id, e.jp_name, e.en_name, e.face_img, e.department_id, d.name as department_name, e.address, e.enter_date, e.leave_date, e.position_id, p.name ,e.email, e.password as position_name";
				sql +=" FROM employe as e LEFT JOIN department as d on d.id=e.department_id LEFT JOIN position as p on p.id=e.position_id limit " + offset +"," + limit;
		List<EmployeBean> employeBList = new ArrayList<EmployeBean>();
				
		try {
			Connection con = DBManager.getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			

			while (result.next()) {
				EmployeBean bean = new EmployeBean();
				bean.setId(result.getString(1));
				bean.setJpName(result.getString(2));
				bean.setEnName(result.getString(3));
				bean.setFaceImg(result.getString(4));
				bean.setDepartmentId(result.getString(5));
				bean.setDepartmentName(result.getString(6));
				bean.setAddress(result.getString(7));
				bean.setEnterDate(result.getString(8));
				bean.setLeaveDate(result.getString(9));
				bean.setPositionId(result.getString(10));
				bean.setPositionName(result.getString(11));
				bean.setEmail(result.getString(12));
				bean.setPassword(result.getString(13));
				employeBList.add(bean);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		

		return employeBList;
	}

	public List<EmployeBean> getEmployesByDid(String did, String limit, String offset) {

		String sql = "SELECT e.id, e.jp_name, e.en_name, e.face_img, e.department_id, d.name as department_name, e.address, e.enter_date, e.leave_date, e.position_id, p.name ,e.email, e.password as position_name";
				sql +=" FROM employe as e LEFT JOIN department as d on d.id=e.department_id LEFT JOIN position as p on p.id=e.position_id where e.department_id="+did+" limit " + offset +"," + limit;

		List<EmployeBean> employeBList = new ArrayList<EmployeBean>();
				
		try {
			Connection con = DBManager.getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			

			while (result.next()) {
				EmployeBean bean = new EmployeBean();
				bean.setId(result.getString(1));
				bean.setJpName(result.getString(2));
				bean.setEnName(result.getString(3));
				bean.setFaceImg(result.getString(4));
				bean.setDepartmentId(result.getString(5));
				bean.setDepartmentName(result.getString(6));
				bean.setAddress(result.getString(7));
				bean.setEnterDate(result.getString(8));
				bean.setLeaveDate(result.getString(9));
				bean.setPositionId(result.getString(10));
				bean.setPositionName(result.getString(11));
				bean.setEmail(result.getString(12));
				bean.setPassword(result.getString(13));
				employeBList.add(bean);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		

		return employeBList;
	}

	public EmployeBean getDetail(String id) {

		String sql = "SELECT e.id, e.jp_name, e.en_name, e.face_img, e.department_id, d.name as department_name, e.address, e.enter_date, e.leave_date, e.position_id, p.name ,e.email, e.password as position_name";
				sql +=" FROM employe as e LEFT JOIN department as d on d.id=e.department_id LEFT JOIN position as p on p.id=e.position_id where e.id="+id;
						
		try {

			Connection con = DBManager.getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			
			if (result.next()) {

				EmployeBean bean = new EmployeBean();
				bean.setId(result.getString(1));
				bean.setJpName(result.getString(2));
				bean.setEnName(result.getString(3));
				bean.setFaceImg(result.getString(4));
				bean.setDepartmentId(result.getString(5));
				bean.setDepartmentName(result.getString(6));
				bean.setAddress(result.getString(7));
				bean.setEnterDate(result.getString(8));
				bean.setLeaveDate(result.getString(9));
				bean.setPositionId(result.getString(10));
				bean.setPositionName(result.getString(11));
				bean.setEmail(result.getString(12));
				bean.setPassword(result.getString(13));

				return bean;
			}
			return null;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	

		return null;
	}

	public void addEmploye(EmployeBean employe) {

		String id = employe.getId();
		String jpname = employe.getJpName();
		String enname = employe.getEnName();
		String email  = employe.getEmail();
		String password = employe.getPassword();
		String address = employe.getAddress();
		String department_id = employe.getDepartmentId();
		String position_id = employe.getPositionId();
		String enterdate = employe.getEnterDate();
		String leavedate = employe.getLeaveDate();

		String sql = "";

		
		try {
			Connection con = DBManager.getConnection();
			if (id==null || id.length()==0) {
				PreparedStatement stmt = con.prepareStatement(
	                        "insert into employe"
	                                + "(jp_name,en_name,email,password,department_id,address,enter_date,leave_date,position_id) "
	                                + " values(?,?,?,?,?,?,?,?,?)");
				stmt.setString(1,jpname);
				stmt.setString(2,enname);
				stmt.setString(3,email);
				stmt.setString(4,password);
				stmt.setString(5,department_id);
				stmt.setString(6,address);
				stmt.setString(7,enterdate);
				stmt.setString(8,leavedate);
				stmt.setString(9,position_id);
				stmt.execute();

			} else {
				

    
				sql += "update employe set jp_name=?";
				sql += ",en_name=?";
				sql += ",email=?";
				sql += ",password=?";
				sql += ",department_id=?";
				sql += ",address=?";
				sql += ",enter_date=?";
				sql += ",leave_date=?";
				sql += ",position_id=?";
				sql	+= " where id=?";
				
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1,jpname);
				stmt.setString(2,enname);
				stmt.setString(3,email);
				stmt.setString(4,password);
				stmt.setString(5,department_id);
				stmt.setString(6,address);
				stmt.setString(7,enterdate);
				stmt.setString(8,leavedate);
				stmt.setString(9,position_id);
				stmt.setString(10,id);
				stmt.execute();

			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

	public void deleteEmploye(String id){
		try {
			Connection con = DBManager.getConnection();
			PreparedStatement stmt = con.prepareStatement(
	                        "delete from employe  where id=?");
				stmt.setString(1,id);
				stmt.execute();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

}