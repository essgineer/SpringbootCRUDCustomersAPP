package com.essgineer.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.essgineer.demo.dao.CustomerRepo;
import com.essgineer.demo.model.Customer;

@Controller
public class CustomerController {
	@Autowired	
	CustomerRepo repo;

	@RequestMapping("/")
	public ModelAndView home() {
	    System.out.println("****home****");
	    List<Customer> listCustomer =  (List<Customer>) repo.findAll();
	    System.out.println("Customer List: "+listCustomer);
	    ModelAndView mv = new ModelAndView("user-list.jsp");
	    mv.addObject("listCustomer", listCustomer);
	    return mv;
	}	
	
	@RequestMapping("/addCustomer")
	public ModelAndView addCustomer(Customer c) {
		System.out.println("****addCustomer****");
		ModelAndView mv=new ModelAndView("user-form.jsp");
		Customer customer=repo.findById(c.getId()).orElse(null);                          
		System.out.println("id filled in Form page:"+c.getId());
	   	if(customer==null) {
			System.out.println("new custommer in the List");
			repo.save(c);
			mv.setViewName("/");
			return mv;
		}
		System.out.println("id: "+c.getId()+" already in the list: "+repo.findById(c.getId()));
		mv.setViewName("/");   
		return mv; 
	}	
	
	@RequestMapping("/updateCustomer")
	public ModelAndView updateCustomer(Customer c) {
		System.out.println("****updateCustomer...edit****");
		ModelAndView mv=new ModelAndView("user-form.jsp"); 
		Customer customer=repo.findById(c.getId()).orElse(null);
		System.out.println("id: "+c.getId());
		if(c.getFname()!=null) {
			repo.save(c);
		    mv.setViewName("/");
		}
		mv.addObject(customer);
		return mv;
	}
	
	@RequestMapping("/deleteCustomer")
	public ModelAndView deleteCustomer(int id) {
		System.out.println("****deleteCustomer****");
		System.out.println("delete customer, id:"+ id);
		ModelAndView mv=new ModelAndView("user-list.jsp");
		repo.deleteById(id);		
		return home();
	}
	
}
