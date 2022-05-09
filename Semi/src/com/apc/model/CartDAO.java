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

public class CartDAO {

	Connection con = null;             // DB 연결하는 객체.
	PreparedStatement pstmt = null;    // DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;               // SQL문을 실행 후 결과 값을 가지고 있는 객체.
	
	String sql = null;                 // SQL문을 저장할 객체.
	
	
	// CartDAO 객체를 싱글톤 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	//        기본 생성자의 접근 제어자를 private 으로 선언해야 함.
	// 2단계 : CartDAO 객체를 정적 멤버로 선언해야 함. - static으로 선언해야 함.
	private static CartDAO instance = null;
	
	
	private CartDAO() {   }  // 기본생성자.
		
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는
	//        메서드를 만들어서 여기에 접근하게 해야 함.
	public static CartDAO getInstance() {
		
		if(instance == null) {
			instance = new CartDAO();
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
	
	
	public List<CartDTO> getCartList(String id){
		
		List<CartDTO> list = new ArrayList<CartDTO>();
		
		try {
			openConn();
			sql = "select * from apc_cart where cart_memid=?";
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
				dto.setCart_pimage(rs.getString("cart_pimage"));
				dto.setCart_mileage(rs.getInt("cart_mileage"));

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
	
	
	public CartDTO getCartContent(int num){
		
		CartDTO dto = new CartDTO();
		
		try {
			openConn();
			sql = "select * from apc_cart where cart_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setCart_no(rs.getInt("cart_no"));
				dto.setPno_fk(rs.getInt("pno_fk"));
				dto.setCart_memid(rs.getString("cart_memid"));
				dto.setCart_pname(rs.getString("cart_pname"));
				dto.setCart_pqty(rs.getInt("cart_pqty"));
				dto.setCart_psize(rs.getString("cart_psize"));
				dto.setCart_pcolor(rs.getString("cart_pcolor"));
				dto.setCart_price(rs.getInt("cart_price"));
				dto.setCart_trans(rs.getInt("cart_trans"));
				dto.setCart_pimage(rs.getString("cart_pimage"));
				dto.setCart_mileage(rs.getInt("cart_mileage"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}
	
	
	public int updateCart(CartDTO dto) {
		
		int result = 0;
		
		try {
			openConn();
			
			sql = "select pno, pimage from apc_products where pcolor=? and psize=?";
			pstmt = con.prepareStatement(sql);
			System.out.println(dto.getCart_pcolor());
			System.out.println(dto.getCart_psize());
			pstmt.setString(1, dto.getCart_pcolor());
			pstmt.setString(2, dto.getCart_psize());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int pno = rs.getInt("pno");
				String pimage = rs.getString("pimage");
				System.out.println(pno);
				System.out.println(pimage);
				
				sql = "update apc_cart set pno_fk=?, cart_pcolor=?, cart_psize=?, cart_pimage=? where cart_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pno);
				pstmt.setString(2, dto.getCart_pcolor());
				pstmt.setString(3, dto.getCart_psize());
				pstmt.setNString(4, pimage);
				pstmt.setInt(5, dto.getCart_no());
				result = pstmt.executeUpdate();
				
			}else {
				result = -1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	public int qtyDown(int no) {
		
		int result = 0;
		
		try {
			openConn();
			sql = "update apc_cart set cart_pqty = cart_pqty - 1 where cart_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	
	public int qtyUp(int no) {
		
		int result = 0;
		
		try {
			openConn();
			sql = "update apc_cart set cart_pqty = cart_pqty + 1 where cart_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	
	public int deleteCart(int no) {
		
		int result = 0;
		
		try {
			openConn();
			sql = "delete from apc_cart where cart_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
}
