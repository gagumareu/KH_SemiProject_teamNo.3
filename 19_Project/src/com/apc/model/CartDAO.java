package com.apc.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

	Connection con = null;             // DB 연결하는 객체.
	PreparedStatement pstmt = null;    // DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;               // SQL문을 실행 후 결과 값을 가지고 있는 객체.
	
	String sql = null;                 // SQL문을 저장할 객체.
	
	// ProductDAO 객체를 싱글턴 방식으로 만들어 보자.
	// 1단계 : 싱글턴 방식으로 객체를 만들기 위해서는 우선적으로
	//		   기본 생성자의 접근 제어자를 public에서 private으로 바꿔 주어야 한다.
	
	// 2단계 : ProductDAO 객체를 정적 멤버로 선언해 주어야 한다. - static으로 선언해야 함.
	private static CartDAO instance;
	
	private CartDAO() { }  // 기본 생성자
		
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는 메서드를
	// 만들어서 이 getInstance() 메서드에 외부에서 접근할 수 있게 해야 함.
	public static CartDAO getInstance() {
		
		if(instance == null) {
			instance = new CartDAO();
		}
		
		return instance;
	}  // getInstance() 메서드 end
		
	
	// DB를 연동하는 작업을 진행하는 메서드
	public void openConn() {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "semi";
		String password = "1234";
		
		// 1단계 : 오라클 드라이버 로딩.
		try {
			// 1단계 : 오라클 드라이버 로딩.
			Class.forName(driver);
			
			// 2단계 : 오라클 데이터베이스와 연결 진행.
			con = DriverManager.getConnection(url, user, password);
			
			if(con != null) {
				System.out.println("데이터베이스 연결 성공");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}  // openConn() 메서드 end
	

	// DB에 연결된 자원을 종료하는 메서드
	public void closeConn(ResultSet rs, PreparedStatement pstmt,
						Connection con) {
	
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
	
	
public List<CartDTO> orderCartInfo(String id) {
		
		List<CartDTO> list = new ArrayList<CartDTO>();
		
		try {
			openConn();
			
			sql = "select * from apc_cart where cart_memid = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CartDTO dto = new CartDTO();
				
				dto.setCart_no(rs.getInt("cart_no"));
				dto.setPno_fk(rs.getInt("pno_fk"));
				dto.setCart_memid(rs.getString("cart_memid"));
				dto.setCart_pname(rs.getString("cart_pname"));
				dto.setCart_pqty(rs.getInt("cart_pqty"));
				dto.setCart_psize(rs.getString("cart_psize"));
				dto.setCart_pcolor(rs.getString("cart_pcolor"));
				dto.setCart_price(rs.getInt("cart_price"));
				dto.setCart_trans(rs.getInt("cart_trans"));
				dto.setCart_mileage((int)(rs.getInt("cart_price") * 0.05));
				dto.setCart_pimage(rs.getString("cart_pimage"));
				
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
