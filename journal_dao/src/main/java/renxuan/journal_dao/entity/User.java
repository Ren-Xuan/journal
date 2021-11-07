package renxuan.journal_dao.entity;
import java.util.List;

public class User {
	private String user_id;		//char(10),to autogenerate
	private String name;		//char(45)
	private String tel;			//char(12)
	private String department;	//char(45)
	private int checked;		//int:-1，0，1
	private int grade;			//int
	private String description;	//char(512)描述
	private String password;	//char(10)
	private String portrait_path;
	private String portrait_name;

	public User() {
		super();
	}
	
	public User(String user_id, String name, String tel, String department, int checked, int grade, String description,
			String password, String portrait_path, String portrait_name) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.tel = tel;
		this.department = department;
		this.checked = checked;
		this.grade = grade;
		this.description = description;
		this.password = password;
		this.portrait_path = portrait_path;
		this.portrait_name = portrait_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getName() {
		return name;
	}
	public String getTel() {
		return tel;
	}
	public String getDepartment() {
		return department;
	}
	public int getChecked() {
		return checked;
	}
	public int getGrade() {
		return grade;
	}
	public String getDescription() {
		return description;
	}
	public String getPassword() {
		return password;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPortrait_path() {
		return portrait_path;
	}

	
	public String getPortrait_name() {
		return portrait_name;
	}

	public void setPortrait_path(String portrait_path) {
		this.portrait_path = portrait_path;
	}

	public void setPortrait_name(String portrait_name) {
		this.portrait_name = portrait_name;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", name=" + name + ", tel=" + tel + ", department=" + department
				+ ", checked=" + checked + ", grade=" + grade + ", description=" + description + ", password="
				+ password + "]";
	}


	
}
