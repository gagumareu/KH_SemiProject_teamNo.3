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

	Connection con = null;				// DB 연결하는 객체.
	PreparedStatement pstmt = null;		// DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;				// SQL문을 실행 후 결과 값을 가지고 있는 객체.
	
	String sql = null;					// SQL문을 저장할 객체.
	
	
	// BoardDAO 객체를 싱글턴 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	//       기본 생성자의 접근 제어자를 public에서 private으로 바꿔 주어야 한다.
	
	// 2단계 : QaDAO 객체를 정적 멤버로 선언해 주어야 한다. - static으로 선언해야 함.
	private static QaDAO instance;
	
	private QaDAO() {  }   // 기본 생성자
	
	
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는 메서드를
	// 만들어서 이 getInstance() 메서드에 외부에서 접근할 수 있게 해야 함.
	public static QaDAO getInstance() {
		
		if(instance == null) {
			instance = new QaDAO();
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
					+ " (select row_number()"
					+ " over(order by qa_group desc, qa_step) rnum, "
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
			
			sql = "delete from apc_qa where qa_no = ? ";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return result ;
		
	}	//qaDelete() end

	
	//apc_qa 삭제이벤트가 일어날 경우 qa_no조정해주는 메서드
	public void adjustQaNo(int num) {
		
		try {
			openConn();
			
			sql = "update apc_qa set qa_no = qa_no - 1 where qa_no > ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			closeConn(rs, pstmt, con);
		}
		
	}	//adjustQaNo() end
	
	
	//apc_qa 삭제이벤트가 일어날 경우 qa_indent를 조정해주는 메서드
	public void adjustQaIndent(int num, int group) {
		
		try {
			openConn();
			
			sql = "update apc_qa set "
					+ "qa_step = qa_step - 1, qa_indent = qa_indent - 1 "
					+ "where qa_no > ? and qa_group = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, group);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			closeConn(rs, pstmt, con);
		}
		
	}	//adjustQaNo() end
	
	
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
		int count = 0; 

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
			}
		}

		return count;
		
	}	//getSearchCount() end 

	
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
						+ " (select row_number() over (order by qa_group desc, qa_step) rnum, "
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
			}
			}else if(search_field.equals("content")) {
				try {
					openConn();
					
					sql="select * from "
							+ " (select row_number() over (order by qa_group desc, qa_step) rnum, "
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
				}
			}else if(search_field.equals("title_content")) {
				
				try {
					openConn();
					
					sql="select * from "
							+ " (select row_number() over (order by qa_group desc, qa_step) rnum, "
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
				}
			}

		return list;
	}//getSearchList() end

	
	// QNA 답변 글 step 증가
	public void replyUpdate(int group, int step) {
				
		try {
			openConn();
			
			sql = "update apc_qa set "
					+ "qa_step = qa_step + 1 "
					+ "where qa_group = ? and qa_step > ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group);
			pstmt.setInt(2, step);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			closeConn(rs, pstmt, con);
		}
		
	}	// replyUpdate() 메서드 end
	
	
	// QNA 문의사항에 답변글 추가
	public int replyQa(QaDTO dto) {
		
		int result = 0, count = 0, step = 0;
				
		try {
			openConn();
			
			sql = "select max(qa_no) from apc_qa";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			
			sql = "select max(qa_step) from apc_qa where qa_group = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getQa_group());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				step = rs.getInt(1) + 1;
			}
			
			if(dto.getQa_pno_fk()>0) {
				sql = "insert into apc_qa "
						+ "values(?, ?, '관리자', ?, ?, ?, '', default, sysdate, '', ?, ?, ?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, count);
				pstmt.setString(2, dto.getQa_category());
				pstmt.setString(3, dto.getQa_title());
				pstmt.setString(4, dto.getQa_cont());
				pstmt.setInt(5, dto.getQa_pno_fk());
				pstmt.setInt(6, dto.getQa_group());
				pstmt.setInt(7, step);
				pstmt.setInt(8, step);
			}else {
				sql = "insert into apc_qa "
						+ "values(?, ?, '관리자', ?, ?, '', '', default, sysdate, '', ?, ?, ?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, count);
				pstmt.setString(2, dto.getQa_category());
				pstmt.setString(3, dto.getQa_title());
				pstmt.setString(4, dto.getQa_cont());
				pstmt.setInt(5, dto.getQa_group());
				pstmt.setInt(6, step);
				pstmt.setInt(7, step);
			}
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
		
	}	// replyQa() 메서드 end
	
	
	
	// ********************* 이슬님 ************************
	
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
				dto.setQa_orderno(rs.getInt("qa_orderno"));
				
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		
		return list;
		
	}//getQaList() end
	
	
// *********************** 경영님 ************************
	
	public List<QaDTO> getContactQaList(String id){
		
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
				dto.setQa_group(rs.getInt("qa_group"));
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
	} // getContactQaList() end
	
	
	
	
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
         System.out.println("dto.getQa_pno_fk():"+dto.getQa_pno_fk());
         
         if(dto.getQa_pno_fk()>0) {
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
         } else {
            sql="insert into apc_qa values(?,?,?,?,?,'',?, default, sysdate, '', ?, 0, 0)";
            pstmt=con.prepareStatement(sql);
            
            pstmt.setInt(1, count);
            pstmt.setString(2, dto.getQa_category());
            pstmt.setString(3, dto.getQa_memid());
            pstmt.setString(4, dto.getQa_title());
            pstmt.setString(5, dto.getQa_cont());
            pstmt.setString(6, dto.getQa_pwd());
            pstmt.setInt(7, count);
            
            result=pstmt.executeUpdate();
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         closeConn(rs, pstmt, con);
      }
      
      return result;
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
               + " (select row_number() over ( order by qa_group desc, qa_indent) rnum, "
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
	
// ************** 경연님 ************************
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
	
	
	// admin_main 에서 Q&A 조회
	public List<QaDTO> getMainQaList() {
		
		List<QaDTO> list = new ArrayList<QaDTO>();
					
		try {
			openConn();
			
			sql = "select * from apc_qa where rownum<= 6 and qa_step=0 order by qa_no";
							
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
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
	
	
	
	
	
}
