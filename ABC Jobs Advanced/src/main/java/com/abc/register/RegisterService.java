package com.abc.register;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.dao.*;
import com.abc.entity.*;

@Service
@Transactional
public class RegisterService {

	@Autowired
	UserRepository userRepo;

	@Autowired
	UserProfileRepository profileRepo;

	@Autowired
	JobRepository jobRepo;

	public void saveRegister(User regUser) {
		User user = new User();
		UserProfile profile = new UserProfile();

		user.setEmail(regUser.getEmail());
		user.setPassword(regUser.getPassword());
		user.setEnabled(false);
		
		profile.setFirst_name(regUser.getProfile().getFirst_name());
		profile.setLast_name(regUser.getProfile().getLast_name());
		profile.setCountry(regUser.getProfile().getCountry());
		profile.setCity(regUser.getProfile().getCity());
		profile.setPicture("images/user/default.png");
		
		if(regUser.getProfile().getJob().getId_job() == 0) {
			profile.setJob(null);
		} else {
			profile.setJob(regUser.getProfile().getJob());
		}
		
		profile.setUser(user);
		user.setProfile(profile);

		userRepo.save(user);
	}

	public List<Job> listJob() {
		List<Job> listJob = jobRepo.findAll();
		return listJob;
	}

	public User findUser(int id) {
		User user = userRepo.findById(id).get();
		return user;
	}

	public void userActivation(User userActivation) {
		userActivation.setEnabled(true);
		userRepo.save(userActivation);
	}

}
