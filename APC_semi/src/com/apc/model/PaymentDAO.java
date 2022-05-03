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


public class PaymentDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	private static PaymentDAO instance = null;
	
	private PaymentDAO() { }
	
	public static PaymentDAO getInstance() {
		
		if(instance == null) {
			
			instance = new PaymentDAO();
			
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

	//회원 별 구매리스트 불러오는 메서드
	public List<PaymentDTO> getPayList(String id){
		
		List<PaymentDTO> list = new ArrayList<PaymentDTO>();
		
		try {
			openConn();
			
			sql="select * from apc_payment where order_id = ? ";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				PaymentDTO dto = new PaymentDTO();
				
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setCartno_fk(rs.getInt("cartno_fk"));
				dto.setOrder_id(rs.getString("order_id"));
				dto.setPno_fk(rs.getInt("pno_fk"));
				dto.setPname(rs.getString("pname"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setTranscost(rs.getInt("transcost"));
				dto.setPaytype(rs.getInt("paytype"));
				dto.setOrderdate(rs.getString("orderdate"));
				dto.setOrdername(rs.getString("ordername"));
				dto.setOrderaddr(rs.getString("orderaddr"));
				dto.setOrderphone(rs.getString("orderphone"));
				
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
