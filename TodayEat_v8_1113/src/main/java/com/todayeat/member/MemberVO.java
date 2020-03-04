package com.todayeat.member;

public class MemberVO {
	
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String phone;
	private String email;
	private String email02;
	private String address;
	private String profile;
	
	public MemberVO() {}
	
	public MemberVO(String id, String password, String name, String nickname, String phone, String email,
			String email02, String address, String profile) {
		
		
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.email = email;
		this.email02 = email02;
		this.address = address;
		this.profile = profile;
	}

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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail02() {
		return email02;
	}

	public void setEmail02(String email02) {
		this.email02 = email02;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
}
