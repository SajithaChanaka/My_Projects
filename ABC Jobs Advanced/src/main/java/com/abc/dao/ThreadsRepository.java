package com.abc.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.entity.Threads;

@Repository
public interface ThreadsRepository extends JpaRepository<Threads, Integer>{
	@Query(value = "SELECT * FROM tb_thread WHERE id_profile = :id", nativeQuery = true)
	List<Threads> findByIdProfile(@Param("id")int id);
	
	@Query(value = "SELECT * "
		      + "FROM tb_thread AS T "
		      + "LEFT JOIN tb_thread_tags AS TT ON T.id_thread = TT.id_thread "
		      + "WHERE T.title LIKE '%' :keyword '%' "
		      + "OR T.content LIKE '%' :keyword '%' "
		      + "OR TT.first_tag LIKE '%' :keyword '%' "
		      + "OR TT.second_tag LIKE '%' :keyword '%';", 
		      nativeQuery = true)
	List<Threads> search(@Param("keyword") String keyword);
}
