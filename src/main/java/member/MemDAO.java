package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class MemDAO {
   Connection conn;
   PreparedStatement pstmt;
   
   static final String insert="insert into member (mid,mnick,mpw,mname,mphone,addr,addrapt,memail) values(?,?,?,?,?,?,?,?)"; //회원가입
   static final String delete="delete from member where mid=?"; // 회원 탈퇴
   static final String update="update member set mname=?, mpw=?, addr=?,addrapt=? where mid=?"; //회원 정보 수정
   static final String selectOne="select * from member where mid=?"; // 내정보 보기
   static final String selectnick="select * from member where mnick=?"; // 닉네임 유효성 검사
   static final String phone_update="update member set mphone=? where mid=?";
   static final String email_update="update member set memail=? where mid=?";
   static final String selectOne_mid="select member.*from member join product on member.mid = product.pmid where mid=?";

   public boolean insert(MemVO vo){
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(insert);
	         pstmt.setString(1, vo.getMid());
	         pstmt.setString(2, vo.getMnick());
	         pstmt.setString(3, vo.getMpw());
	         pstmt.setString(4, vo.getMname());
	         pstmt.setString(5, vo.getMphone());
	         pstmt.setString(6, vo.getAddr());
	         pstmt.setString(7, vo.getAddrapt());
	         pstmt.setString(8, vo.getMemail());
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         return false;
	      }
	      JDBCUtil.disconnect(pstmt, conn);
	      return true;
	   }
   
   public boolean delete(MemVO vo){
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(delete);
	         pstmt.setString(1, vo.getMid());
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         return false;
	      }
	      JDBCUtil.disconnect(pstmt, conn);
	      return true;
	   }
   
   public boolean update(MemVO vo){
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(update);
	         pstmt.setString(1, vo.getMname());         
	         pstmt.setString(2, vo.getMpw());
	         pstmt.setString(3, vo.getAddr());
	         pstmt.setString(4, vo.getAddrapt());
	         pstmt.setString(5, vo.getMid());
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         return false;
	      }
	      JDBCUtil.disconnect(pstmt, conn);
	      return true;
	   }
   
   public MemVO selectOne(MemVO vo){
	      MemVO data=null;
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(selectOne);
	         pstmt.setString(1, vo.getMid());
	         ResultSet rs=pstmt.executeQuery();
	         while(rs.next()) {
	            data=new MemVO();
	            data.setMid(rs.getString("mid"));
	            data.setMnick(rs.getString("mnick"));
	            data.setMpw(rs.getString("mpw"));
	            data.setMname(rs.getString("mname"));
	            data.setMphone(rs.getString("mphone"));
	            data.setAddr(rs.getString("addr"));
	            data.setAddrapt(rs.getString("addrapt"));
	            data.setMemail(rs.getString("memail"));
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      JDBCUtil.disconnect(pstmt, conn);   
	      return data;
	   }
   
   public MemVO selectmnick(MemVO vo){
	      MemVO data=null;
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(selectnick);
	         pstmt.setString(1, vo.getMnick());
	         ResultSet rs=pstmt.executeQuery();
	         while(rs.next()) {
	            data=new MemVO();
	            data.setMid(rs.getString("mid"));
	            data.setMnick(rs.getString("mnick"));
	            data.setMpw(rs.getString("mpw"));
	            data.setMname(rs.getString("mname"));
	            data.setMphone(rs.getString("mphone"));
	            data.setAddr(rs.getString("addr"));
	            data.setAddrapt(rs.getString("addrapt"));
	            data.setMemail(rs.getString("memail"));
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      JDBCUtil.disconnect(pstmt, conn);   
	      return data;
	   }
	   
   public boolean phone_update(MemVO vo){
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(phone_update);
	         pstmt.setString(1, vo.getMphone());         
	         pstmt.setString(2, vo.getMid());
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         return false;
	      }
	      JDBCUtil.disconnect(pstmt, conn);
	      return true;
	   }
   
	   public boolean email_update(MemVO vo){
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(email_update);
	         pstmt.setString(1, vo.getMemail());         
	         pstmt.setString(2, vo.getMid());
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         return false;
	      }
	      JDBCUtil.disconnect(pstmt, conn);
	      return true;
	   }
	   

   
   public MemVO selectOne_mid(MemVO vo){
	   MemVO data = null;
	   conn=JDBCUtil.connect();
	   try {
		pstmt=conn.prepareStatement(selectOne_mid);
		pstmt.setString(1, vo.getMid());
		   ResultSet rs = pstmt.executeQuery();
		   while(rs.next()) {
			   	data = new MemVO();
	            data.setMid(rs.getString("mid"));
	            data.setMnick(rs.getString("mnick"));
	            data.setMpw(rs.getString("mpw"));
	            data.setMname(rs.getString("mname"));
	            data.setMphone(rs.getString("mphone"));
	            data.setAddr(rs.getString("addr"));
	            data.setAddrapt(rs.getString("addrapt"));
	            data.setMemail(rs.getString("memail"));
		   	}
		  } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    JDBCUtil.disconnect(pstmt, conn);
    return data; 
	   }
   
   
   

  
  
  
  

   
}