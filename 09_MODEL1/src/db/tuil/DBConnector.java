package db.tuil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnector {
	
	// singleton
	private static DBConnector instance = new DBConnector();
	
	// DBConnector는 Connection을 생성
	private Connection con = null;
	private DBConnector() {
		try {
			Class.forName(DBConfig.DRIVER);
			con = DriverManager.getConnection(DBConfig.URL, DBConfig.USER, DBConfig.PASSWORD);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	public static DBConnector getInstance() {
		if(instance == null) {
			instance = new DBConnector();
		}
		return instance;
	}
	
	// 생성된 Connection 반환
	public Connection getConnection() {
		return con;
	}
	
	public void close(PreparedStatement ps, ResultSet rs) {
		try {
			//if(con != null ) {con.close();}
			if(ps != null) {ps.close();}
			if(rs != null) {rs.close();}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
