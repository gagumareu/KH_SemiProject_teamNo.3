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


public class QaDAO_origin {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	private static QaDAO_origin instance = null;
	
	private QaDAO_origin() { }
	
	public static QaDAO_origin getInstance() {
		
		if(instance == null) {
			
			instance = new QaDAO_origin();
			
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


	public List<QaDTO> getQaList(){
		
		List<QaDTO> list = new ArrayList<QaDTO>();
		
		try {
			openConn();
			
			sql="select * from apc_qa order by qa_no desc";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				QaDTO dto = new QaDTO();
				
				dto.setQa_no(rs.getInt("qa_no"));
				dto.setQa_category(rs.getString("qa_category"));
				dto.setQa_memid(rs.getString("qa_memid"));
				dto.setQa_title(rs.getString("qa_title"));
				dto.setQa_cont(rs.getString("qa_cont"));
				dto.setQa_pno_fk(rs.getInt("qa_pno_fk"));
				dto.setQa_pwd(rs.getString("qa_pwd"));
				dto.setQa_hit(rs.getInt("qa_hit"));
				dto.setQa_date(rs.getString("qa_date"));
				dto.setQa_update(rs.getString("qa_update"));
				dto.setQa_group(rs.getInt("qa_group"));
				dto.setQa_step(rs.getInt("qa_step"));
				dto.setQa_indent(rs.getInt("qa_indent"));
				
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		
		return list;
		
	}//getQaList() end
	
	
	//apc_qa 전체 리스트 조회 + 페이징 처리
	public List<QaDTO> getQaList(int page, int rowsize) {
			List<QaDTO> list = new ArrayList<QaDTO>();
		
			//해당페이지에서 시작 번호
			int startNo = (page* rowsize) - (rowsize - 1);
					
			//해당페이지에서 끝 번호
			int endNo = (page * rowsize);
			
		try {
			openConn();
			
			sql="select * from "
					+ " (select row_number() over ( order by qa_no desc) rnum, "
					+ " b.* from apc_qa b ) "
					+ " where rnum >= ? and rnum <= ? " ;
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				QaDTO dto = new QaDTO();
				
				dto.setQa_no(rs.getInt("qa_no"));
				dto.setQa_category(rs.getString("qa_category"));
				dto.setQa_memid(rs.getString("qa_memid"));
				dto.setQa_title(rs.getString("qa_title"));
				dto.setQa_cont(rs.getString("qa_cont"));
				dto.setQa_pno_fk(rs.getInt("qa_pno_fk"));
				dto.setQa_pwd(rs.getString("qa_pwd"));
				dto.setQa_hit(rs.getInt("qa_hit"));
				dto.setQa_date(rs.getString("qa_date"));
				dto.setQa_update(rs.getString("qa_update"));
				dto.setQa_group(rs.getInt("qa_group"));
				dto.setQa_step(rs.getInt("qa_step"));
				dto.setQa_indent(rs.getInt("qa_indent"));
				
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}
	
	//코드에 해당하는 게시글 리스트 뽑기
	public List<QaDTO> getQaList(String code, int page, int rowsize) {
		List<QaDTO> list = new ArrayList<QaDTO>();

		//해당페이지에서 시작 번호
		int startNo = (page* rowsize) - (rowsize - 1);

		//해당페이지에서 끝 번호
		int endNo = (page * rowsize);
		
		System.out.println("page:"+page +"/rowsize:"+rowsize);
		
		
		try {
			openConn();

			sql="select * from "
					+ " (select row_number() over ( order by qa_no desc) rnum, "
					+ " b.* from apc_qa b where qa_category = upper( ? ) ) "
					+ " where rnum >= ? and rnum <= ? " ;

			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);

			rs=pstmt.executeQuery();

			while(rs.next()) {

				QaDTO dto = new QaDTO();

				dto.setQa_no(rs.getInt("qa_no"));
				dto.setQa_category(rs.getString("qa_category"));
				dto.setQa_memid(rs.getString("qa_memid"));
				dto.setQa_title(rs.getString("qa_title"));
				dto.setQa_cont(rs.getString("qa_cont"));
				dto.setQa_pno_fk(rs.getInt("qa_pno_fk"));
				dto.setQa_pwd(rs.getString("qa_pwd"));
				dto.setQa_hit(rs.getInt("qa_hit"));
				dto.setQa_date(rs.getString("qa_date"));
				dto.setQa_update(rs.getString("qa_update"));
				dto.setQa_group(rs.getInt("qa_group"));
				dto.setQa_step(rs.getInt("qa_step"));
				dto.setQa_indent(rs.getInt("qa_indent"));

				list.add(dto);
				System.out.println("dto등록");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	}


	//qa게시글 정보를 조회하는 메서드
	public QaDTO getQaContent(int num) {
		
		QaDTO dto = new QaDTO();
		
		try {
			openConn();
			
			sql="select * from apc_qa where qa_no = ? ";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setQa_no(rs.getInt("qa_no"));
				dto.setQa_category(rs.getString("qa_category"));
				dto.setQa_memid(rs.getString("qa_memid"));
				dto.setQa_title(rs.getString("qa_title"));
				dto.setQa_cont(rs.getString("qa_cont"));
				dto.setQa_pno_fk(rs.getInt("qa_pno_fk"));
				dto.setQa_pwd(rs.getString("qa_pwd"));
				dto.setQa_date(rs.getString("qa_date"));
				dto.setQa_update(rs.getString("qa_update"));
				dto.setQa_hit(rs.getInt("qa_hit"));
				dto.setQa_group(rs.getInt("qa_group"));
				dto.setQa_step(rs.getInt("qa_step"));
				dto.setQa_indent(rs.getInt("qa_indent"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	}

	//apc_qa 테이블 데이터를 삭제하는 메서드
	public int qaDelete(int num) {
		int result = 0;
		
		try {
			openConn();
			
			sql="delete from apc_qa where qa_no = ? ";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return result ;
	}//qaDelete() end

	//apc_qa 삭제이벤트가 일어날 경우 qa_no조정해주는 메서드
	public void adjustQaNo(int num) {
		
		try {
			openConn();
			sql="update apc_qa set qa_no = qa_no - 1 where qa_no > ? ";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
	}//adjustQaNo() end

	//게시글 조회수 올려주는 메서드
	public void adjustQaHit(int num) {
		
		try {
			openConn();
			
			sql="update apc_qa set qa_hit = qa_hit + 1 where qa_no = ? ";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
	}// adjustQaHit() end 

	//수정한 게시글내용을 DB에 저장하는 메서드
	public int qaUpdate(QaDTO dto, int num) {
		
		int result =0;
		
		try {
			openConn();
			
			sql="update apc_qa set qa_title = ?, qa_cont = ? where qa_no = ? ";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getQa_title());
			pstmt.setString(2, dto.getQa_cont());
			pstmt.setInt(3, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		
		return result;
	}//qaUpdate() end 

	//게시글 전체 개수를 확인하는 메서드 
	public int getBoardCount() {
		int count =0; 

		try {
			openConn();

			sql ="select count(*) from apc_qa ";
			pstmt=con.prepareStatement(sql);

			rs=pstmt.executeQuery();

			if(rs.next()) {
				count = rs.getInt(1);
			}


			rs.close();pstmt.close();con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
			
		}
		return count;
	}//getBoardCount() end 
	
	//코드에 해당하는 게시글 개수 조회 
	public int getBoardCount(String code) {
		int count =0; 

		try {
			openConn();

			sql ="select count(*) from apc_qa where qa_category = upper( ? ) ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, code);

			rs=pstmt.executeQuery();

			if(rs.next()) {
				count = rs.getInt(1);
			}


			rs.close();pstmt.close();con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
			
		}
		return count;
	}


	//검색한 내용에 해당하는 게시글의 전체 수
	public int getSearchCount(String search_field, String search_word) {
		
		int count =0; 
		
		if(search_field.equals("title")) {

		try {
			openConn();

			sql ="select count(*) from apc_qa where qa_title like ? ";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+search_word+"%");

			rs=pstmt.executeQuery();

			if(rs.next()) {
				count = rs.getInt(1);
			}

			rs.close();pstmt.close();con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		}else if(search_field.equals("content")) {
			try {
				openConn();

				sql ="select count(*) from apc_qa where qa_cont like ? ";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+search_word+"%");

				rs=pstmt.executeQuery();

				if(rs.next()) {
					count = rs.getInt(1);
				}

				rs.close();pstmt.close();con.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(search_field.equals("title_content")) {
			try {
				openConn();

				sql ="select count(*) from apc_qa where qa_title like ? "
						+ " or qa_cont like ? ";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+search_word+"%");
				pstmt.setString(2, "%"+search_word+"%");

				rs=pstmt.executeQuery();

				if(rs.next()) {
					count = rs.getInt(1);
				}

				rs.close();pstmt.close();con.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
		}
		
		
		
		return count;
	}//getSearchCount() end 

	//검색한 내용에 해당하는 QA리스트 조회하는 메서드
	public List<QaDTO> getSearchList(String search_field, String search_word, int page, int rowsize) {
		
		List<QaDTO> list = new ArrayList<QaDTO>();

		//해당페이지에서 시작 번호 
		int startNo = (page*rowsize) - (rowsize-1);

		//해당페이지 마지막 번호
		int endNo = (page*rowsize);
		
		if(search_field.equals("title")) {

			try {
				openConn();
				
				sql=" select * from "
						+ " (select row_number() over ( order by qa_no desc) rnum, "
						+ " b.* from apc_qa b  where qa_title like ? ) "
						+ " where rnum >= ? and rnum <= ? " ;
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+search_word+"%");
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, endNo);
				
				rs=pstmt.executeQuery();

				while(rs.next()) {
					QaDTO dto = new QaDTO();
					
					dto.setQa_no(rs.getInt("qa_no"));
					dto.setQa_category(rs.getString("qa_category"));
					dto.setQa_memid(rs.getString("qa_memid"));
					dto.setQa_title(rs.getString("qa_title"));
					dto.setQa_cont(rs.getString("qa_cont"));
					dto.setQa_pno_fk(rs.getInt("qa_pno_fk"));
					dto.setQa_pwd(rs.getString("qa_pwd"));
					dto.setQa_hit(rs.getInt("qa_hit"));
					dto.setQa_date(rs.getString("qa_date"));
					dto.setQa_update(rs.getString("qa_update"));
					dto.setQa_group(rs.getInt("qa_group"));
					dto.setQa_step(rs.getInt("qa_step"));
					dto.setQa_indent(rs.getInt("qa_indent"));
					
					
					list.add(dto);
				}

				rs.close();pstmt.close();con.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			}else if(search_field.equals("content")) {
				try {
					openConn();
					
					sql="select * from "
							+ " (select row_number() over ( order by qa_no desc) rnum, "
							+ " b.* from apc_qa b  where qa_cont like ? ) "
							+ " where rnum >= ? and rnum <= ? " ;
					
					pstmt=con.prepareStatement(sql);
					
					pstmt.setString(1, "%"+search_word+"%");
					pstmt.setInt(2, startNo);
					pstmt.setInt(3, endNo);
					
					rs=pstmt.executeQuery();

					while(rs.next()) {
						QaDTO dto = new QaDTO();
						
						dto.setQa_no(rs.getInt("qa_no"));
						dto.setQa_category(rs.getString("qa_category"));
						dto.setQa_memid(rs.getString("qa_memid"));
						dto.setQa_title(rs.getString("qa_title"));
						dto.setQa_cont(rs.getString("qa_cont"));
						dto.setQa_pno_fk(rs.getInt("qa_pno_fk"));
						dto.setQa_pwd(rs.getString("qa_pwd"));
						dto.setQa_hit(rs.getInt("qa_hit"));
						dto.setQa_date(rs.getString("qa_date"));
						dto.setQa_update(rs.getString("qa_update"));
						dto.setQa_group(rs.getInt("qa_group"));
						dto.setQa_step(rs.getInt("qa_step"));
						dto.setQa_indent(rs.getInt("qa_indent"));
						
						
						list.add(dto);
					}

					rs.close();pstmt.close();con.close();

				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
			}else if(search_field.equals("title_content")) {
				
				try {
					openConn();
					
					sql="select * from "
							+ " (select row_number() over ( order by qa_no desc) rnum, "
							+ " b.* from apc_qa b  "
							+ " where qa_title like ? or qa_cont like ? ) "
							+ " where rnum >= ? and rnum <= ? " ;
					
					pstmt=con.prepareStatement(sql);
					
					pstmt.setString(1, "%"+search_word+"%");
					pstmt.setString(2, "%"+search_word+"%");
					pstmt.setInt(3, startNo);
					pstmt.setInt(4, endNo);
					
					rs=pstmt.executeQuery();

					while(rs.next()) {
						QaDTO dto = new QaDTO();
						
						dto.setQa_no(rs.getInt("qa_no"));
						dto.setQa_category(rs.getString("qa_category"));
						dto.setQa_memid(rs.getString("qa_memid"));
						dto.setQa_title(rs.getString("qa_title"));
						dto.setQa_cont(rs.getString("qa_cont"));
						dto.setQa_pno_fk(rs.getInt("qa_pno_fk"));
						dto.setQa_pwd(rs.getString("qa_pwd"));
						dto.setQa_hit(rs.getInt("qa_hit"));
						dto.setQa_date(rs.getString("qa_date"));
						dto.setQa_update(rs.getString("qa_update"));
						dto.setQa_group(rs.getInt("qa_group"));
						dto.setQa_step(rs.getInt("qa_step"));
						dto.setQa_indent(rs.getInt("qa_indent"));
						
						
						list.add(dto);
					}

					rs.close();pstmt.close();con.close();

				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
			}

		return list;
	}//getSearchList() end

	//게시글 등록 메서드
	public int qaInsert(QaDTO dto) {
		
		int result =0, count =0;
		
		try {
			openConn();
			
			sql="select max(qa_no) from apc_qa";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt(1)+1;
			}
			
			
			sql="insert into apc_qa values(?,?,?,?,?,?,?, default, sysdate, '', ?, 0, 0)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getQa_category());
			pstmt.setString(3, dto.getQa_memid());
			pstmt.setString(4, dto.getQa_title());
			pstmt.setString(5, dto.getQa_cont());
			pstmt.setInt(6, dto.getQa_pno_fk());
			pstmt.setString(7, dto.getQa_pwd());
			pstmt.setInt(8, count);
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}










	
	
	
}
