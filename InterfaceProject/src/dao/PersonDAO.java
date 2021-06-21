package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Person;

public class PersonDAO {

	private static PersonDAO instance;
	
	private PersonDAO() {

	}
	
	public static PersonDAO getInstance() {
		if(instance == null) {
			instance = new PersonDAO();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","spring","1111");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	private void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if(con != null) con.close();
			if(ps != null) ps.close();
			if(rs != null) rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	public List<Person> selectPersonList(){
		List<Person> list = new ArrayList<Person>();
		try {
			con = getConnection();
			sql = "SELECT SNO, NAME, AGE, BIRTHDAY, REGDATE FROM PERSON";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Person p = new Person();
				p.setSno(rs.getString(1));
				p.setName(rs.getString(2));
				p.setAge(rs.getInt(3));
				p.setBirthday(rs.getString(4));
				p.setRegDate(rs.getDate(5));
				list.add(p);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(con, ps, rs);
		}
		return list;
	}
	
	public int insertPerson(Person person) throws SQLException {
		int count = 0;
		con = getConnection();
		sql = "INSERT INTO PERSON VALUES(?,?,?,?, SYSDATE)";
		ps = con.prepareStatement(sql);
		ps.setString(1, person.getSno());
		ps.setString(2, person.getName());
		ps.setInt(3, person.getAge());
		ps.setString(4, person.getBirthday());
		count = ps.executeUpdate();
		System.out.println(count);
		close(con, ps, rs);
		return count;
	}
	
	
	
}