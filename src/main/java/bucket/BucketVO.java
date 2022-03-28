package bucket;

public class BucketVO {
	private int productpk;
	private String memberid;
	public int getProductpk() {
		return productpk;
	}
	public void setProductpk(int productpk) {
		this.productpk = productpk;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	@Override
	public String toString() {
		return "BucketVO [productpk=" + productpk + ", memberid=" + memberid + "]";
	}
	
	

	
}
