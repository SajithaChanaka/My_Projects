package com.abc.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.entity.SearchProfile;

@Repository
public interface SearchProfileRepository extends JpaRepository<SearchProfile, Integer>{
	@Query(value = "SELECT * "
	      + "FROM tb_user_profile AS UP "
	      + "LEFT JOIN tb_jobs AS J ON UP.id_job = J.id_job "
	      + "WHERE UP.first_name LIKE '%' :keyword '%' "
	      + "OR UP.last_name LIKE '%' :keyword '%' "
	      + "OR UP.country LIKE '%' :keyword '%' "
	      + "OR UP.city LIKE '%' :keyword '%' "
	      + "OR J.company_name LIKE '%' :keyword '%';", 
	      nativeQuery = true)
	public List<SearchProfile> search(@Param("keyword") String keyword);
}
