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


public class QaCategoryDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	private static QaCategoryDAO instance = null;
	
	private QaCategoryDAO() { }
	
	public static QaCategoryDAO getInstance() {
		
		if(instance == null) {
			
			instance = new QaCategoryDAO();
			
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

	public QaCategoryDTO getCategoryCont(String code) {
		
		QaCategoryDTO dto = new QaCategoryDTO();
		
		try {
			 
			openConn();

			sql="select * from apc_qa_category where category_code like ? "
					+" order by category_code";

			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, code);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
			}		
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		
		return dto;
		
	}

	//카테고리 전체리스트 조회하는 메서드
	public List<QaCategoryDTO> getQaCategoryList() {
		List<QaCategoryDTO> list = new ArrayList<QaCategoryDTO>();
		
		try {
			openConn();
			
			sql="select * from apc_qa_category order by category_name desc";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				QaCategoryDTO dto = new QaCategoryDTO();
			
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}//getQaCategoryList() end 


// ******************* 경연님 *****************
	
	
	public List<QaCategoryDTO> getCategoryList() {
		
		List<QaCategoryDTO> list = new ArrayList<QaCategoryDTO>();
		
		
		try {
			openConn();
			
			sql = "select * from apc_qa_category "
					+ " order by category_code desc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				QaCategoryDTO dto = new QaCategoryDTO();
				
				dto.setCategory_code(rs.getString("category_code"));
				
				dto.setCategory_name(rs.getString("category_name"));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
			
		}
		
		return list;
	} // getCategoryList() end 






	
	
	
}
