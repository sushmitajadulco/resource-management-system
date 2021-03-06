package com.idt.boot.repository;

import com.idt.boot.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long>{

    List<Employee> findAllByIsEmployedOrderByIdDesc(Boolean isEmployed);
}

