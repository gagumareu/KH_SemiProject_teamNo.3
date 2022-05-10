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
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	private static CartDAO instance = null;
	
	private CartDAO() { }
	
	public static CartDAO getInstance() {
		
		if(instance == null) {
			
			instance = new CartDAO();
			
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

	//DB에 데이터 저장하는 메서드 
	public int cartInsert(CartDTO dto) {
		int result = 0, count=0;
		try {
			openConn();

			sql="select max(cart_no) from apc_cart";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt(1)+1;
			}

			sql="insert into apc_cart values(?,?,?,?,?,?,?,?,default,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setInt(2, dto.getPno_fk());
			pstmt.setString(3, dto.getCart_memid());
			pstmt.setString(4, dto.getCart_pname());
			pstmt.setInt(5, dto.getCart_pqty());
			pstmt.setString(6, dto.getCart_psize());
			pstmt.setString(7, dto.getCart_pcolor());
			pstmt.setInt(8, dto.getCart_price());
			pstmt.setString(9, dto.getCart_pimage());
			pstmt.setInt(10, dto.getCart_mileage());

			result=pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	//특정 1개의 장바구니 정보를 불러오는 메서드 
	//1개인데 뷰페이지에서 list로 통일해서 받기때문에 list로 받음 
	public List<CartDTO> getCartContent(String id, int pno) {
		
		List<CartDTO> list = new ArrayList<CartDTO>();
		
		
		try {
			openConn();
			
			//id, 제품번호, 그리고 가장 최근에 생성된 카트번호에 해당하는 정보를 받기
			sql="select * from apc_cart where cart_memid=? and pno_fk = ? and "
					+ " cart_no = (select max(cart_no) from apc_cart where cart_memid= ? and pno_fk= ? ) ";
					
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pno);
			pstmt.setString(3, id);
			pstmt.setInt(4, pno);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				CartDTO dto = new CartDTO();
				
				dto.setCart_no(rs.getInt("cart_no"));
				dto.setPno_fk(rs.getInt("pno_fk"));
				dto.setCart_memid(rs.getString("cart_memid"));
				dto.setCart_pname(rs.getString("cart_pname"));
				dto.setCart_pqty(rs.getInt("cart_pqty"));
				dto.setCart_psize(rs.getString("cart_psize"));
				dto.setCart_pcolor(rs.getString("cart_pcolor"));
				dto.setCart_trans(rs.getInt("cart_trans"));
				dto.setCart_price(rs.getInt("cart_price"));
				dto.setCart_pimage(rs.getString("cart_pimage"));
				dto.setCart_pimage(rs.getString("cart_mileage"));
				
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}

	//로그인된 아이디에 해당하는 카트전체리스트를 조회하는 메서드 
	public List<CartDTO> getCartList(String loginId) {
		
		List<CartDTO> list = new ArrayList<CartDTO>();
		
		try {
			openConn();
			
			sql="select * from apc_cart where cart_memid = ? order by cart_no desc";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, loginId);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				CartDTO dto = new CartDTO();
				
				dto.setCart_no(rs.getInt("cart_no"));
				dto.setPno_fk(rs.getInt("pno_fk"));
				dto.setCart_memid(rs.getString("cart_memid"));
				dto.setCart_pname(rs.getString("cart_pname"));
				dto.setCart_pqty(rs.getInt("cart_pqty"));
				dto.setCart_psize(rs.getString("cart_psize"));
				dto.setCart_pcolor(rs.getString("cart_pcolor"));
				dto.setCart_trans(rs.getInt("cart_trans"));
				dto.setCart_price(rs.getInt("cart_price"));
				dto.setCart_pimage(rs.getString("cart_pimage"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}//getCartList() end 






	
	
	
}