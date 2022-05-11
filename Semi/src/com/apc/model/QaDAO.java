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

public class QaDAO {

	Connection con = null;             // DB 연결하는 객체.
	PreparedStatement pstmt = null;    // DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;               // SQL문을 실행 후 결과 값을 가지고 있는 객체.
	
	String sql = null;                 // SQL문을 저장할 객체.
	
	
	// QaDAO 객체를 싱글톤 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	//        기본 생성자의 접근 제어자를 private 으로 선언해야 함.
	// 2단계 : QaDAO 객체를 정적 멤버로 선언해야 함. - static으로 선언해야 함.
	private static QaDAO instance = null;
	
	
	private QaDAO() {   }  // 기본생성자.
		
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는
	//        메서드를 만들어서 여기에 접근하게 해야 함.
	public static QaDAO getInstance() {
		
		if(instance == null) {
			instance = new QaDAO();
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
	
	
	public List<QaDTO> getQaList(String id){
		
		List<QaDTO> list = new ArrayList<QaDTO>();
		
		try {
			openConn();
			sql = "select * from apc_qa where qa_memid = ? "
					+ "order by qa_no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QaDTO dto = new QaDTO();
				dto.setQa_no(rs.getInt("qa_no"));
				dto.setQa_title(rs.getString("qa_title"));
				dto.setQa_cont(rs.getString("qa_cont"));
				dto.setQa_date(rs.getString("qa_date"));
				dto.setQa_update(rs.getString("qa_update"));
				dto.setQa_indent(rs.getInt("qa_indent"));
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
	
	
	public int deleteQa(int no) {
		
		int result = 0;
		
		try {
			openConn();
			sql = "delete from apc_qa where qa_no = ?";
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
	
	
	public int cancelQa(QaDTO dto) {
		
		int result = 0;
		int count = 0;
		
		try {
			openConn();
			sql = "select max(qa_no) from apc_qa";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into apc_qa values(?, ?, ?, ?, ?, ?, 1111, default, sysdate, '', '', '', '', ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getQa_category());
			pstmt.setString(3, dto.getQa_memid());
			pstmt.setString(4, dto.getQa_title());
			pstmt.setString(5, dto.getQa_cont());
			pstmt.setInt(6, dto.getQa_pno_fk());
			pstmt.setInt(7, dto.getQa_orderno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	
	public List<QaDTO> viewCancelQa(String id){
		
		List<QaDTO> list = new ArrayList<QaDTO>();
		
		try {
			openConn();
			sql = "select * from apc_qa where qa_memid = ? and (qa_category = 'CR' or qa_category = 'SB') "
					+ "order by qa_no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QaDTO dto = new QaDTO();
				dto.setQa_no(rs.getInt("qa_no"));
				dto.setQa_title(rs.getString("qa_title"));
				dto.setQa_cont(rs.getString("qa_cont"));
				dto.setQa_pno_fk(rs.getInt("qa_pno_fk"));
				dto.setQa_date(rs.getString("qa_date"));
				dto.setQa_update(rs.getString("qa_update"));
				dto.setQa_indent(rs.getInt("qa_indent"));
				dto.setQa_orderno(rs.getInt("qa_orderno"));
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
