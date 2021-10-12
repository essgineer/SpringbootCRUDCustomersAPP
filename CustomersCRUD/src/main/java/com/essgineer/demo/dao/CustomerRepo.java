package com.essgineer.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.essgineer.demo.model.Customer;

public interface CustomerRepo extends JpaRepository<Customer, Integer>{
	
}