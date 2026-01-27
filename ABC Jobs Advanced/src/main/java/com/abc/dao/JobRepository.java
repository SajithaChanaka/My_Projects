package com.abc.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.entity.Job;

@Repository
public interface JobRepository extends JpaRepository<Job, Integer> {
	@Query(value = "SELECT * FROM tb_jobs "
			+ "WHERE job_level LIKE '%' :keyword '%' "
			+ "OR job_time LIKE '%' :keyword '%' "
			+ "OR job_name LIKE '%' :keyword '%' "
			+ "OR company_name LIKE '%' :keyword '%';", 
		      nativeQuery = true)
	List<Job> search(@Param("keyword") String keyword);
}
