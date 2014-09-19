package beans;

public class AttendanceBean {

	private String id;
	public void setId(String id) {
		this.id = id;
	}
	public String getId() {
		return this.id;
	}

	private String employe_id;
	public void setEmployeId(String id) {
		this.employe_id = id;
	}
	public String getEmployeId() {
		return this.employe_id;
	}

	private String date_at;
	public void setDateAt(String date) {
		this.date_at = date;
	}
	public String getDateAt() {
		return this.date_at;
	}

	private String start_at;
	public void setStartAt(String start) {
		this.start_at = start;
	}
	public String getStartAt() {
		return this.start_at;
	}

	private String end_at;
	public void setEndAt(String end_at) {
		this.end_at = end_at;
	}
	public String getEndAt() {
		return this.end_at;
	}

}