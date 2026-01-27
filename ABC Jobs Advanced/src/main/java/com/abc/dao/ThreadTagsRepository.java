package com.abc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.entity.ThreadTags;

@Repository
public interface ThreadTagsRepository extends JpaRepository<ThreadTags, Integer>{

}
