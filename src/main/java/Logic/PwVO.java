package Logic;

public class PwVO {
	private String mail;
	private String pw;
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	@Override
	public String toString() {
		return "PwVO [mail=" + mail + ", pw=" + pw + "]";
	}
	
	
}
