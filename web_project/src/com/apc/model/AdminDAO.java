package com.apc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	
	Connection con = null;			
	PreparedStatement pstmt = null;	
	ResultSet rs = null;			
	
	String sql = null;	
	
	private AdminDAO() {	} //생성자
	
	private static AdminDAO instance;
	
	public static AdminDAO getinstance() {
		if(instance == null) {
			instance = new AdminDAO();
			
		}
		return instance;
		
		
	}//getinstance() end;
	
	// DB를 연동하는 작업을 진행하는 메서드
		public void openConn() {
			
			try {
				// 1단계 : JNDI 서버 객체 생성
				Context ctx = new InitialContext();
				
				// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
				DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
				
				// 3단계 : DataSource 객체를 이용하여 커넥션 객체를 하나 가져온다.
				con = ds.getConnection();
				
				if(con !=null) {
					System.out.println("데이터베이스 연결 성공!~");
				}else {
					System.out.println("실패!");
				}
							
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}  // openConn() 메서드 end
		
		//db에 연결된 자원을 종료하는 메서드
			public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
				
					try {
						if(rs != null) {
							rs.close();
						}
						
						if(pstmt !=null) {
							pstmt.close();
						}
						
						if(con !=null) {
							con.close();
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
				
			}//closeConn() end
			
			//세션으로 넘겨줄 아이디와 비밀번로를 가져오는 메서드
			public AdminDTO getAdmin(String id) {
				AdminDTO dto = new AdminDTO();
				
				
				
				try {
					openConn();
					
					sql = "select * from apc_admin where admin_id=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						dto.setAdmin_id(rs.getString("admin_id"));
						dto.setAdmin_pwd(rs.getString("admin_pwd"));
						dto.setAdmin_name(rs.getString("admin_name"));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return dto;
				
				
				
			}//getAdmin() end
			
			
			//관리자 아이디와 비밀번호가 맞는지 확인하는 메서드
			public int check_id_pwd(String id, String pwd) {
				
				int result = 0;
				
				
				try {
					openConn();
					
					sql = "select * from apc_admin where admin_id=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						if(rs.getString("admin_pwd").equals(pwd)) {
							result = 1;	//비밀번로 맞는 경우.
						}else {
							result = -1;	//비밀번호 틀린 경우.
						}
						
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return result;
			}//check_id_pwd() end
	
	
	
	

}
