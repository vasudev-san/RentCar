package com.rentcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rentcar.entity.Customer;
import com.rentcar.entity.User;
import com.rentcar.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	public void addUserDetails(Customer customer, String username, String password) {
		User user = new User(customer,username,password);
		userRepository.save(user);
	}
	public User fetchUserDetailFromDataBase(String username) {
		User user = userRepository.findByUsername(username);
		return user;
	}
	public boolean checkUsernamePassword(String username, String password) {
		User user = userRepository.findByUsername(username);
		System.out.println(user);
		if(user==null) {
			return false;
		}
		else {
			if(user.getPassword().equals(password))
				return true;
			else
				return false;
		}
	}
	
	

}
