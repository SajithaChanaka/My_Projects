package com.abc.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.entity.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer>{
	@Query(value = "SELECT * FROM tb_comment WHERE id_thread = :id", nativeQuery = true)
	List<Comment> findByIdThread(@Param("id")int id);

}
