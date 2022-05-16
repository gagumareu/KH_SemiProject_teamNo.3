package com.apc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ReviewDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	private static ReviewDAO instance = null;
	
	private ReviewDAO() { }
	
	public static ReviewDAO getInstance() {
		
		if(instance == null) {
			
			instance = new ReviewDAO();
			
		}
		return instance;
	}//getInstance() end
	
	//DB연동하는 작업을 하는 메서드 -- DBCP방식으로 데이터베이스와 연결 진행
	public void openConn() {
		
		
		try {
			//1단계: JNDI서버 객체 생성
			Context ctx = new InitialContext();
			
			//2단계: lookup() 메서드 이요해 매칭되는 커넥션 찾기
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle"); //context.xml에 적은 jdbc/myoracle 을 적기
			
			//3단계: DataSource객체를 이용해 커넥션 객체를 하나 가져오기
			con = ds.getConnection(); //getConnection()은 Connection반환타입
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//openConn() end 

	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
		
		
			try {
				if( rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(con != null) {
					con.close();
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}//closeConn() end 

	//리뷰 데이터 DB에 저장하는 메서드
	public int reviewInsert(ReviewDTO dto) {
		
		int result =0, count =0 ;
		
		try {
			openConn();
			
			sql="select max(review_no) from apc_review";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				count= rs.getInt(1)+1;
			}
			
			sql="insert into apc_review values(?,?,?,?,?,?,?,?,?,?,sysdate, ?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setInt(2, dto.getPno_fk());
			pstmt.setString(3, dto.getPname());
			pstmt.setString(4, dto.getPsize());
			pstmt.setString(5, dto.getPcolor());
			pstmt.setString(6, dto.getMemid_fk());
			pstmt.setInt(7, dto.getReview_rate());
			pstmt.setString(8, dto.getReview_cont());
			pstmt.setString(9, dto.getReview_image());
			pstmt.setString(10, dto.getReview_pwd());
			pstmt.setInt(11, dto.getOrderno_fk());
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return result ;
	}

	//제품번호를 받아 제품명에 해당하는 모든 리뷰 리스트를 조회하는 메서드(사이즈별로 번호가다양하니 제품명으로 통합)
	public List<ReviewDTO> getReviewList(String name) {
		
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		
		try {
			openConn();
		
			sql = "select review_no, pno_fk, r.pname, r.pcolor, r.psize, memid_fk, review_rate, review_cont, review_image, review_pwd, review_date, r.orderno_fk " 
				+ " from apc_review  r join apc_products p " 
				+ " on r.pno_fk = p.pno " 
				+ " where r.pname = ? order by review_date";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setReview_no(rs.getInt("review_no"));
				dto.setPno_fk(rs.getInt("pno_fk"));
				dto.setPname(rs.getString("pname"));
				dto.setPsize(rs.getString("psize"));
				dto.setPcolor(rs.getString("pcolor"));
				dto.setMemid_fk(rs.getString("memid_fk"));
				dto.setReview_rate(rs.getInt("review_rate"));
				dto.setReview_cont(rs.getString("review_cont"));
				dto.setReview_image(rs.getString("review_image"));
				dto.setReview_pwd(rs.getString("review_pwd"));
				dto.setReview_date(rs.getString("review_date"));
				dto.setOrderno_fk(rs.getInt("orderno_fk"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}

	public List<ReviewDTO> getRateList(String id) {

		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		
		try {
			openConn();
		
			sql = "select * from apc_review where memid_fk = ?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setMemid_fk(rs.getString("memid_fk"));
				dto.setReview_rate(rs.getInt("review_rate"));
				dto.setOrderno_fk(rs.getInt("orderno_fk"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}




	
	
	
}
