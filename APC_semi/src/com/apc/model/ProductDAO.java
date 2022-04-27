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


public class ProductDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	private static ProductDAO instance = null;
	
	private ProductDAO() { }
	
	public static ProductDAO getInstance() {
		
		if(instance == null) {
			
			instance = new ProductDAO();
			
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

	//DB에 제품 데이터 저장하는 메서드
	public int productUpload(ProductDTO dto) {
		
	int result =0, count=0;
		
		try {
			openConn();
			
			sql="select max(pno) from apc_products";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1)+1;
			}
			
			sql="insert into apc_products values(?,?,?,?,?,?,?,?,?,?, ?, sysdate)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getPname());
			pstmt.setString(3, dto.getPcategory_fk());
			pstmt.setString(4, dto.getPimage());
			pstmt.setInt(5, dto.getPqty());
			pstmt.setInt(6, dto.getPrice());
			pstmt.setString(7, dto.getPsize());
			pstmt.setString(8, dto.getPcolor());
			pstmt.setString(9, dto.getPicon());
			pstmt.setString(10, dto.getPcontents());
			pstmt.setInt(11, dto.getMileage());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}









	
	
	
}
