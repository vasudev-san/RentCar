package com.rentcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rentcar.entity.Customer;
import com.rentcar.repository.CustomerRepository;

@Service
public class CustomerService {
	@Autowired
	CustomerRepository customerRepository;
	

	public Customer addCustomerDetail(Customer customer) {
		customerRepository.save(customer);
		return customer;
	}


	public Customer fetchCustomerDetail(int customerId) {
		Customer customer = customerRepository.findById(customerId).get();
		return customer;
	}
	
}
