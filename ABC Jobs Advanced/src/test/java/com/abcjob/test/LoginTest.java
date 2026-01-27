package com.abcjob.test;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.abc.config.JpaConfig;
import com.abc.config.WebConfig;
import com.abc.dao.UserRepository;
import com.abc.entity.User;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = {WebConfig.class, JpaConfig.class})
public class LoginTest {
	
	@Autowired
	UserRepository repo;
	
	@Test
	public void loginTest() {
		String email = "barry@abc.com";
		String password = "barry123";
		
		User user = repo.findByEmail(email);
		
		assertEquals(password, user.getPassword());
		assertTrue(user.getEnabled());
		assertNotNull(user);
	}
}
