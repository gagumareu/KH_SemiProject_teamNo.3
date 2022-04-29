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

import com.apc.model.ProductsDAO;

public class ProductsDAO {

	
	Connection con = null;             // DB 연결하는 객체.
	PreparedStatement pstmt = null;    // DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;               // SQL문을 실행 후 결과 값을 가지고 있는 객체.
	
	String sql = null;                 // SQL문을 저장할 객체.
	
	
	// ApcProductDAO 객체를 싱글톤 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	//        기본 생성자의 접근 제어자를 private 으로 선언해야 함.
	// 2단계 : ApcProductDAO 객체를 정적 멤버로 선언해야 함. - static으로 선언해야 함.
	private static ProductsDAO instance = null;
	
	
	private ProductsDAO() {   }  // 기본생성자.
		
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는
	//        메서드를 만들어서 여기에 접근하게 해야 함.
	public static ProductsDAO getInstance() {
		
		if(instance == null) {
			instance = new ProductsDAO();
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
	
	
	
	public List<ProductsDTO> getProductList(String code){
		
		List<ProductsDTO> list = new ArrayList<ProductsDTO>();
		
		try {
			
			openConn();
			

			sql = "select * from apc_products where pcategory_fk = ? order by pinputdate desc";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, code);
		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductsDTO dto = new ProductsDTO();
				
				dto.setPno(rs.getInt("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				dto.setPimage(rs.getString("pimage"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setPsize(rs.getString("psize"));
				dto.setPcolor(rs.getString("pcolor"));
				dto.setPicon(rs.getString("picon"));
				dto.setPcontents(rs.getString("pcontents"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setPinputdate(rs.getString("pinputdate"));
				
				list.add(dto);
			}
			
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	} // apcProductWomenList() end
	
	

	public int insertProduct(ProductsDTO dto) {
		
		int result = 0, count =0;
		
		
		try {
			openConn();
			
			sql = "select max(pno) from apc_products";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt(1) +1;
			}
			
			sql ="insert into apc_products values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, sysdate)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getPname());
			pstmt.setString(3, dto.getPcategory_fk());
			pstmt.setString(4, dto.getPimage());
			pstmt.setInt(5, dto.getPqty());
			pstmt.setInt(6, dto.getPrice());
			pstmt.setString(7, dto.getPsize());
			pstmt.setString(8, dto.getPcolor());
			pstmt.setNString(9, dto.getPicon());
			pstmt.setString(10, dto.getPcontents());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
			
		}
		return result;
		
		
		
	} // insertProduct() end 
	
	
	
	public ProductsDTO getProductDetail(int no) {
		
		ProductsDTO dto = new ProductsDTO();
		
		
		try {
			openConn();
			
			sql = "select * from apc_products where pno = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
						
				dto.setPno(rs.getInt("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				dto.setPimage(rs.getString("pimage"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setPcolor(rs.getString("pcolor"));
				dto.setPicon(rs.getString("picon"));
				dto.setPcontents(rs.getString("pcontents"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setPinputdate(rs.getString("pinputdate"));			
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			closeConn(rs, pstmt, con);
		}
		
		return dto;
		
		
	} //getProductDetail() end
	
	
	
	public List<ProductsDTO> productSearch(String keyword){
		
		List<ProductsDTO> list = new ArrayList<ProductsDTO>();
		
		try {
			
			openConn();
			
			sql ="select * from apc_products where upper(pname) like upper(?) "
					+ " and lower(pname) like lower(?) order by pcategory_fk";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductsDTO dto = new ProductsDTO();
				
				dto.setPno(rs.getInt("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				dto.setPimage(rs.getString("pimage"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setPsize(rs.getString("psize"));
				dto.setPcolor(rs.getNString("pcolor"));
				dto.setPicon(rs.getString("picon"));
				dto.setPcontents(rs.getString("pcontents"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setPinputdate(rs.getString("pinputdate"));
				
				list.add(dto);
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			closeConn(rs, pstmt, con);
		}
		
		return list;
		
	} // productSearch() end
	
	
	
	
	public List<ProductsDTO> getSizeAndColor(String name){
		
		List<ProductsDTO> list = new ArrayList<ProductsDTO>();
		
		openConn();
		
		sql ="select * from apc_products where pname = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductsDTO dto = new ProductsDTO();
				
				dto.setPno(rs.getInt("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				dto.setPimage(rs.getString("pimage"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setPsize(rs.getString("psize"));
				dto.setPcolor(rs.getNString("pcolor"));
				dto.setPicon(rs.getString("picon"));
				dto.setPcontents(rs.getString("pcontents"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setPinputdate(rs.getString("pinputdate"));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
		
		
	} // getProductSize() end 
	
	
	
	
	
	
	
}
