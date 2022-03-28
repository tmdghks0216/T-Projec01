package member;

public class MemVO {
	private String mid;
	private String mnick;
	private String mpw;
	private String mname;
	private String mphone;
	private String addr;
	private String addrapt;
	private String memail;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrapt() {
		return addrapt;
	}
	public void setAddrapt(String addrapt) {
		this.addrapt = addrapt;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	@Override
	public String toString() {
		return "MemVO [mid=" + mid + ", mnick=" + mnick + ", mpw=" + mpw + ", mname=" + mname + ", mphone=" + mphone
				+ ", addr=" + addr + ", addrapt=" + addrapt + ", memail=" + memail + "]";
	}
	
	
}
