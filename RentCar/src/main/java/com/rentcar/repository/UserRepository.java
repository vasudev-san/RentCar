package com.rentcar.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.rentcar.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	List<User> findAll();
	User findByUsername(String string);

}
