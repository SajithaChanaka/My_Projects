package com.abc.change_password;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.dao.UserRepository;
import com.abc.entity.User;

@Service
@Transactional
public class ChangePasswordService {

	@Autowired
	UserRepository userRepo;

	public void changePassword(User user, String newPassword) {
		user.setPassword(newPassword);
		userRepo.save(user);
	}
}
