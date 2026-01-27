package com.abc.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.entity.UserProfile;

@Repository
public interface UserProfileRepository extends JpaRepository<UserProfile, Integer> {
	@Query(value = "SELECT * FROM tb_user_profile WHERE id_profile != :id ORDER BY RAND() LIMIT 3;", nativeQuery = true)
	public List<UserProfile> listPeople(@Param("id") int id);
}
