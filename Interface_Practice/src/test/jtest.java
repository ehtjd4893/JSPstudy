package test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import dao.PersonDAO;

class jtest {
	int size = 0;
	@BeforeEach
	void setUp() throws Exception {
		size = PersonDAO.getInstance().selectList().size();
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	@DisplayName("씁")
	void test() {
		if(size < 10) {
			fail("10명을 못 채웠네");
		}
		assertNull(PersonDAO.getInstance().selectPersonBySno("121315"), "121315학번은 있다.");
	}

}
