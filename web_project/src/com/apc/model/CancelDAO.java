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

public class CancelDAO {

	Connection con = null;             // DB 연결하는 객체.
	PreparedStatement pstmt = null;    // DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;               // SQL문을 실행 후 결과 값을 가지고 있는 객체.
	
	String sql = null;                 // SQL문을 저장할 객체.
	
	
	// CancelDAO 객체를 싱글톤 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	//        기본 생성자의 접근 제어자를 private 으로 선언해야 함.
	// 2단계 : CancelDAO 객체를 정적 멤버로 선언해야 함. - static으로 선언해야 함.
	private static CancelDAO instance = null;
	
	
	private CancelDAO() {   }  // 기본생성자.
		
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는
	//        메서드를 만들어서 여기에 접근하게 해야 함.
	public static CancelDAO getInstance() {
		
		if(instance == null) {
			instance = new CancelDAO();
		}
		return instance;
		
	}  // getInstance() 메서드 end
	
	
	// DB를 연동하는 작업을 진행하는 메서드
	public void openConn() {
		
		try {
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();
			
			// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
			DataSource ds =
					(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			// 3단계 : DataSource 객체를 이용하여 커넥션 객체를 하나 가져온다.
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}  // openConn() 메서드 end
	
	
	// DB에 연결된 자원을 종료하는 메서드
	public void closeConn(ResultSet rs,
			PreparedStatement pstmt, Connection con) {
		
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(con != null) {
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}  // closeConn() 메서드 end
	
	
	public int insertCancel(CancelDTO dto) {
		
		int result = 0, count = 0;
		
		try {
			openConn();
			sql = "select max(cancel_no) from apc_cancel";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into apc_cancel values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, default)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setInt(2, dto.getOrderno_fk());
			pstmt.setInt(3, dto.getPno_fk());
			pstmt.setString(4, dto.getMemid_fk());
			pstmt.setString(5, dto.getPname());
			pstmt.setString(6, dto.getPcolor());
			pstmt.setString(7, dto.getPsize());
			pstmt.setInt(8, dto.getPqty());
			pstmt.setString(9, dto.getCancel_category());
			pstmt.setString(10, dto.getCancel_cont());
			pstmt.setString(11, dto.getCancel_image());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}	
		return result;
	}
	
	
	public List<CancelDTO> getCancelList(String id){
		
		List<CancelDTO> list = new ArrayList<CancelDTO>();
		
		try {
			openConn();
			sql = "select * from apc_cancel where memid_fk = ? order by cancel_date";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CancelDTO dto = new CancelDTO();
				
				dto.setCancel_no(rs.getInt("cancel_no"));
				dto.setOrderno_fk(rs.getInt("orderno_fk"));
				dto.setPno_fk(rs.getInt("pno_fk"));
				dto.setMemid_fk(rs.getString("memid_fk"));
				dto.setPname(rs.getString("pname"));
				dto.setPcolor(rs.getString("pcolor"));
				dto.setPsize(rs.getString("psize"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setCancel_category(rs.getString("cancel_category"));
				dto.setCancel_cont(rs.getString("cancel_cont"));
				dto.setCancel_image(rs.getString("cancel_image"));
				dto.setCancel_date(rs.getString("cancel_date"));
				dto.setCancel_state(rs.getInt("cancel_state"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
}
