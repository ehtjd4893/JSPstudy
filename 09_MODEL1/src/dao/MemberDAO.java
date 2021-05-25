package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.tuil.DBConnector;
import dto.MemberDTO;

public class MemberDAO {
	
	// singleton
	private static MemberDAO dao = new MemberDAO();
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		if(dao == null)
			dao = new MemberDAO();
		return dao;
	}
	
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql = null;
	
	/* 1. 회원가입 */
	public int save(MemberDTO dto) {	// join.jsp가 전달한 dto
		int result = 0;
		
		try {
			con = DBConnector.getInstance().getConnection();
			sql = "INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getEmail());
			result = ps.executeUpdate();
			System.out.println(result);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.getInstance().close(ps, rs);
		}
		
		return result;
	}
	public boolean isUsableId(String id) {	// idCheck.jsp가 전달한 id
		System.out.println(id);
		boolean result = false;
		try {
			con = DBConnector.getInstance().getConnection();
			sql = "SELECT ID FROM MEMBER WHERE ID = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
	
			if(!rs.next()) { // 검색결과 rs가 없으면 중복 없음.(가입 가능) System.out.println("here");
				result = true; 
			}
	
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBConnector.getInstance().close(ps, rs);
		}
		return result;
	}
	
	// 로그인
	public MemberDTO login(MemberDTO dto) {	// login.jsp에서 받아온 dto
		MemberDTO loginDTO = null;
		try {
			con = DBConnector.getInstance().getConnection();
			sql = "SELECT NO, ID, PW, NAME, EMAIL, REGDATE FROM MEMBER WHERE ID = ? AND PW = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			rs = ps.executeQuery();
			if(rs.next()) {
				loginDTO = new MemberDTO();
				loginDTO.setNo(rs.getLong(1));
				loginDTO.setId(rs.getString(2));
				loginDTO.setPw(rs.getString(3));
				loginDTO.setName(rs.getString(4));
				loginDTO.setEmail(rs.getString(5));
				loginDTO.setRegdate(rs.getDate(6));
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBConnector.getInstance().close(ps, rs);
		}
		
		return loginDTO;
	}
	
	public int updatePw(MemberDTO dto) {  // pwChange.jsp에서 받아 온 dto
		int result = 0;
		try {
			con = DBConnector.getInstance().getConnection();
			sql = "UPDATE MEMBER SET PW = ? WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPw());
			ps.setLong(2, dto.getNo());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.getInstance().close(ps, null);
		}
		return result;
	}
	
	public int updateEmail(MemberDTO dto) {
		int result = 0;
		try {
			con = DBConnector.getInstance().getConnection();
			sql = "UPDATE MEMBER SET email = ? WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getEmail());
			ps.setLong(2, dto.getNo());
			result = ps.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnector.getInstance().close(ps, rs);
		}
		
		return result;
	}
	
	public int updateName(MemberDTO dto) {
		int result = 0;
		try {
			con = DBConnector.getInstance().getConnection();
			sql = "UPDATE MEMBER SET name = ? WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setLong(2, dto.getNo());
			result = ps.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnector.getInstance().close(ps, rs);
		}
		
		return result;
	}
	
	public int deleteMember(long no) {
		int result = 0;
		try {
			con = DBConnector.getInstance().getConnection();
			sql = "DELETE FROM MEMBER WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, no);
			result = ps.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnector.getInstance().close(ps, rs);
		}
		return result;
	}
	
	public List<MemberDTO> searchAll(){
		List<MemberDTO> list = null; 
		try {
			con = DBConnector.getInstance().getConnection();
			sql = "SELECT NO, ID, PW, NAME, EMAIL, REGDATE FROM MEMBER";

			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();

			list = new ArrayList<MemberDTO>();

			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNo(rs.getLong(1));
				dto.setId(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setRegdate(rs.getDate(6));
				list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			DBConnector.getInstance().close(ps, rs);
		}
		
		return list;
	}
}
