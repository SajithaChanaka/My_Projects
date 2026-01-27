package com.abc.job;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.dao.ApplyJobRepository;
import com.abc.dao.JobRepository;
import com.abc.entity.ApplyJob;
import com.abc.entity.Job;
import com.abc.entity.UserProfile;

@Service
@Transactional
public class JobService {
	
	@Autowired
	JobRepository jobRepo;
	
	@Autowired
	ApplyJobRepository applyRepo;
	
	public List<Job> listJob(){
		List<Job> listJob = jobRepo.findAll();
		return listJob;
	}
	
	public List<Job> searchJob(String keyword){
		List<Job> listJob = jobRepo.search(keyword);
		return listJob;
	}
	
	public List<ApplyJob> listApplyJob(){
		List<ApplyJob> listApply = applyRepo.findAll();
		return listApply;
	}

	public Job findJob(int id) {
		Job job = jobRepo.findById(id).get();
		return job;
	}
	
	public void applyJob(UserProfile profile, Job job) {
		ApplyJob apply = new ApplyJob(profile, job, "PENDING");
		
		applyRepo.save(apply);
	}
}
