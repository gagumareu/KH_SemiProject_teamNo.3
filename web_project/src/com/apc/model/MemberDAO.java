package com.apc.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class MemberDAO {

	Connection con = null;             // DB 연결하는 객체.
	PreparedStatement pstmt = null;    // DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;               // SQL문을 실행 후 결과 값을 가지고 있는 객체.
	
	String sql = null;                 // SQL문을 저장할 객체.
	
	int count=0; 							//비회원아이디에 추가해줄 번호
	
	// ProductDAO 객체를 싱글턴 방식으로 만들어 보자.
	// 1단계 : 싱글턴 방식으로 객체를 만들기 위해서는 우선적으로
	//		   기본 생성자의 접근 제어자를 public에서 private으로 바꿔 주어야 한다.
	
	// 2단계 : ProductDAO 객체를 정적 멤버로 선언해 주어야 한다. - static으로 선언해야 함.
	private static MemberDAO instance;
	
	private MemberDAO() { }  // 기본 생성자
		
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는 메서드를
	// 만들어서 이 getInstance() 메서드에 외부에서 접근할 수 있게 해야 함.
	public static MemberDAO getInstance() {
		
		if(instance == null) {
			instance = new MemberDAO();
		}
		
		return instance;
	}  // getInstance() 메서드 end
		
	
	// DB를 연동하는 작업을 진행하는 메서드
	public void openConn() {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "semi";
		String password = "1234";
		
		// 1단계 : 오라클 드라이버 로딩.
		try {
			// 1단계 : 오라클 드라이버 로딩.
			Class.forName(driver);
			
			// 2단계 : 오라클 데이터베이스와 연결 진행.
			con = DriverManager.getConnection(url, user, password);
			
			if(con != null) {
				System.out.println("데이터베이스 연결 성공");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}  // openConn() 메서드 end
	

	// DB에 연결된 자원을 종료하는 메서드
	public void closeConn(ResultSet rs, PreparedStatement pstmt,
						Connection con) {
	
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
	
	
	public int joinMember(MemberDTO dto) {

		int result = 0;
		
		try {
			openConn();
			
			sql = "insert into apc_member "
					+ " values(?, ?, ?, ?, ?, ?, ?, 0, sysdate)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMem_id());
			pstmt.setString(2, dto.getMem_pwd());
			pstmt.setString(3, dto.getMem_name());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getBirth());
			pstmt.setString(7, dto.getAddr());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	} // joinMember() 메서드 end
	
	
	// 아이디 찾기 메서드
	public String membefFindId(String name, String phone) {
		
		String result ="";
		String dbPhone = "";
		
		try {
			openConn();
			
			sql = "select * from apc_member where mem_name = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dbPhone = rs.getString("phone");
				
				if(phone.equals(dbPhone)) {
					
					result = rs.getString("mem_id");
					
				}else {
					result = "wrong phone";
				}
				
				
			}else {
				result = "wrong name";
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}  //memberFindId() 메서드 end
	

	// 비밀번호 찾기 메서드
	public String memberFindPwd(String id, String email) {
		
		String result = null;
		String dbEmail = null;
		
		try {
			openConn();
			
			sql = "select * from apc_member where mem_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dbEmail = rs.getString("email");
				
				if(email.equals(dbEmail)) {
					
					result = rs.getString("mem_pwd");
					
				}else {
					result = "wrong email";
				}
				
			}else {
				
				result = "wrong id";
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}  // memberFindPwd() 메서드 end
	
	
	// 입력 폼 창에서 넘어온 아이디가 중복인지 여부를 확인하는 메서드
		public String idCheck(String id) {
			
			String result = "사용 가능한 아이디입니다.";

			try {
				openConn();
				
				sql = "select * from apc_member where mem_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {  // true : 중복인 경우
					
					result = "중복된 아이디입니다.";
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
			return result;
		} // idCheck() 메서드 end
	
		
	// DB 확인후 로그인 하는 메서드
	public int memberCheck(String id, String pwd) {
			
			int result = 0;
			
			try {
				openConn();
				
				sql = "select * from apc_member where mem_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					if(pwd.equals(rs.getString("mem_pwd"))) {
						// 회원인 경우
						result = 1;
					}else {
						// 비밀번호가 틀린 경우
						result = -1;
					}
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
			return result;
		}  // userCheck() 메서드 end
		
	
	// id에 해당하는 회원정보 저장 메서드
	public MemberDTO getMemberInfo(String id) {
		
		MemberDTO dto = new MemberDTO();

		try {
			openConn();
			
			sql ="select * from apc_member where mem_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setBirth(rs.getString("birth"));
				dto.setAddr(rs.getString("addr"));
				dto.setMem_mileage(rs.getInt("mem_mileage"));
				dto.setRegdate(rs.getString("regdate"));
				
			}
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	}  // getMember() 메서드 end
	
	
	// 회원 주문 메서드
	public MemberDTO orderMemberInfo(String id) {
		
		MemberDTO dto = new MemberDTO();
		
		try {
			openConn();
			
			sql ="select * from apc_member where mem_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setBirth(rs.getString("birth"));
				dto.setAddr(rs.getString("addr"));
				dto.setMem_mileage(rs.getInt("mem_mileage"));
				dto.setRegdate(rs.getString("regdate"));
				
			}
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	}  // orderMemberInfo() 메서드 end

	//비회원 아이디 생성 메서드 
	public String nonMemberId() {
		
		
		String memberId = "non"+count;
		
		count++;
		System.out.println(count);
		return memberId;
		
	}//nonMemberId() end 
	
	// ajax로 멤버 이름에 맞는 멤버 정보를 가져오는 메서드
	public String getMemberInfoAjax(String name) {
		
		String result = "";
		
		try {
			openConn();
			
			sql = "select * from apc_member where mem_name = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			
			result += "<members>";
			
			if(rs.next()) {
				
				result += "<member>";
				result += "<name>" + rs.getString("mem_name") + "</name>";
				result += "<phone>" + rs.getString("phone") + "</phone>";
				result += "<addr>" + rs.getString("addr") + "</addr>";
				result += "</member>";
				
			}
			
			result += "</members>";
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}  // getMemberInfoAjax() 메서드 end
	
	
	public MemberDTO getMember(String id) {
		
		MemberDTO dto = new MemberDTO();
		
		try {
			openConn();
			sql = "select * from apc_member where mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setBirth(rs.getString("birth"));
				dto.setAddr(rs.getString("addr"));
				dto.setMem_mileage(rs.getInt("mem_mileage"));
				dto.setRegdate(rs.getString("regdate"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	} // getMember() end
	
	
	public int updateAddr(String mem_id, String phone, String addr) {
		
		int result = 0;
		
		try {
			openConn();
			
			sql = "update apc_member set phone = ?, "
					+ "addr = ? where mem_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, phone);
			pstmt.setString(2, addr);
			pstmt.setString(3, mem_id);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	} // updateAddr() end

	//로그인한 아이디에 대한 비밀번호조회하기
	public String getPwd(String loginId) {
		
		String pwd = null;
		
		try {
			openConn();
			
			sql="select mem_pwd from apc_member where mem_id = ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, loginId);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				pwd = rs.getString(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return pwd;
	}
	

	// 마일리지 추가 액션
	public void mileageInsert(String id, int mileage) {


		try {
			openConn();

			sql = "update apc_member set mem_mileage = mem_mileage + ? where mem_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, mileage);
			pstmt.setNString(2, id);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}


	}
	
	
	public int updatePwd(String id, String pwd) {
		
		int result = 0;
		
		try {
			openConn();
			sql = "update apc_member set mem_pwd = ? where mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
