package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;
import member.MemVO;

public class ProDAO {
   Connection conn;
   PreparedStatement pstmt;
   
   static final String insert="insert into product (ppk,ptitle,ppic,pcontent,pprice,pmid) values((select nvl(max(ppk),0)+1 from product),?,?,?,?,?)"; // 제품 등록
   static final String delete="delete from product where ppk=?"; // 등록한 제품 삭제
   static final String delete_pmid="delete from product where pmid=?"; // 탈퇴시 등록한 제품 삭제
   static final String update="update product set ptitle=?,ppic=?,pcontent=?,pprice=?  where ppk=?"; // 제품상세페이지 수정
   static final String selectOne="select * from product where ppk=?"; // 제품 하나 보기(상세페이지)
   static final String pcnt_update="update product set pcnt=pcnt+1 where ppk=?"; //클릭시 조회수 up 
   static final String pbkcnt_update="update product set pbkcnt=pbkcnt+1 where ppk=?"; //찜하면 조회수 +1
   static final String pbkcnt_update2="update product set pbkcnt=pbkcnt-1 where ppk=?"; //찜취소하면 조회수 -1
   static final String selectAll="select * from product order by pdate desc"; //모든 제품 목록 보기
   static final String pmid_select1="select * from product where pmid like ? order by pdate desc"; //pmid
   static final String update_state=" update product set pstate=? where ppk=?"; // 찜 상태 업데이트(0,1)
   //static final String price_select="select * from product where pprice BETWEEN ? AND ?"; // 가격으로 검색시

   //검색
   static final String title_select_ppk="select * from product where ptitle like '%'||?||'%' and pprice BETWEEN ? AND ? order by ppk desc"; //title로 검색 and 금액으로 검색
   static final String title_select_pcnt="select * from product where ptitle like '%'||?||'%' and pprice BETWEEN ? AND ? order by pcnt desc"; //title로 검색 and 금액으로 검색
   static final String pmid_select_ppk="select * from product where pmid like '%'||?||'%' and pprice BETWEEN ? AND ? order by ppk desc"; //pmid로 검색 and 금액
   static final String pmid_select_pcnt="select * from product where pmid like '%'||?||'%' and pprice BETWEEN ? AND ? order by pcnt desc"; //pmid로 검색 and 금액

 
   public ArrayList<ProVO> title_select(ProVO vo, int a){
      ArrayList<ProVO> datas = new ArrayList<ProVO>();
      ProVO data=null;
      conn=JDBCUtil.connect();
      try {
         
         if(vo.getSearchCondition()!=null && vo.getSearchCondition().equals("new")) {
            // null값일때 등록순 수행하지 않도록
              pstmt=conn.prepareStatement(title_select_ppk);
              pstmt.setString(1, vo.getPtitle());
              pstmt.setInt(2, vo.getPprice());
              pstmt.setInt(3, a);
         }
         else {//아무것도 설정하지 않았을때 default - 조회순
              pstmt=conn.prepareStatement(title_select_pcnt);
              pstmt.setString(1, vo.getPtitle());
              pstmt.setInt(2, vo.getPprice());
              pstmt.setInt(3, a);
              }
         
         ResultSet rs=pstmt.executeQuery();
         while(rs.next()) {
            data=new ProVO();
            data.setPpk(rs.getInt("ppk"));
            data.setPtitle(rs.getString("ptitle"));
            data.setPpic(rs.getString("ppic"));
            data.setPcontent(rs.getString("pcontent"));
            data.setPprice(rs.getInt("pprice"));
            data.setPmid(rs.getString("pmid"));
            data.setPdate(rs.getString("pdate"));
            data.setPcnt(rs.getInt("pcnt"));
            data.setPbkcnt(rs.getInt("pbkcnt"));
            datas.add(data);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      JDBCUtil.disconnect(pstmt, conn);   
      return datas;
   }  
   
   public ArrayList<ProVO> pmid_select(ProVO vo, int a){
         ArrayList<ProVO> datas = new ArrayList<ProVO>();
         ProVO data=null;
         conn=JDBCUtil.connect();
         try {
            if(vo.getSearchCondition()!=null && vo.getSearchCondition().equals("new")) {
               // null값일때 등록순 수행하지 않도록
               pstmt=conn.prepareStatement(pmid_select_ppk);
               pstmt.setString(1, vo.getPmid());
               pstmt.setInt(2, vo.getPprice());
               pstmt.setInt(3, a);
            }
            else {//아무것도 설정하지 않았을때 default - 조회순
            pstmt=conn.prepareStatement(pmid_select_pcnt);
            pstmt.setString(1, vo.getPmid());
            pstmt.setInt(2, vo.getPprice());
            pstmt.setInt(3, a);
            }
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
               data=new ProVO();
               data.setPpk(rs.getInt("ppk"));
               data.setPtitle(rs.getString("ptitle"));
               data.setPpic(rs.getString("ppic"));
               data.setPcontent(rs.getString("pcontent"));
               data.setPprice(rs.getInt("pprice"));
               data.setPmid(rs.getString("pmid"));
               data.setPdate(rs.getString("pdate"));
               data.setPcnt(rs.getInt("pcnt"));
               data.setPbkcnt(rs.getInt("pbkcnt"));
               datas.add(data);
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         JDBCUtil.disconnect(pstmt, conn);   
         return datas;
      }  


   public boolean insert(ProVO vo) {
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(insert);
            pstmt.setString(1, vo.getPtitle());
            pstmt.setString(2, vo.getPpic());
            pstmt.setString(3, vo.getPcontent());
            pstmt.setInt(4, vo.getPprice());;
            pstmt.setString(5, vo.getPmid());
            pstmt.executeUpdate();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
         }
         JDBCUtil.disconnect(pstmt, conn);
         return true;
      }
   
   public boolean delete(ProVO vo) {
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(delete);
            pstmt.setInt(1, vo.getPpk());
            pstmt.executeUpdate();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
         }
         JDBCUtil.disconnect(pstmt, conn);
         return true;
      }
   
   public boolean delete_pmid(ProVO vo) {
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(delete_pmid);
            pstmt.setString(1, vo.getPmid());
            pstmt.executeUpdate();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
         }
         JDBCUtil.disconnect(pstmt, conn);
         return true;
      }
   
