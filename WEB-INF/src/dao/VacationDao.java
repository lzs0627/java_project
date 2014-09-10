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

public class VacationDao {


	public List<VacationBean> getAll(String limit, String offset) {

		String sql = "SELECT id, employe_id, start_at, end_at, days";
				sql +=" FROM paidvacation limit " + offset +"," + limit;
		List<VacationBean> vacationBeanBList = new ArrayList<VacationBean>();
				
		try {
			Connection con = DBManager.getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			

			while (result.next()) {
				VacationBean bean = new VacationBean();
				bean.setId(result.getString(1));
				bean.setEmployeId(result.getString(2));
				bean.setDays(result.getString(5));
				bean.setStartAt(result.getString(3));
				bean.setEndAt(result.getString(4));
				vacationBeanBList.add(bean);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		return vacationBeanBList;
	}

	public List<VacationBean> getListById(String employe_id, String search_start_at, String search_end_at) {

		String sql = "SELECT v.id, v.employe_id, e.jp_name, v.start_at, v.end_at, v.days ,v.title FROM paidvacation as v ";
				sql +=" INNER join employe as e on e.id=v.employe_id  where  v.employe_id="+employe_id;

	    if (search_start_at != null && search_end_at != null) {
	    	sql += " and not (v.start_at >'" + search_end_at + "' or v.end_at <'" + search_start_at +"')";
	    }


		List<VacationBean> vacationBeanBList = new ArrayList<VacationBean>();
				
		try {

			Connection con = DBManager.getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			

			while (result.next()) {
				VacationBean bean = new VacationBean();
				bean.setId(result.getString(1));
				bean.setEmployeId(result.getString(2));
				bean.setEmployeName(result.getString(3));
				bean.setDays(result.getString(6));
				bean.setStartAt(result.getString(4));
				bean.setEndAt(result.getString(5));
				bean.setTitle(result.getString(7));
				vacationBeanBList.add(bean);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		

		return vacationBeanBList;
	}

	public List<VacationBean> getListByDate(String search_start_at, String search_end_at) {

		String sql = "SELECT v.id, v.employe_id, e.jp_name, v.start_at, v.end_at, v.days,v.title FROM paidvacation as v ";
				sql += " INNER join employe as e on e.id=v.employe_id ";
	    		sql += " where not (v.start_at >'" + search_end_at + "' or v.end_at <'" + search_start_at +"')";


		List<VacationBean> vacationBeanBList = new ArrayList<VacationBean>();
				
		try {

			Connection con = DBManager.getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sql);
			

			while (result.next()) {
				VacationBean bean = new VacationBean();
				bean.setId(result.getString(1));
				bean.setEmployeId(result.getString(2));
				bean.setEmployeName(result.getString(3));
				bean.setDays(result.getString(6));
				bean.setStartAt(result.getString(4));
				bean.setEndAt(result.getString(5));
				bean.setTitle(result.getString(7));
				vacationBeanBList.add(bean);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		

		return vacationBeanBList;
	}
	

	public String add(VacationBean bean) {

		String id = bean.getId();
		String employe_id = bean.getEmployeId();
		String start_at = bean.getStartAt();
		String end_at = bean.getEndAt();
		String days = bean.getDays();
		String title = bean.getTitle();
		String sql = "";

		
		try {
			Connection con = DBManager.getConnection();
			if (id==null || id.length()==0) {
				PreparedStatement stmt = con.prepareStatement(
	                        "insert into paidvacation"
	                                + "(employe_id,start_at,end_at,days,title) "
	                                + " values(?,?,?,?,?)");
				stmt.setString(1,employe_id);
				stmt.setString(2,start_at);
				stmt.setString(3,end_at);
				stmt.setString(4,days);
				stmt.setString(5,title);
				stmt.execute();

			} else {
				
				sql += "update paidvacation set days=?";
				sql += ",employe_id=?";
				sql += ",start_at=?";
				sql += ",end_at=?";
				sql += ",title=?";
				sql	+= " where id=?";
				
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1,days);
				stmt.setString(2,employe_id);
				stmt.setString(3,start_at);
				stmt.setString(4,end_at);
				stmt.setString(5,title);
				stmt.setString(6,id);
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
	                        "delete from paidvacation  where id=?");
				stmt.setString(1,id);
				stmt.execute();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

}