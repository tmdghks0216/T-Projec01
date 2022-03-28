package bucket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import product.ProVO;
import common.JDBCUtil;
import member.MemVO;


public class BucketDAO {
   Connection conn;
   PreparedStatement pstmt;
   
   static final String insert="insert into bucket (productpk,memberid) values(?,?)"; //찜목록 넣기(해당 멤버, 해당 제품)
   static final String deleteOne="delete from bucket where productpk=? and memberid=?"; // 해당 제품 지우기
   static final String deleteAll="delete from bucket where memberid=?"; // 해당 멤버의 찜목록 지우기
   static final String deleteAll_productpk="delete from bucket where productpk=?";
   static final String selectAll="select product.* from product join bucket on product.ppk = bucket.productpk where memberid = ?"; // 찜목록 데이터 만들기
   static final String selectOne="select * from bucket where memberid=? and productpk=?";

   public boolean insert(BucketVO vo) {
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(insert);
            pstmt.setInt(1, vo.getProductpk());
            pstmt.setString(2, vo.getMemberid());
            pstmt.executeUpdate();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
         }
         JDBCUtil.disconnect(pstmt, conn);
         return true;
      }
   
   public boolean deleteOne(BucketVO vo) {
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(deleteOne);
            pstmt.setInt(1, vo.getProductpk());
            pstmt.setString(2, vo.getMemberid());
            pstmt.executeUpdate();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
         }
         JDBCUtil.disconnect(pstmt, conn);
         return true;
      }
   
   public boolean deleteAll(BucketVO vo) {
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(deleteAll);
            pstmt.setString(1, vo.getMemberid());
            pstmt.executeUpdate();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
         }
         JDBCUtil.disconnect(pstmt, conn);
         return true;
      }
   public boolean deleteAll_productpk(BucketVO vo) {
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(deleteAll_productpk);
            pstmt.setInt(1, vo.getProductpk());
            pstmt.executeUpdate();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
         }
         JDBCUtil.disconnect(pstmt, conn);
         return true;
      }
   
   public ArrayList<ProVO> selectAll(BucketVO vo) {
         ArrayList<ProVO> datas = new ArrayList<ProVO>();
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(selectAll);
            pstmt.setString(1, vo.getMemberid());
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

   public BucketVO selectOne(BucketVO vo) {
      BucketVO data = null;
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(selectOne);
         pstmt.setString(1, vo.getMemberid());
         pstmt.setInt(2, vo.getProductpk());
         ResultSet rs=pstmt.executeQuery();
         while(rs.next()) {
            data=new BucketVO();
            data.setMemberid(rs.getString("memberid"));
            data.setProductpk(rs.getInt("productpk"));
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      JDBCUtil.disconnect(pstmt, conn);
      return data;   
   }
  

 
}