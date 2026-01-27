package com.abc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.entity.Tags;

@Repository
public interface TagsRepository extends JpaRepository<Tags, Integer>{

}
