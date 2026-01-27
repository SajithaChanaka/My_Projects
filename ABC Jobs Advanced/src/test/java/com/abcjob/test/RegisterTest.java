package com.abcjob.test;

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
import com.abc.entity.UserProfile;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = {WebConfig.class, JpaConfig.class})
public class RegisterTest {
	
	@Autowired
	UserRepository userRepo;
	
	@Test
	public void registerTest() {
		
		String email = "tester@abc.com";
		
		User user = new User();
		user.setEmail(email);
		user.setPassword("test123");
		user.setEnabled(true);
		
		UserProfile profile = new UserProfile();
		profile.setFirst_name("Test");
		profile.setLast_name("Application");
		profile.setCountry("Indonesia");
		profile.setCity("Jakarta");
		
		profile.setUser(user);
		user.setProfile(profile);
		
		User testUser = userRepo.save(user);
		
		assertEquals(email, testUser.getEmail());
	}
}
