package com.idt.boot.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.idt.boot.entity.Developer;

public interface DeveloperRepository extends JpaRepository<Developer, Long>{

	
}
