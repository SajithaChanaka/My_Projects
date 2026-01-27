package com.abc.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.dao.AdminRepository;
import com.abc.dao.ApplyJobRepository;
import com.abc.dao.JobRepository;
import com.abc.dao.UserProfileRepository;
import com.abc.dao.UserRepository;
import com.abc.entity.*;

@Service
@Transactional
public class AdminService {

	@Autowired
	AdminRepository adminRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	UserProfileRepository profileRepo;
	
	@Autowired
	JobRepository jobRepo;
	
	@Autowired
	ApplyJobRepository applyJobRepo;

	public Admin loadAdminByEmail(String email) {
		Admin admin = adminRepo.findByEmail(email);
		return admin;
	}

	public Admin getAdmin(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");

		if (admin != null) {
			System.out.println("User " + admin.getFirst_name());
		}
		return admin;
	}

	public List<UserProfile> listUser() {
		List<UserProfile> listOfUser = profileRepo.findAll();
		return listOfUser;
	}

	public UserProfile findUser(int id) {
		UserProfile profile = profileRepo.findById(id).get();
		return profile;
	}

	public Job findJob(int id) {
		Job job = jobRepo.findById(id).get();
		return job;
	}

	public UserProfile saveEdit(UserProfile userProfile) {
		Job job = new Job();
		UserProfile profile = findUser(userProfile.getId_profile());
		int id_job = userProfile.getJob().getId_job();

		profile.setFirst_name(userProfile.getFirst_name());
		profile.setLast_name(userProfile.getLast_name());
		profile.setCountry(userProfile.getCountry());
		profile.setCity(userProfile.getCity());
	
		if(id_job != 0) {
			job = findJob(id_job);
			profile.setJob(job);
		} else {
			profile.setJob(null);
		}

		profileRepo.save(profile);

		return profile;
	}

	public void deleteUser(int id) {
		userRepo.deleteById(id);
	}

	public List<Job> listJob() {
		List<Job> listJob = jobRepo.findAll();
		return listJob;
	}

	public void saveAdd(User regUser) {
		User user = new User();
		UserProfile profile = new UserProfile();

		User userAdd = new User(regUser.getEmail(), regUser.getPassword(), true, profile);
		UserProfile userProfile = new UserProfile(user,
				regUser.getProfile().getFirst_name(),
				regUser.getProfile().getLast_name(),
				regUser.getProfile().getCountry(),
				regUser.getProfile().getCity(),
				regUser.getProfile().getJob(), 
				"images/user/user-default.png", null);

		userAdd.setProfile(userProfile);
		userProfile.setUser(userAdd);

		profileRepo.save(userProfile);
	}

	public List<User> findAllUser() {
		List<User> users = userRepo.findAll();
		return users;
	}
	
	public List<User> findAllUserById(String[] id_users){
		List<Integer> IDs = new ArrayList<>();
		
		for(String id : id_users) {
			IDs.add(Integer.valueOf(id));
		}
		
		List<User> users = userRepo.findAllById(IDs);
		return users;
	}
	
	public List<ApplyJob> listJobApplicant(){
		List<ApplyJob> applyJob = applyJobRepo.findAll();
		List<ApplyJob> listApplicant = new ArrayList<>();
		
		for(ApplyJob aj : applyJob) {
			if(aj.getStatus().equals("PENDING")) {
				listApplicant.add(aj);
			}
		}
		
		return listApplicant;
	}
	
	public void postJob(Job job) {
		jobRepo.save(job);
	}
	
	public void acceptJob(int id_profile, int id_job, int id_apply) {
		UserProfile userProfile = profileRepo.findById(id_profile).get();
		ApplyJob applyJob = applyJobRepo.findById(id_apply).get();
		Job job = jobRepo.findById(id_job).get();
		
		applyJob.setStatus("ACCEPTED");
		
		userProfile.setJob(job);
		
		profileRepo.save(userProfile);
		applyJobRepo.save(applyJob);
	}
	
	public void declineJob(int id_apply) {
		ApplyJob applyJob = applyJobRepo.findById(id_apply).get();
		applyJob.setStatus("DECLINED");
		applyJobRepo.save(applyJob);
	}
	
	public void editJob(Job job) {
		Job editJob = findJob(job.getId_job());
		
		editJob.setJob_name(job.getJob_name());
		editJob.setJob_level(job.getJob_level());
		editJob.setJob_time(job.getJob_time());
		editJob.setJob_description(job.getJob_description());
		editJob.setCompany_name(job.getCompany_name());
		editJob.setCompany_image("images/logo/" + job.getCompany_name().toLowerCase() + ".png");
		
		jobRepo.save(editJob);
	}
	
	public void deleteJob(int id) {
		jobRepo.deleteById(id);
	}
}
