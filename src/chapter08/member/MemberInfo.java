package chapter08.member;

import java.util.Date;

/**
 * @author PC-08
 * 자바빈 : 속성(데이터), 변경 이벤트, 객체 직렬화를 위한 표준 
 */
public class MemberInfo {
    
	private String id;
	private String password;
	private String name;
	private String address;
	private Date registerDate;
	private String email;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}	
	
}
