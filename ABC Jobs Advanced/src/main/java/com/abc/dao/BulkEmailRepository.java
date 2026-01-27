package com.abc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.entity.BulkEmail;

@Repository
public interface BulkEmailRepository extends JpaRepository<BulkEmail, Integer> {

}
