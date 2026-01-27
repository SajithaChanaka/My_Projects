package com.kyn.KnowYourNeighborhood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.kyn.KnowYourNeighborhood.entities.Users;

public interface UserRepository extends JpaRepository<Users, Long>{
	
	@Query(value="SELECT * FROM users WHERE user_name = :uname AND password = :password",
			 nativeQuery = true)
		public Users login(String uname, String password);
	
	@Query(value="SELECT * FROM users WHERE user_name = :uname",
			 nativeQuery = true)
	 public Users findByUsername(String uname);
}
