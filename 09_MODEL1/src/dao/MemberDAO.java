package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
