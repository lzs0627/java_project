package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.EmployeBean;

public class EmployeDao {


	public List<EmployeBean> getAllEmaployes(String limit, String offset) {

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

}