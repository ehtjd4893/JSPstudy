package dao;

import java.sql.Connection;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.PreparedStatement;

public class MemberDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	private static DataSource dataSource; // 커넥션 풀 관리
	// static 필드의 초기화: static 블록에서 처리
	
	static {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// singleton
	private static MemberDAO instance = new MemberDAO();
	private MemberDAO() {};
	public static MemberDAO getInstance() {
		if(instance == null)
			instance = new MemberDAO();
		return instance;
	}
	
	/* 접속해제 */
	public void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if(con != null) {con.close();}
			if(ps != null) {ps.close();}
			if(rs != null) {rs.close();}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
