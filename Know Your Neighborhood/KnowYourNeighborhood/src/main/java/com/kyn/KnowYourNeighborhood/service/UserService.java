package com.kyn.KnowYourNeighborhood.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kyn.KnowYourNeighborhood.entities.Users;
import com.kyn.KnowYourNeighborhood.repository.UserRepository;

@Service
@Transactional
public class UserService {
	
	@Autowired
	UserRepository ur;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public Users saveUser(Users user) {
		user.setRole("user");
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		Users savedUser = ur.save(user);
		return savedUser;
	}
	
	public boolean login(String uname, String password) {
		Users logUser = ur.findByUsername(uname);
		if (logUser != null && passwordEncoder.matches(password, logUser.getPassword())) {
			return true;
		}
		
		return false;
	}

}
