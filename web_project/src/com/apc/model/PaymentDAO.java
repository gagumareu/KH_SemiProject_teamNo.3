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

public class PaymentDAO {

	Connection con = null;			//DB 연결하는 객체
	PreparedStatement pstmt = null;	//DB 에 SQL문을 전송하는 객체
	ResultSet rs = null;			//SQL문을 실행 후 결과 값을 가지고 있는 객체
	
	String sql = null;				//SQL문을 저장할 객체
	
	
	//1. 생성자를 private로 만들어준다
	private PaymentDAO() {	}
	
	//2. 객
	private static PaymentDAO instance;
	
	public static PaymentDAO getInstance() {
		
		if(instance == null) {
			instance = new PaymentDAO();
	
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
	
	//apc_payment 테이블에서 전체 내역 가져오는 메서드
	public List<PaymentDTO> getPaymentList(){
		
		List<PaymentDTO> list = new ArrayList<PaymentDTO>();
		PaymentDTO dto = new PaymentDTO();
		
		try {
			openConn();
			
			sql="select * form apc_payment order by orderdate desc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setCartno_fk(rs.getInt("catno_fk"));
				dto.setOrder_id(rs.getString("order_id"));
				dto.setPno_fk(rs.getInt("pon_fk"));
				dto.setPname(rs.getString("pname"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setTranscost(rs.getInt("transcost"));
				dto.setPaytype(rs.getInt("paytype"));
				dto.setOrderdate(rs.getString("orderdate"));
				dto.setOrdername(rs.getString("ordername"));
				dto.setOrderaddr(rs.getString("orderaddr"));
				dto.setOrderphone(rs.getString("orderphone"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
		
		
		
	}//getPaymentList() end
	
	//날자별 리스트 가져오기
	public List<SalesManagementDTO> getPaymentAsDate(){
		
		List<SalesManagementDTO> list = new ArrayList<SalesManagementDTO>();
		
		
		
		try {
			openConn();
			
			sql="select orderdate, sum(price) as price_sum, count(*) as count from apc_payment group by orderdate order by orderdate desc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SalesManagementDTO dto = new SalesManagementDTO();
				
				dto.setOrderdate(rs.getString("orderdate").substring(0,10));
				
				dto.setPrice_sum(rs.getInt("price_sum"));
				
				dto.setCount(rs.getInt("count"));
				
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
	
	// ***************** 이슬님 ****************
	
	//회원 별 구매리스트 불러오는 메서드
	public List<PaymentDTO> getPayList(String id){
		
		List<PaymentDTO> list = new ArrayList<PaymentDTO>();
		
		try {
			openConn();
			
			sql="select * from apc_payment where order_id = ? ";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				PaymentDTO dto = new PaymentDTO();
				
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setCartno_fk(rs.getInt("cartno_fk"));
				dto.setOrder_id(rs.getString("order_id"));
				dto.setPno_fk(rs.getInt("pno_fk"));
				dto.setPname(rs.getString("pname"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setTranscost(rs.getInt("transcost"));
				dto.setPaytype(rs.getInt("paytype"));
				dto.setOrderdate(rs.getString("orderdate"));
				dto.setOrdername(rs.getString("ordername"));
				dto.setOrderaddr(rs.getString("orderaddr"));
				dto.setOrderphone(rs.getString("orderphone"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}

	
	// ****************** 동찬님 *******************
	
	// 결제내역을 불러오는 메서드
	public List<PaymentDTO> getPaymentInfo(String id) {
		
		List<PaymentDTO> list = new ArrayList<PaymentDTO>();
		
		try {
			openConn();
			
			sql = "select * from apc_payment where order_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			PaymentDTO dto = new PaymentDTO();
			
			dto.setOrder_no(rs.getInt("order_no"));;
			dto.setCartno_fk(rs.getInt("cartno_fk"));
			dto.setOrder_id(rs.getString("order_id"));
			dto.setPno_fk(rs.getInt("pno_fk"));
			dto.setPname(rs.getString("pname"));
			dto.setPqty(rs.getInt("pqty"));
			dto.setPrice(rs.getInt("price"));
			dto.setTranscost(rs.getInt("transcost"));
			dto.setPaytype(rs.getInt("paytype"));
			dto.setOrderdate(rs.getString("orderdate"));
			dto.setOrdername(rs.getString("ordername"));
			dto.setOrderaddr(rs.getString("orderaddr"));
			dto.setOrderphone(rs.getString("orderphone"));
			
			list.add(dto);
			
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}  // getPaymentInfo() 메서드 end
	
	// payment에 구매목록을 집어넣는 메서드
				public int paymentInsert(PaymentDTO dto) {
					
					int result = 0, count = 0;
					
						try {
							openConn();
							
								
							sql = "select max(order_no) from apc_payment";
							
							pstmt = con.prepareStatement(sql);
							
							rs = pstmt.executeQuery();
							
							if(rs.next()) {
								count = rs.getInt(1) + 1;
							}
							
							sql = "insert into apc_payment "
									+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ? ,?, ?)";
							
							pstmt = con.prepareStatement(sql);
							
							pstmt.setInt(1, count);
							pstmt.setInt(2, dto.getCartno_fk());
							pstmt.setString(3, dto.getOrder_id());
							pstmt.setInt(4, dto.getPno_fk());
							pstmt.setString(5, dto.getPname());
							pstmt.setInt(6, dto.getPqty());
							pstmt.setInt(7, dto.getPrice());
							pstmt.setInt(8, dto.getTranscost());
							pstmt.setInt(9, dto.getPaytype());
							pstmt.setString(10, dto.getOrdername());
							pstmt.setString(11, dto.getOrderaddr());
							pstmt.setString(12, dto.getOrderphone());
							pstmt.setString(13, dto.getPay_pimage());
							
							result = pstmt.executeUpdate();
							
							sql = "update apc_products set pqty = pqty - ? where pno = ?";
							
							pstmt = con.prepareStatement(sql);
							
							pstmt.setInt(1, dto.getPqty());
							pstmt.setInt(2, dto.getPno_fk());
							
							pstmt.executeUpdate();
							
							
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					
					return result;
				}
	
	// ****************** 경연님  *******************

	
	public List<PaymentDTO> getOrderPaymentList(String id){
		
		List<PaymentDTO> list = new ArrayList<PaymentDTO>();
		
		try {
			openConn();
			sql = "select * from apc_payment where order_id = ? order by orderdate desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				PaymentDTO dto = new PaymentDTO();
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setCartno_fk(rs.getInt("cartno_fk"));
				dto.setOrder_id(rs.getString("order_id"));
				dto.setPno_fk(rs.getInt("pno_fk"));
				dto.setPname(rs.getString("pname"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setTranscost(rs.getInt("transcost"));
				dto.setPaytype(rs.getInt("paytype"));
				dto.setOrderdate(rs.getString("orderdate"));
				dto.setOrdername(rs.getString("ordername"));
				dto.setOrderaddr(rs.getString("orderaddr"));
				dto.setOrderphone(rs.getString("orderphone"));
				dto.setPay_pimage(rs.getString("pay_pimage"));
				
				list.add(dto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	} // getOrderPaymentList() end
	
	
	public PaymentDTO getPaymentContent(int no) {
		
		PaymentDTO dto = new PaymentDTO();
		
		try {
			openConn();
			sql = "select * from apc_payment where order_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setCartno_fk(rs.getInt("cartno_fk"));
				dto.setOrder_id(rs.getString("order_id"));
				dto.setPno_fk(rs.getInt("pno_fk"));
				dto.setPname(rs.getString("pname"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setTranscost(rs.getInt("transcost"));
				dto.setPaytype(rs.getInt("paytype"));
				dto.setOrderdate(rs.getString("orderdate"));
				dto.setOrdername(rs.getString("ordername"));
				dto.setOrderaddr(rs.getString("orderaddr"));
				dto.setOrderphone(rs.getString("orderphone"));
				dto.setPay_pimage(rs.getString("pay_pimage"));
				
				System.out.println("dto등록");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	} // getPaymentContent() end
	
	
	
	
	
	
}
