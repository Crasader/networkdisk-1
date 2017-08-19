package model;

public class User {
	private Long 		id;
	private String 		email;
	private String 		username;
	private String 		password;
	private String 		portrait;
	private String 		joindate;
	private int 		gender;
	private String tel;
	private String type;
	private String state;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}
	public String getPortrait() {
		return portrait;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getGender() {
		return gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
