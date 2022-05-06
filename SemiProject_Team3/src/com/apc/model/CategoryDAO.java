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
	
	Connection con = null;             // DB 연결하는 객체.
	PreparedStatement pstmt = null;    // DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;               // SQL문을 실행 후 결과 값을 가지고 있는 객체.
	
	String sql = null;                 // SQL문을 저장할 객체.
	
	
	// ApcCategoryDAO 객체를 싱글톤 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	//        기본 생성자의 접근 제어자를 private 으로 선언해야 함.
	// 2단계 : ApcCategoryDAO 객체를 정적 멤버로 선언해야 함. - static으로 선언해야 함.
	private static CategoryDAO instance = null;
	
	
	private CategoryDAO() {   }  // 기본생성자.
		
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는
	//        메서드를 만들어서 여기에 접근하게 해야 함.
	public static CategoryDAO getInstance() {
		
		if(instance == null) {
			instance = new CategoryDAO();
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
	
	
	
	public List<CategoryDTO> getCategory2(){
		
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
	
		try {
			openConn();
			
			sql = "select * from apc_category order by category_code";
			
			pstmt = con.prepareStatement(sql);
			

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
		
		
	} // getCategory() end


	
	
	public List<CategoryDTO> getCategory(){
		
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
	
		try {
			openConn();
			
			sql = "select * from apc_category where category_code like ? "
					+ " order by category_code";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "__000000");

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
		
		
	} // getCategory() end
	
	

	
	public int inputCategory(CategoryDTO dto) {
		
		int result = 0;
		
		try {
			
			openConn();
			
			sql = "insert into apc_category values(?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getCategory_no());
			pstmt.setString(2, dto.getCategory_code());
			pstmt.setString(3, dto.getCategory_name());
			pstmt.setString(4, dto.getCategory_image());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
			
			
		}
		return result;
		
	} // inputCategory() end 
	
	
	
	public List<CategoryDTO> get2ndCategory(String code){
		
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		
		
		try {
			
			openConn();
			
			sql = "select * from apc_category where category_code like ? "
					+ " and category_code like ? and category_code not like ?"
					+ " order by category_code desc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, code+"%");
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
		
	} // get2ndCategory() end 
	
	
	
	public List<CategoryDTO> get3rdCategory(String code){
		// 넘어온 코드 >> 남,녀 카테고리일 경우 1 and 2
		//          >> 골프일 경우 3w0.., 3m0.., 3a0..
		
		
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		
		if(code.length() > 1) {  // 골프 3w0.., 3m0.., 3a0..인 경우
			
			try {
				
				openConn();
				
				sql ="select * from apc_category where category_code like ? "
						+ " and category_code not like ? and category_code not like ? ";
				
				pstmt = con.prepareStatement(sql);
				
				// 골프 카테고리 목록 불러오기 (상품 목록이 아닌 품목은 제외시키기)
				pstmt.setString(1, code.substring(0, 2)+"%"); 
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
			

		}else if(code.length() == 1) {  // code 가 한자린 경우 (남/녀) 2nd category 없는 품목인 경우
			
			
			try {
				openConn();
				
				sql ="select * from apc_category where category_code like ?"
						+ " and category_code not like ?";
				
				pstmt = con.prepareStatement(sql);
				
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
		
	} // get3rdCategory() end
	
	
	
	public CategoryDTO getCategoryTitle(String code){
		
		CategoryDTO dto = new CategoryDTO();
		
		
		try {
			
			openConn();
			
			sql ="select category_name, category_code from apc_category where category_code like ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, code.substring(0, 2)+"%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setCategory_name(rs.getString("category_name"));
				dto.setCategory_code(rs.getString("category_code"));
			}
				
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
		
		
	} //getTitle() end 
	
	
	
public CategoryDTO getListTitle(String code){
		
		CategoryDTO dto = new CategoryDTO();
		
		
		try {
			
			openConn();
			
			sql ="select category_name from apc_category where category_code like ?";
					//+ " and category_code not like ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, code.substring(0, 4)+"%");
			//pstmt.setString(2, "__000000");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setCategory_name(rs.getString("category_name"));
			}
				
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
		
		
	} //getTitle() end
	
	
	
	

}
