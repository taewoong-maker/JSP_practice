package net.guest.sql;

public class GuestDTO {

	private String name;
	private String userid;
	private String pwd;
	private String phone;
	private String email;
	private String title, content, writer;
	private String skey, sval;
	private int pay, hit, admin, sabun, Gtotal;
	private int num, start, end, rn, cnt, rcnt;
	private double point;
	private boolean gender;
	private char grade;
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public int getNum() {
		return num;
	}
	
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}	
	public char getGrade() {
		return grade;
	}
	
	public void setGrade(char grade) {
		this.grade = grade;
	}
	
	public void setGender(boolean gender) {
		this.gender = gender;
	}
	
	public boolean getGender() {
		return gender;
	}
	
	public void setPoint(double point) {
		this.point = point;
	}
	
	public double getPoint() {
		return point;
	}
	
	public int getStart() {
		return start;
	}
	
	public void setStart(int start) {
		this.start = start;
	}
	
	public int getEnd() {
		return end;
	}
	
	public void setEnd(int end) {
		this.end = end;
	}
		
	public void setGtotal(int gtotal) {
		Gtotal = gtotal;
	}
	
	public int getGtotal() {
		return Gtotal;
	}
	
	public String getSkey() {
		return skey;
	}
	
	public void setSkey(String skey) {
		this.skey = skey;
	}
	
	public String getSval() {
		return sval;
	}
	
	public void setSval(String sval) {
		this.sval = sval;
	}
	
	public int getSabun() {
		return sabun;
	}
	
	public void setSabun(int sabun) {
		this.sabun = sabun;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