   public boolean update(ProVO vo) {
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(update);
            pstmt.setString(1, vo.getPtitle());
            pstmt.setString(2, vo.getPpic());
            pstmt.setString(3, vo.getPcontent());
            pstmt.setInt(4, vo.getPprice());
            pstmt.setInt(5, vo.getPpk());
            pstmt.executeUpdate();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
         }
         JDBCUtil.disconnect(pstmt, conn);
         return true;
      }
   
   public ProVO selectOne(ProVO vo){
      ProVO data=null;
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(selectOne);
         pstmt.setInt(1, vo.getPpk());
         ResultSet rs=pstmt.executeQuery();
         while(rs.next()) {
            data=new ProVO();
            data.setPpk(rs.getInt("ppk"));
            data.setPtitle(rs.getString("ptitle"));
            data.setPpic(rs.getString("ppic"));
            data.setPcontent(rs.getString("pcontent"));
            data.setPprice(rs.getInt("pprice"));
            data.setPmid(rs.getString("pmid"));            
            data.setPdate(rs.getString("pdate"));
            data.setPcnt(rs.getInt("pcnt"));
            data.setPbkcnt(rs.getInt("pbkcnt"));
            data.setPstate(rs.getInt("pstate"));
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      JDBCUtil.disconnect(pstmt, conn);   
      return data;
   }
   
   public boolean pcnt_update(ProVO vo) {
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(pcnt_update);
            pstmt.setInt(1, vo.getPpk());
            pstmt.executeUpdate();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
         }
         JDBCUtil.disconnect(pstmt, conn);
         return true;
      }
   
   public boolean pbkcnt_update(ProVO vo) {
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(pbkcnt_update);
            pstmt.setInt(1, vo.getPpk());            
            pstmt.executeUpdate();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
         }
         JDBCUtil.disconnect(pstmt, conn);
         return true;
      }
      public boolean pbkcnt_update2(ProVO vo) {
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(pbkcnt_update2);
            pstmt.setInt(1, vo.getPpk());
            pstmt.executeUpdate();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
         }
         JDBCUtil.disconnect(pstmt, conn);
         return true;
      }
      
      public ArrayList<ProVO> selectAll(){
            ArrayList<ProVO> datas = new ArrayList<ProVO>();
            conn=JDBCUtil.connect();
            try {
               pstmt=conn.prepareStatement(selectAll);
               ResultSet rs=pstmt.executeQuery();

               while(rs.next()) {
                  ProVO data=new ProVO(); 
                  data.setPpk(rs.getInt("ppk"));
                  data.setPtitle(rs.getString("ptitle"));
                  data.setPpic(rs.getString("ppic"));
                  data.setPcontent(rs.getString("pcontent"));
                  data.setPprice(rs.getInt("pprice"));
                  data.setPmid(rs.getString("pmid"));
                  data.setPdate(rs.getString("pdate"));
                  data.setPcnt(rs.getInt("pcnt"));
                  data.setPbkcnt(rs.getInt("pbkcnt"));
                  datas.add(data);
               }
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            JDBCUtil.disconnect(pstmt, conn);
            return datas;
         }
    
      public ArrayList<ProVO> pmid_select1(ProVO vo){
            ArrayList<ProVO> datas = new ArrayList<ProVO>();
            ProVO data=null;
            conn=JDBCUtil.connect();
            try {
               pstmt=conn.prepareStatement(pmid_select1);
               pstmt.setString(1, vo.getPmid());
               ResultSet rs=pstmt.executeQuery();
               while(rs.next()) {
                  data=new ProVO();
                  data.setPpk(rs.getInt("ppk"));
                  data.setPtitle(rs.getString("ptitle"));
                  data.setPpic(rs.getString("ppic"));
                  data.setPcontent(rs.getString("pcontent"));
                  data.setPprice(rs.getInt("pprice"));
                  data.setPmid(rs.getString("pmid"));
                  data.setPdate(rs.getString("pdate"));
                  data.setPcnt(rs.getInt("pcnt"));
                  data.setPbkcnt(rs.getInt("pbkcnt"));
                  datas.add(data);
               }
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            JDBCUtil.disconnect(pstmt, conn);   
            return datas;
         } 

      
      public boolean update_state(ProVO vo) {
            conn=JDBCUtil.connect();
            try {
               pstmt=conn.prepareStatement(update_state);
               pstmt.setInt(1, vo.getPstate());
               pstmt.setInt(2, vo.getPpk());
               pstmt.executeUpdate();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
               return false;
            }
            JDBCUtil.disconnect(pstmt, conn);
            return true;
         }
      /*
      public ArrayList<ProVO> price_select(ProVO vo,int b){
         ArrayList<ProVO> datas = new ArrayList<ProVO>();
         ProVO data=null;
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(price_select);
            pstmt.setInt(1, vo.getPprice());
            pstmt.setInt(2, b);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
               data=new ProVO();
               data.setPpk(rs.getInt("ppk"));
               data.setPtitle(rs.getString("ptitle"));
               data.setPpic(rs.getString("ppic"));
               data.setPcontent(rs.getString("pcontent"));
               data.setPprice(rs.getInt("pprice"));
               data.setPmid(rs.getString("pmid"));
               data.setPdate(rs.getString("pdate"));
               data.setPcnt(rs.getInt("pcnt"));
               data.setPbkcnt(rs.getInt("pbkcnt"));
               datas.add(data);
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         JDBCUtil.disconnect(pstmt, conn);   
         return datas;
      }    
           */ 
   }
   