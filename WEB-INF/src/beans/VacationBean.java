package beans;

public class VacationBean {

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

	private String title;
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return this.title;
	}


	private String employe_name;
	public void setEmployeName(String id) {
		this.employe_name = id;
	}
	public String getEmployeName() {
		return this.employe_name;
	}

	private String start_at;
	public void setStartAt(String date) {
		this.start_at = date;
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

	private String days;
	public void setDays(String days) {
		this.days = days;
	}
	public String getDays() {
		return this.days;
	}

}