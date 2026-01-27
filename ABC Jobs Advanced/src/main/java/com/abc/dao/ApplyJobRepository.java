package com.abc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.entity.ApplyJob;

@Repository
public interface ApplyJobRepository extends JpaRepository<ApplyJob, Integer>{

}
