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

	Connection con = null;             // DB 연결하는 객체.
	PreparedStatement pstmt = null;    // DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;               // SQL문을 실행 후 결과 값을 가지고 있는 객체.
	
	String sql = null;                 // SQL문을 저장할 객체.
	
	
	// ProductDAO 객체를 싱글톤 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	//        기본 생성자의 접근 제어자를 private 으로 선언해야 함.
	// 2단계 : ProductDAO 객체를 정적 멤버로 선언해야 함. - static으로 선언해야 함.
	private static ProductDAO instance = null;
	
	
	private ProductDAO() {   }  // 기본생성자.
		
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는
	//        메서드를 만들어서 여기에 접근하게 해야 함.
	public static ProductDAO getInstance() {
		
		if(instance == null) {
			instance = new ProductDAO();
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
	
	
	public ProductDTO getProductContent(int pno_fk) {
		
		ProductDTO dto = new ProductDTO();
		
		try {
			openConn();
			sql = "select * from apc_products where pno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pno_fk);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setPno(rs.getInt("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				dto.setPimage(rs.getString("pimage"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setPsize(rs.getString("psize"));
				dto.setPcolor(rs.getString("pcolor"));				
				dto.setPcontents(rs.getString("pcontents"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setPinputdate(rs.getString("pinputdate"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}
	
	
	public List<String> getProductColor(String name) {
		
		List<String> list = new ArrayList<String>();
		String color = null;
		
		try {
			openConn();
			sql = "select distinct pcolor from apc_products where pname = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				color = rs.getString("pcolor");
				list.add(color);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	
	
	public List<String> getProductSize(String name) {
		
		List<String> list = new ArrayList<String>();
		String size = null;
		
		try {
			openConn();
			sql = "select distinct psize from apc_products where pname = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				size = rs.getString("psize");
				list.add(size);
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
