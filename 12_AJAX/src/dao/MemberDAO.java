package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Member;
import mybatis.config.DBService;

public class MemberDAO {
	
	private SqlSessionFactory factory;
	
	private static MemberDAO instance;
	
	private MemberDAO() {
		factory = DBService.getInstance().getFactory();
	}
	
	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	public Member login(Member member) {
		SqlSession ss = factory.openSession();
		Member loginUser = ss.selectOne("dao.member.login",member);
		ss.close();
		return loginUser;
	}

	public boolean idCheck(String id) {
		SqlSession ss = factory.openSession();
		Member member = ss.selectOne("dao.member.idCheck", id);
		ss.close();
		return member == null? true : false;
	}
}
