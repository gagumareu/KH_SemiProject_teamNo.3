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

public class ProductsDAO {
	
	Connection con = null;			
	PreparedStatement pstmt = null;	
	ResultSet rs = null;			
	
	String sql = null;				
	
	
	private ProductsDAO() {	}
	
	private static ProductsDAO instance;
	
	public static ProductsDAO getInstance() {
		if(instance==null) {
			instance = new ProductsDAO();			
		}
		return instance;
	
	}//getInstance() end
	
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
	
	
//****************************** 동아님********************************	
	
	//제품 전체 리스트 cap_products 테이블에서 가져오는 메서드
		public List<ProductsDTO> getProductList(){
			
			List<ProductsDTO> list = new ArrayList<ProductsDTO>();
					
			try {
				openConn();
				
				sql = "select * from apc_products order by pcategory_fk";
				
				pstmt = con.prepareStatement(sql);
				
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
			
		}//getProductList() end
	
	// 제품 등록 폼 페이지에 입력된 정보가 DB에 저장되도록 하는 메서드
	public int prodcutsInsert(ProductsDTO dto) {
		int result=0, count=0;
		
		
		try {
			openConn();
			
			sql="select max(pno) from apc_products";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1)+1;
			}
			
			
			sql = "insert into apc_products values(?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getPname());
			pstmt.setString(3, dto.getPcategory_fk());
			pstmt.setString(4, dto.getPimage());
			pstmt.setInt(5, dto.getPqty());
			pstmt.setInt(6, dto.getPrice());			
			pstmt.setString(7, dto.getPsize());
			pstmt.setString(8, dto.getPcolor());			
			pstmt.setString(9, dto.getPcontents());
			pstmt.setInt(10, dto.getMileage());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}//prodcutsInsert() end
	
	
	//해당번호에 해당하는 상세내역 가져오기
	public ProductsDTO getProductCont(int no) {
		
		ProductsDTO dto = new ProductsDTO();
		
		
		try {
			openConn();
			
			sql = "select * from apc_products where pno=?";
			
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
				dto.setPsize(rs.getString("psize"));
				dto.setPcolor(rs.getString("pcolor"));
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
		
	}//getProductCont() end
	
	//수정된 정보를 db에 넘겨주는 메서드
	public int prodcutsUpdate(ProductsDTO dto) {
		
		int result=0;
		try {
			openConn();
			
			sql="update apc_products set "
					+ " pname=?, pcategory_fk=?, pimage=?, pqty=?, price=?, psize=?, pcolor=?, pcontents=?,mileage=? where pno=?";
			
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setString(1, dto.getPname());
			pstmt.setString(2, dto.getPcategory_fk());
			pstmt.setString(3, dto.getPimage());
			pstmt.setInt(4, dto.getPqty());
			pstmt.setInt(5, dto.getPrice());
			pstmt.setString(6, dto.getPsize());
			pstmt.setString(7, dto.getPcolor());
			pstmt.setString(8, dto.getPcontents());
			pstmt.setInt(9, dto.getMileage());
			pstmt.setInt(10, dto.getPno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}//prodcutsUpdate() end
	
	
	//apc_products테이블에서 넘어온 번호에 해당하는 상품 삭제하는 메서드
	public int productDelete(int no) {
		int result=0;
		
		openConn();
		
		sql ="delete form apc_products where pno=?";
		
		try {
			openConn();
			
			sql ="delete from apc_products where pno=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
			
			sql="update apc_products set pno = pno-1 where pno>?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;		
	}//productDelete() end
	
	
	//products 테이블에서 현재 페이지에 해당하는 게시물을 조회하는 메서드
	public List<ProductsDTO> getBoardList(int page, int rowsize){
		
		List<ProductsDTO> list  = new ArrayList<ProductsDTO>();
		
		int startNo = (page*rowsize) - (rowsize -1);
		
		int endNo = (page*rowsize);
		
		
		try {
			openConn();
			
			sql = "select * from (select row_number() over(order by pcategory_fk) rnum, b.* from apc_products b)"
					+ "where rnum>=? and rnum<=? ";
			
			pstmt= con.prepareStatement(sql);
			
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);			
			
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
	}//getBoardList()end

	
	//products 테이블의 전체 게시물의 수를 확인하는 방법
	public int getBoardCount() {
		int count = 0;
		
		
		try {
			openConn();
			
			sql = "select count(*) from apc_products";
			
			pstmt =  con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count =  rs.getInt(1);
				System.out.println("count>>"+ count);
				
			}
					
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return count;		
		
	}//getBoardCount() end
	
	
	//검색한 키워드가 포함된 결과의 수(db수)
	public int searchListCount(String field, String keyword) {
		int count=0;
		
		openConn();
		
		if(field.equals("code")) {
			
			
			try {
				sql = "select count(*) from apc_products where pcategory_fk like ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1,"%"+keyword+"%");
				
				rs= pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}				
		}else if(field.equals("name")) {
			try {
				sql = "select count(*) from apc_products where pname like ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+keyword+"%");
				
				rs= pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
		}
		return count;
	}//searchListCount() end
	
	//검색한 자료를 db에서 가져오는 메서드
	
	public List<ProductsDTO> searchBoardList(String field, String keyword, int page, int rowsize){
		
		List<ProductsDTO> list = new ArrayList<ProductsDTO>();
		
		int startNo=(page * rowsize) - (rowsize-1);
		int endNo =(page * rowsize);
		
		openConn();
		
		if(field.equals("code")) {
			
			
			try {
				sql = "select * from (select row_number() over(order by pcategory_fk) rnum, "
						+ "b.* from apc_products b where pcategory_fk like ?)"
						+ "where rnum>=? and rnum<=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+keyword+"%");
				
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, endNo);
				
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
		}else if(field.equals("name")) {

			
			try {
				sql = "select * from (select row_number() over(order by pcategory_fk) rnum, "
						+ "b.* from apc_products b where pname like ?)"
						+ "where rnum>=? and rnum<=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+keyword+"%");
				
				pstmt.setInt(2, startNo);
				
				pstmt.setInt(3, endNo);
				
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
		}
		return list;
			
	}//searchBoardList() end



// ******************  정환  ******************************

	public List<ProductsDTO> getShopProductList(String code){
	
		List<ProductsDTO> list = new ArrayList<ProductsDTO>();
	
		try {
			
			openConn();
			
			//sql = "select distinct pname from apc_products where pcategory_fk = ?";
			
			sql = "select * from apc_products where pno in (select min(pno) from apc_products group by pname)"
					+ " and pcategory_fk = ? order by pno";
	
			
			//sql = "select * from apc_products where pcategory_fk = ? order by pinputdate desc";
			
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

	
	// shop 상단 서치 창에서 이름 검색시 중복 제거 후 모든 제품 나열
	public List<ProductsDTO> productSearch(String keyword){
		
		List<ProductsDTO> list = new ArrayList<ProductsDTO>();
		
		try {
			
			openConn();
			
			//sql ="select * from apc_products where pno in (select min(pno) from apc_products where upper(pname) like upper(?) "
			//		+ " and lower(pname) like lower(?) order by pcategory_fk)";
			
			//sql ="select * from apc_products where pno in (select min(pno) "
			//		+ " from apc_products where uppder(pname) like upper(?))";
			
			sql ="select * from apc_products where pno in (select min(pno) from apc_products where upper(pname) like upper(?))";  
					
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+keyword+"%");
			//pstmt.setString(2, "%"+keyword+"%");
			
			
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


	// 상세페이지에서 컬러 조회
	public List<ProductsDTO> getColor(String name){
		
		List<ProductsDTO> list = new ArrayList<ProductsDTO>();
		
		
		try {
			
			openConn();
			
			sql ="select distinct pcolor from apc_products where pname = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductsDTO dto = new ProductsDTO();
	
				dto.setPcolor(rs.getString("pcolor"));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
		
		
	} // getColor() end 
	
	

	// 상세페이지에서 사이즈 조회
	public List<ProductsDTO> getSize(String name){
		
		
		List<ProductsDTO> list = new ArrayList<ProductsDTO>();
		
		
		try {
			openConn();
			
			//sql = "select distinct psize from apc_products where pname = ? order by psize";
			
			sql = "select distinct psize, pqty from apc_products where pname = ? order by psize";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductsDTO dto = new ProductsDTO();
				
				dto.setPsize(rs.getString("psize"));
				dto.setPqty(rs.getInt("pqty"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;

	} //getSize() end

	
	// 상세페이지에서 컬러 선택
	public ProductsDTO colorChoose(String color, String name) {
		
		ProductsDTO dto = new ProductsDTO();
		
		int count = 0;
	
		try {
			
			openConn();
			
			sql ="select min(pno) from apc_products where pcolor = ? and pname = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, color);
			pstmt.setString(2, name);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt(1);
				
			}
			
			System.out.println(count);
			
			sql ="select * from apc_products where pno = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				dto.setPno(rs.getInt("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				dto.setPimage(rs.getString("pimage"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setPsize(rs.getString("psize"));
				dto.setPcolor(rs.getNString("pcolor"));
				dto.setPcontents(rs.getString("pcontents"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setPinputdate(rs.getString("pinputdate"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
		
	} //colorChoose() end

	
	
	//**********************  이슬님  ***********************
	
	//코드에 해당하는 제품리스트를 조회하는 메서드 
	public List<ProductDTO> getProductList(String code) {
	
	List<ProductDTO> list = new ArrayList<ProductDTO>();
	
	try {
		openConn();
		
		sql="select * from apc_products where pno in (select min(pno) from apc_products group by pname) "
				+ " and pcategory_fk like ? order by pno desc";
		
		
//				sql="select * from apc_products where pcategory_fk like ? "
//						+ " order by pno desc " ;
		
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, code+"%");
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			ProductDTO dto = new ProductDTO();
			
			dto.setPno(rs.getInt("pno"));
			dto.setPname(rs.getString("pname"));
			dto.setPcategory_fk(rs.getString("pcategory_fk"));
			dto.setPimage(rs.getString("pimage"));
			dto.setPqty(rs.getInt("pqty"));
			dto.setPrice(rs.getInt("price"));
			dto.setPsize(rs.getString("psize"));
			dto.setPcolor(rs.getString("pcolor"));
//					dto.setPicon(rs.getString("picon"));
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
	}//getProductList() end
		
		
		
		
		
		
		
		
		





} // 제일 끝 