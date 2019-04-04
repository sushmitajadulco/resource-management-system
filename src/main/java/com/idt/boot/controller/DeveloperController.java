package com.idt.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.idt.boot.dto.DeveloperDto;
import com.idt.boot.entity.Developer;
import com.idt.boot.exception.ResourceNotFoundException;
import com.idt.boot.repository.DeveloperRepository;



@RestController
@RequestMapping("/developers")
public class DeveloperController {
	
	 @Autowired
	    private DeveloperRepository developerRepository;

	    @GetMapping
	    public List<Developer> findAll() {
	        return this.developerRepository.findAll();
	    }

	    @GetMapping("/{id}")
	    public Developer findById(@PathVariable final Long id) throws ResourceNotFoundException {
	        return this.developerRepository.findById(id).orElseThrow(ResourceNotFoundException::new);
	    }

	    @PostMapping
	    public Developer create(@RequestBody final DeveloperDto employeeDto) {
	        Developer developer = new Developer();

	        developer.setName(employeeDto.getName());
	        developer.setJobTitle(employeeDto.getJobTitle());

	        return this.developerRepository.save(developer);
	    }

	    @PutMapping("/{id}")
	    public Developer update(@PathVariable Long id, @RequestBody final DeveloperDto employeeDto) throws ResourceNotFoundException {
	        Developer developer = this.developerRepository.findById(id).orElseThrow(ResourceNotFoundException::new);

	        developer.setName(employeeDto.getName());
	        developer.setJobTitle(employeeDto.getJobTitle());

	        return this.developerRepository.save(developer);
	    }

	    @DeleteMapping("/{id}")
	    public void deleteById(@PathVariable final Long id) {
	        this.developerRepository.deleteById(id);
	    }

}
