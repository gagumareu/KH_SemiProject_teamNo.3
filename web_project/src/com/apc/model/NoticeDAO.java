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

public class NoticeDAO {

	Connection con = null;				// DB 연결하는 객체.
	PreparedStatement pstmt = null;		// DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;				// SQL문을 실행 후 결과 값을 가지고 있는 객체.
	
	String sql = null;					// SQL문을 저장할 객체.
	
	
	// BoardDAO 객체를 싱글턴 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	//       기본 생성자의 접근 제어자를 public에서 private으로 바꿔 주어야 한다.
	
	// 2단계 : NoticeDAO 객체를 정적 멤버로 선언해 주어야 한다. - static으로 선언해야 함.
	private static NoticeDAO instance;
	
	private NoticeDAO() {  }   // 기본 생성자
	
	
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는 메서드를
	// 만들어서 이 getInstance() 메서드에 외부에서 접근할 수 있게 해야 함.
	public static NoticeDAO getInstance() {
		
		if(instance == null) {
			instance = new NoticeDAO();
		}
		
		return instance;
		
	}  // getInstance() 메서드 end
	
	
	// DB를 연동하는 작업을 진행하는 메서드 - DBCP 방식으로 데이터베이스와 연결 진행.
	public void openConn() {
		
		try {
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();
			
			// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			// 3단계 : DataSource 객체를 이용하여 커넥션 객체를 하나 가져온다.
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}  // openConn() 메서드 end
	
	
	// DB에 연결된 자원을 종료하는 메서드.
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

				e.printStackTrace();
			}
		
	}	// closeConn() 메서드 end
	
	
	// 공지사항 전체 목록을 가져오는 메서드
	public List<NoticeDTO> getNoticeList(int page, int rowsize) {

		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		
		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);
				
		// 해당 페이지에서 끝 번호
		int endNo = (page * rowsize);
		
		try {
			openConn();
			
			sql = "select * from "
					+ " (select row_number() "
					+ " over(order by notice_no desc) rnum, "
					+ " b.* from apc_notice b) "
					+ " where rnum >= ? and rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				
				dto.setNotice_no(rs.getInt("notice_no"));
				dto.setNotice_writer(rs.getString("notice_writer"));
				dto.setNotice_title(rs.getString("notice_title"));
				dto.setNotice_cont(rs.getString("notice_cont"));
				dto.setNotice_image(rs.getString("notice_image"));
				dto.setNotice_pwd(rs.getString("notice_pwd"));
				dto.setNotice_hit(rs.getInt("notice_hit"));
				dto.setNotice_date(rs.getString("notice_date"));
				dto.setNotice_update(rs.getNString("notice_update"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
		
	}	// getNoticeList() 메서드 end
	
	
	
	// 공지사항 등록
	public int insertNotice(NoticeDTO dto) {
	
		int result = 0, count = 0;
				
		try {
			openConn();
			
			sql = "select max(notice_no) from apc_notice";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1 ;
			}
			
			sql = "insert into apc_notice "
					+ "values(?, ?, ?, ?, ?, ?, default, sysdate, '')";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getNotice_writer());
			pstmt.setString(3, dto.getNotice_title());
			pstmt.setString(4, dto.getNotice_cont());
			pstmt.setString(5, dto.getNotice_image());
			pstmt.setString(6, dto.getNotice_pwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
		
	}	// insertNotice() 메서드 end
	
	
	
	// 공지사항 조회수 증가
	public void noticeHit(int no) {
			
		try {
			openConn();
			
			sql = "update apc_notice "
					+ "set notice_hit = notice_hit + 1 "
					+ "where notice_no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			closeConn(rs, pstmt, con);
		}
		
	}	// noticeHit() 메서드 end

	
	
	// 공지사항 상세내역 
	public NoticeDTO noticeContent(int no, int type) {
		
		NoticeDTO dto = new NoticeDTO();
				
		try {
			openConn();
			
			sql = "select * from apc_notice where notice_no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setNotice_no(rs.getInt("notice_no"));
				dto.setNotice_writer(rs.getString("notice_writer"));
				dto.setNotice_title(rs.getString("notice_title"));
				
				if(type == 1) {
					dto.setNotice_cont(rs.getString("notice_cont"));
				}else {
					dto.setNotice_cont(rs.getString("notice_cont").replace("<br>", "\n"));
				}
				
				dto.setNotice_image(rs.getString("notice_image"));
				dto.setNotice_pwd(rs.getString("notice_pwd"));
				dto.setNotice_hit(rs.getInt("notice_hit"));
				dto.setNotice_date(rs.getString("notice_date"));
				dto.setNotice_update(rs.getNString("notice_update"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
		
	}	// noticeContent() 메서드 end
	
	
	// 공지사항 수정
	public int updateNotice(NoticeDTO dto) {
		
		int result = 0;
				
		try {
			openConn();
			
			sql = "select * from apc_notice where notice_no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getNotice_no());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(dto.getNotice_pwd().equals(rs.getString("notice_pwd"))) {
					if(dto.getNotice_image() == null) {
						
						sql = "update apc_notice set notice_title = ?, "
								+ "notice_cont = ?, "
								+ "notice_update = sysdate "
								+ "where notice_no = ?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, dto.getNotice_title());
						pstmt.setString(2, dto.getNotice_cont());
						pstmt.setInt(3, dto.getNotice_no());
						
					}else {
						
						sql = "update apc_notice set notice_title = ?, "
								+ "notice_cont = ?, notice_image = ?, "
								+ "notice_update = sysdate "
								+ "where notice_no = ?";
								
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, dto.getNotice_title());
						pstmt.setString(2, dto.getNotice_cont());
						pstmt.setString(3, dto.getNotice_image());
						pstmt.setInt(4, dto.getNotice_no());
						
					}
					
					result = pstmt.executeUpdate();
					
				}else {		// 비밀번호가 틀린 경우
					
					result = -1;
					
				}
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
		
	}	// updateNotice() 메서드 end
	
	
	// 공지사항 삭제
	public int deleteNotice(int no) {
		
		int result = 0;
				
		try {
			openConn();
			
			sql = "delete from apc_notice where notice_no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
			
			sql = "update apc_notice set "
					+ "notice_no = notice_no - 1 "
					+ "where notice_no > ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
		
	}	// deleteNotice() 메서드 end
	
	
	// 공지사항 전체 게시글 수를 확인하는 메서드 
	public int getNoticeCount() {
		
		int count = 0; 

		try {
			
			openConn();

			sql = "select count(*) from apc_notice";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return count;
		
	}	// getNoticeCount() end 
	
	
	// 검색한 내용에 해당하는 게시글 전체 수
	public int getSearchCount(String search_field, String search_word) {
		
		int count = 0; 
		
		if(search_field.equals("title")) {

			try {
				openConn();
	
				sql = "select count(*) from apc_notice where notice_title like ? ";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+search_word+"%");
	
				rs = pstmt.executeQuery();
	
				if(rs.next()) {
					count = rs.getInt(1);
				}
	
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
		}else if(search_field.equals("content")) {
			
			try {
				openConn();

				sql = "select count(*) from apc_notice where notice_cont like ? ";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+search_word+"%");

				rs = pstmt.executeQuery();

				if(rs.next()) {
					count = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
		}else if(search_field.equals("title_content")) {
			try {
				openConn();

				sql = "select count(*) from apc_notice where notice_title like ? "
						+ " or notice_cont like ? ";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+search_word+"%");
				pstmt.setString(2, "%"+search_word+"%");

				rs = pstmt.executeQuery();

				if(rs.next()) {
					count = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}

		return count;
		
	}	// getSearchCount() end 

	
	//검색한 내용에 해당하는 QA리스트 조회하는 메서드
	public List<NoticeDTO> getSearchList(String search_field, String search_word, int page, int rowsize) {
		
		List<NoticeDTO> list = new ArrayList<NoticeDTO>();

		//해당페이지에서 시작 번호 
		int startNo = (page*rowsize) - (rowsize-1);

		//해당페이지 마지막 번호
		int endNo = (page*rowsize);
		
		if(search_field.equals("title")) {

			try {
					openConn();
					
					sql=" select * from "
							+ " (select row_number() over (order by notice_no desc) rnum, "
							+ " b.* from apc_notice b  where notice_title like ? ) "
							+ " where rnum >= ? and rnum <= ? " ;
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+search_word+"%");
					pstmt.setInt(2, startNo);
					pstmt.setInt(3, endNo);
					
					rs = pstmt.executeQuery();
	
					while(rs.next()) {
						
						NoticeDTO dto = new NoticeDTO();
						
						dto.setNotice_no(rs.getInt("notice_no"));
						dto.setNotice_writer(rs.getString("notice_writer"));
						dto.setNotice_title(rs.getString("notice_title"));
						dto.setNotice_cont(rs.getString("notice_cont"));
						dto.setNotice_image(rs.getString("notice_image"));
						dto.setNotice_pwd(rs.getString("notice_pwd"));
						dto.setNotice_hit(rs.getInt("notice_hit"));
						dto.setNotice_date(rs.getString("notice_date"));
						dto.setNotice_update(rs.getNString("notice_update"));
						
						list.add(dto);
					}


				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
			
			}else if(search_field.equals("content")) {
				
				try {
					openConn();
					
					sql="select * from "
							+ " (select row_number() over (order by notice_no desc) rnum, "
							+ " b.* from apc_notice b  where notice_cont like ? ) "
							+ " where rnum >= ? and rnum <= ? " ;
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+search_word+"%");
					pstmt.setInt(2, startNo);
					pstmt.setInt(3, endNo);
					
					rs = pstmt.executeQuery();

					while(rs.next()) {
						
						NoticeDTO dto = new NoticeDTO();
						
						dto.setNotice_no(rs.getInt("notice_no"));
						dto.setNotice_writer(rs.getString("notice_writer"));
						dto.setNotice_title(rs.getString("notice_title"));
						dto.setNotice_cont(rs.getString("notice_cont"));
						dto.setNotice_image(rs.getString("notice_image"));
						dto.setNotice_pwd(rs.getString("notice_pwd"));
						dto.setNotice_hit(rs.getInt("notice_hit"));
						dto.setNotice_date(rs.getString("notice_date"));
						dto.setNotice_update(rs.getNString("notice_update"));
						
						list.add(dto);
					}


				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				
			}else if(search_field.equals("title_content")) {
				
				try {
					openConn();
					
					sql="select * from "
							+ " (select row_number() over (order by notice_no desc) rnum, "
							+ " b.* from apc_notice b  "
							+ " where notice_title like ? or notice_cont like ? ) "
							+ " where rnum >= ? and rnum <= ? " ;
					
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, "%"+search_word+"%");
					pstmt.setString(2, "%"+search_word+"%");
					pstmt.setInt(3, startNo);
					pstmt.setInt(4, endNo);
					
					rs = pstmt.executeQuery();

					while(rs.next()) {

						NoticeDTO dto = new NoticeDTO();
						
						dto.setNotice_no(rs.getInt("notice_no"));
						dto.setNotice_writer(rs.getString("notice_writer"));
						dto.setNotice_title(rs.getString("notice_title"));
						dto.setNotice_cont(rs.getString("notice_cont"));
						dto.setNotice_image(rs.getString("notice_image"));
						dto.setNotice_pwd(rs.getString("notice_pwd"));
						dto.setNotice_hit(rs.getInt("notice_hit"));
						dto.setNotice_date(rs.getString("notice_date"));
						dto.setNotice_update(rs.getNString("notice_update"));
						
						list.add(dto);
					}

					rs.close();pstmt.close();con.close();

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
			}

		return list;
		
	}	//getSearchList() end
	
	
	// admin_main에서 공지사항 가져오기
	public List<NoticeDTO> getNoticeList() {

		List<NoticeDTO> list = new ArrayList<NoticeDTO>();

		try {
			openConn();
			
			sql = "select * from apc_notice where notice_no < 7 order by notice_no";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				
				dto.setNotice_no(rs.getInt("notice_no"));
				dto.setNotice_writer(rs.getString("notice_writer"));
				dto.setNotice_title(rs.getString("notice_title"));
				dto.setNotice_cont(rs.getString("notice_cont"));
				dto.setNotice_image(rs.getString("notice_image"));
				dto.setNotice_pwd(rs.getString("notice_pwd"));
				dto.setNotice_hit(rs.getInt("notice_hit"));
				dto.setNotice_date(rs.getString("notice_date"));
				dto.setNotice_update(rs.getNString("notice_update"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
		
	}	// getNoticeList() 메서드 end
}
