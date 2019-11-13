package com.javaweb.model;

import java.util.Date;

public class User {
	public int userId;
	public String userName;
	public int sex;
	public String password;
	public String tel;
	public int state;
	public String address;
	public String registerTime;
//	public User() {
//	}
//
//	public User(int userId, String userName, int sex, String password, String tel, int userstate, String address, String registerTime) {
//		this.userId = userId;
//		this.userName = userName;
//		this.sex = sex;
//		this.password = password;
//		this.tel = tel;
//		this.userstate = userstate;
//		this.address = address;
//		this.registerTime = registerTime;
//	}


	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
}