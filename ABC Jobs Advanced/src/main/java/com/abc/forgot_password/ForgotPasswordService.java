package com.abc.forgot_password;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.dao.ForgotPasswordRepository;
import com.abc.entity.User;

@Service
@Transactional
public class ForgotPasswordService {

	@Autowired
	ForgotPasswordRepository forgotPasswordRepo;

	public User findUser(String email) {
		User user = forgotPasswordRepo.findByEmail(email);
		return user;
	}

	public void forgotPassword(User userFP) {
		userFP.setPassword("password123");
		forgotPasswordRepo.save(userFP);
	}
}
