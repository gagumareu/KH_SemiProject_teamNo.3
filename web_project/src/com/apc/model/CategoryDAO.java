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
	
	Connection con = null;			//DB 연결하는 객체
	PreparedStatement pstmt = null;	//DB 에 SQL문을 전송하는 객체
	ResultSet rs = null;			//SQL문을 실행 후 결과 값을 가지고 있는 객체
	
	String sql = null;				//SQL문을 저장할 객체
	
	
	//1. 생성자를 private로 만들어준다
	private CategoryDAO() {	}
	
	//2. 객
	private static CategoryDAO instance;
	
	public static CategoryDAO getInstance() {
		
		if(instance == null) {
			instance = new CategoryDAO();
	
		}return instance;
		
		
	}//getInstance() 메서드 end
	
	//DB연동을 진행하는 메서드
	public void openConn() {
		
		
		try {
			Context ctx = new InitialContext();
			
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			con = ds.getConnection();
			
			if(con != null) {
				System.out.println("데이터 베이스 연결 성공");
			}else {
				System.out.println("데이터 베이스 연결 실패");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}//openConn() 메서드 end
	
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
		
		
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
	}//closeConn() end
	
	
//********************* 동아님 *****************//
	
	//카테고리 리스트를 출력하는 메서드
	
	public List<CategoryDTO> getCategoryList(){
		
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
		
	} //getCategoryList() end
	
	// 카테고리 번호에 해당하는 자료리스트 가져오기
	public List<CategoryDTO> getCategoryList(int no){

		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		
		
		try {
			openConn();
			
			sql = "select * from apc_category where category_no=? order by category_code";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
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
		
	}
	
	//apc_category 테이블에 새로운 카테고리를 추가해주는 메서드
	public int insertCategory(CategoryDTO dto) {
		int result =0;
		
		
		try {
			openConn();
			
			sql = "insert into apc_category values(?,?,?,?)";
			
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
		
		
	}//insertCategory() end
	
	//카테고리 상세내역을 불러오는 메서드
	public CategoryDTO categoryContent(String code) {
		
		CategoryDTO dto = new CategoryDTO();
		
		
		try {
			openConn();
			
			sql = "select * from apc_category where category_code=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, code);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setCategory_no(rs.getInt("category_no"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				dto.setCategory_image(rs.getString("category_image"));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
		
	}// categoryContent() end
	
	
	//카테고리를 수정하는 메서드
	public int CategoryUpdate(CategoryDTO dto) {
		int result =0;
		
		
		try {
			openConn();
			
			
				
			sql = "update apc_category set category_no=?, category_code=?, category_name=?, category_image=? where category_code=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getCategory_no());
			pstmt.setString(2, dto.getCategory_code());
			pstmt.setString(3, dto.getCategory_name());
			pstmt.setString(4, dto.getCategory_image());
			pstmt.setString(5, dto.getCategory_code());
			
			
			result = pstmt.executeUpdate();
				
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
		
	}//CategoryUpdate() end
	
	
	//카테고리 삭제
	public int categoryDelete(String code) {
		
		int result =0;
		
		
		try {
			openConn();
			
			sql = "delete from apc_category where category_code=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, code);
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
		
	}//categoryDelete() end
	
	
	
//************************* 정환 ***************************
	
	
	public List<CategoryDTO> getShopCategory(){
		
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
		
	} //getShopCategory() end 
	
	
	
	
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


//	public List<CategoryDTO> getCategory(){
//	
//	List<CategoryDTO> list = new ArrayList<CategoryDTO>();
//
//	try {
//		openConn();
//		
//		sql = "select * from apc_category where category_code like ? "
//				+ " order by category_code";
//		
//		pstmt = con.prepareStatement(sql);
//		
//		pstmt.setString(1, "__000000");
//	
//		rs = pstmt.executeQuery();
//		
//		while(rs.next()) {
//			
//			CategoryDTO dto = new CategoryDTO();
//			
//			dto.setCategory_no(rs.getInt("category_no"));
//			dto.setCategory_code(rs.getString("category_code"));
//			dto.setCategory_name(rs.getString("category_name"));
//			dto.setCategory_image(rs.getString("category_image"));
//				
//				list.add(dto);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			closeConn(rs, pstmt, con);
//		}
//		
//		return list;
//		
//		
//	} // getCategory() end
//
//
//	public List<CategoryDTO> get2ndCategory(String code){
//		
//		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
//		
//		
//		try {
//			
//			openConn();
//			
//			sql = "select * from apc_category where category_code like ? "
//					+ " and category_code like ? and category_code not like ?"
//					+ " order by category_code desc";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setNString(1, code+"%");
//			pstmt.setString(2, "__000000");
//			pstmt.setString(3, "_0000000");
//			
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				
//				CategoryDTO dto = new CategoryDTO();
//				
//				dto.setCategory_no(rs.getInt("category_no"));
//				dto.setCategory_code(rs.getString("category_code"));
//				dto.setCategory_name(rs.getString("category_name"));
//				dto.setCategory_image(rs.getString("category_image"));
//				list.add(dto);
//				
//
//			}
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			closeConn(rs, pstmt, con);
//		}
//		return list;
//		
//	} // get2ndCategory() end 
//	
//	
//	
//	public List<CategoryDTO> get3rdCategory(String code){
//		// 넘어온 코드 >> 남,녀 카테고리일 경우 1 and 2
//		//          >> 골프일 경우 3w0.., 3m0.., 3a0..
//		
//		
//		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
//		
//		if(code.length() > 1) {  // 골프 3w0.., 3m0.., 3a0..인 경우
//			
//			try {
//				
//				openConn();
//				
//				sql ="select * from apc_category where category_code like ? "
//						+ " and category_code not like ? and category_code not like ? ";
//				
//				pstmt = con.prepareStatement(sql);
//				
//				// 골프 카테고리 목록 불러오기 (상품 목록이 아닌 품목은 제외시키기)
//				pstmt.setString(1, code.substring(0, 2)+"%"); 
//				pstmt.setString(2, "_0000000");
//				pstmt.setString(3, "__000000");
//				
//				rs = pstmt.executeQuery();
//				
//				while(rs.next()) {
//					
//					CategoryDTO dto = new CategoryDTO();
//					
//					dto.setCategory_no(rs.getInt("category_no"));
//					dto.setCategory_code(rs.getString("category_code"));
//					dto.setCategory_name(rs.getString("category_name"));
//					dto.setCategory_image(rs.getString("category_image"));
//					list.add(dto);
//
//				}
//				
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}finally {
//				closeConn(rs, pstmt, con);
//			}
//			
//
//		}else if(code.length() == 1) {  // code 가 한자린 경우 (남/녀) 2nd category 없는 품목인 경우
//			
//			
//			try {
//				openConn();
//				
//				sql ="select * from apc_category where category_code like ?"
//						+ " and category_code not like ?";
//				
//				pstmt = con.prepareStatement(sql);
//				
//				pstmt.setString(1, code+"%");
//				pstmt.setString(2, "_0000000");
//				
//				rs = pstmt.executeQuery();
//				
//				while(rs.next()) {
//					
//					CategoryDTO dto = new CategoryDTO();
//					
//					dto.setCategory_no(rs.getInt("category_no"));
//					dto.setCategory_code(rs.getString("category_code"));
//					dto.setCategory_name(rs.getString("category_name"));
//					dto.setCategory_image(rs.getString("category_image"));
//					list.add(dto);					
//				}
//				
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}finally {
//				closeConn(rs, pstmt, con);
//			}
//	
//		}
//		
//		return list;
//		
//	} // get3rdCategory() end
	
	
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
	
	
	
	
	
	
	// 상단 카테고리 navBar 
	public CategoryDTO getCategoryTitle(String code){
		
		CategoryDTO dto = new CategoryDTO();
		
		
		try {
			
			openConn();
			
			sql ="select category_name, category_code from apc_category where category_code like ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, code.substring(0, 1)+"%");
			
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
		
		
	} //getCategoryTitle() end 
		
		
	// 상단 리스트 navBar
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
		
		
	} //getListTitle() end
	

// *************** 이슬님 ******************
	
	
	public CategoryDTO getCategoryCont(String code) {
		
		CategoryDTO dto = new CategoryDTO();
		
		try {
			openConn();
			
			sql="select * from apc_category where category_code = ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, code);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setCategory_no(rs.getInt("category_no"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				dto.setCategory_image(rs.getString("category_image"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
		
	}


	
	//코드의 상위 카테고리 정보를 가져오는 메서드
	public CategoryDTO getUpperCategory(String fullcode) {
		
		CategoryDTO dto = new CategoryDTO();
		try {
			openConn();
			
			sql="select * from apc_category where category_code like ?"
					+ " and category_code like ? ";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, fullcode.substring(0,2)+"%");
			pstmt.setNString(2, "__000000");
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setCategory_no(rs.getInt("category_no"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				dto.setCategory_image(rs.getString("category_image"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	}//getUpperCategory() end 
		
		
		

	

} // 끝
