package com.abc.update_profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.dao.*;
import com.abc.entity.*;

@Service
@Transactional
public class UpdateProfileService {

	@Autowired
	UserProfileRepository profileRepo;

	public UserProfile getProfileById(int id) {
		return profileRepo.findById(id).get();
	}

	public UserProfile saveEdit(UserProfile logProfile) {
		UserProfile profile = getProfileById(logProfile.getId_profile());

		profile.setFirst_name(logProfile.getFirst_name());
		profile.setLast_name(logProfile.getLast_name());
		profile.setCountry(logProfile.getCountry());
		profile.setCity(logProfile.getCity());
		profile.setAbout(logProfile.getAbout());

		profileRepo.save(profile);

		return profile;
	}
}
