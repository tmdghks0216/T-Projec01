package product;

public class ProVO {
   private int ppk;
   private String ptitle;
   private String ppic;
   private String pcontent;
   private int pprice;
   private String pmid;
   private String pdate;
   private int pcnt;
   private int pbkcnt;
   private int pstate;
   private String searchCondition;// 검색 조건 > 셀렉에서만 사용
   
   public int getPpk() {
      return ppk;
   }
   public void setPpk(int ppk) {
      this.ppk = ppk;
   }
   public String getPtitle() {
      return ptitle;
   }
   public void setPtitle(String ptitle) {
      this.ptitle = ptitle;
   }
   public String getPpic() {
      return ppic;
   }
   public void setPpic(String ppic) {
      this.ppic = ppic;
   }
   public String getPcontent() {
      return pcontent;
   }
   public void setPcontent(String pcontent) {
      this.pcontent = pcontent;
   }
   public int getPprice() {
      return pprice;
   }
   public void setPprice(int pprice) {
      this.pprice = pprice;
   }
   public String getPmid() {
      return pmid;
   }
   public void setPmid(String pmid) {
      this.pmid = pmid;
   }

   public String getPdate() {
      return pdate;
   }
   public void setPdate(String pdate) {
      this.pdate = pdate;
   }
   public int getPcnt() {
      return pcnt;
   }
   public void setPcnt(int pcnt) {
      this.pcnt = pcnt;
   }
   public int getPbkcnt() {
      return pbkcnt;
   }
   public void setPbkcnt(int pbkcnt) {
      this.pbkcnt = pbkcnt;
   }
   public int getPstate() {
      return pstate;
   }
   public void setPstate(int pstate) {
      this.pstate = pstate;
   }

   public String getSearchCondition() {
      return searchCondition;
   }
   public void setSearchCondition(String searchCondition) {
      this.searchCondition = searchCondition;
   }
   @Override
   public String toString() {
      return "ProVO [ppk=" + ppk + ", ptitle=" + ptitle + ", ppic=" + ppic + ", pcontent=" + pcontent + ", pprice="
            + pprice + ", pmid=" + pmid + ", paddr=" +", pdate=" + pdate + ", pcnt=" + pcnt + ", pbkcnt="
            + pbkcnt + ", pstate=" + pstate + ", searchCondition=" + searchCondition + ", searchContent="
            + "]";
   }
   
   
   
   
}