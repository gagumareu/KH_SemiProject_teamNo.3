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


public class CategoryDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	private static CategoryDAO instance = null;
	
	private CategoryDAO() { }
	
	public static CategoryDAO getInstance() {
		
		if(instance == null) {
			
			instance = new CategoryDAO();
			
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

	//카테고리 대분류(Women,Men, Golf등등) 불러오는 메서드
	public List<CategoryDTO> getCategory() {
		
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		
		try {
			openConn();
			
			sql="select * from apc_category where category_code like ? "
					+" order by category_code";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "_0000000");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CategoryDTO dto = new CategoryDTO();
				
				dto.setCategory_no(rs.getInt("category_no"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				dto.setCategory_image(rs.getString("category_image"));
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}//getCategory() end 
	
	//2nd category 가져오기 (main->카테고리 눌렀을때 나오는 카테고리들) 
	public List<CategoryDTO> get2ndCategory(String code) {
		
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		
		try {
			openConn();
			
			sql="select * from apc_category where category_code like ? "
					+ " and category_code like ? and category_code not like ? "
					+ " order by category_code desc ";
					
					
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, code+"%");
			pstmt.setString(2, "__000000");
			pstmt.setString(3, "_0000000");
			
			rs = pstmt.executeQuery();

			while(rs.next()) {

				CategoryDTO dto = new CategoryDTO();

				dto.setCategory_no(rs.getInt("category_no"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				dto.setCategory_image(rs.getString("category_image"));
				list.add(dto);
				
				
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}//get2ndcateogry() end
	
	
	//3rd category 가져오기 - 2nd category없이 1st와 3rd category만 가졌을 경우
	public List<CategoryDTO> get3rdCategory(String code) {
	//WOMEN, MEN에만 해당 
		
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		
		
		if(code.length()>1) {//fullcode로 넘어온 경우 
			
			try {
				openConn();
				
				sql="select * from apc_category where category_code like ? "
						+ " and category_code not like ? ";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, code.substring(0, 2)+"%");
				pstmt.setString(2, "__000000");
				
				rs = pstmt.executeQuery();

				while(rs.next()) {

					CategoryDTO dto = new CategoryDTO();

					dto.setCategory_no(rs.getInt("category_no"));
					dto.setCategory_code(rs.getString("category_code"));
					dto.setCategory_name(rs.getString("category_name"));
					dto.setCategory_image(rs.getString("category_image"));
					
					list.add(dto);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
			
		}else if(code.length() == 1) {//code가 한자리수로 넘어온 경우(2nd category가 없을경우)
			
			try {
				openConn();
				
				sql="select * from apc_category where category_code like ? "
						+ " and category_code not like ? ";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, code+"%");
				pstmt.setString(2, "_0000000");
				
				rs = pstmt.executeQuery();

				while(rs.next()) {

					CategoryDTO dto = new CategoryDTO();

					dto.setCategory_no(rs.getInt("category_no"));
					dto.setCategory_code(rs.getString("category_code"));
					dto.setCategory_name(rs.getString("category_name"));
					dto.setCategory_image(rs.getString("category_image"));
					
					list.add(dto);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
		}
		
		return list;
	}//get3rdcategory(String code) end 
	
	
	public List<CategoryDTO> getCategoryCode(){
		
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		
		try {
			openConn();
			
			sql="select*from apc_category where category_code like ? "
					+ "and category_code not like ? and category_code not like ?";


			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "____0000");
			pstmt.setString(2, "_0000000");
			pstmt.setString(3, "__000000");
			
			rs = pstmt.executeQuery();

			while(rs.next()) {

				CategoryDTO dto = new CategoryDTO();

				dto.setCategory_no(rs.getInt("category_no"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				dto.setCategory_image(rs.getString("category_image"));
				
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
