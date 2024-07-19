package com.entity;

public class Doctor {

	private int id;
	private String fullname;
	private String dob;
	private String quoli;
	private String spec;
	private String email;
	private String mobno;
	private String password;

	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Doctor(String fullname, String dob, String quoli, String spec, String email, String mobno, String password) {
		super();
		this.fullname = fullname;
		this.dob = dob;
		this.quoli = quoli;
		this.spec = spec;
		this.email = email;
		this.mobno = mobno;
		this.password = password;
	}

	public Doctor(int id, String fullname, String dob, String quoli, String spec, String email, String mobno,
			String password) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.dob = dob;
		this.quoli = quoli;
		this.spec = spec;
		this.email = email;
		this.mobno = mobno;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getQuoli() {
		return quoli;
	}

	public void setQuoli(String quoli) {
		this.quoli = quoli;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobno() {
		return mobno;
	}

	public void setMobno(String mobno) {
		this.mobno = mobno;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Doctor [id=" + id + ", fullname=" + fullname + ", dob=" + dob + ", quoli=" + quoli + ", spec=" + spec
				+ ", email=" + email + ", mobno=" + mobno + ", password=" + password + "]";
	}

}
