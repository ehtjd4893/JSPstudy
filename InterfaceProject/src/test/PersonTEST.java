package test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import dao.PersonDAO;

class PersonTEST {
	int size = 0;
	
	@BeforeEach
	void setUp() throws Exception {
		size = PersonDAO.getInstance().selectPersonList().size();
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	@DisplayName("쓰벌")
	void test() {
		//assertEquals(2, size, "등록된 사람은 2명이 아닙니다.");
		
		// 121315 주민번호 검색
		assertNotNull(PersonDAO.getInstance().selectPersonBySno("121315"));
	}

}
