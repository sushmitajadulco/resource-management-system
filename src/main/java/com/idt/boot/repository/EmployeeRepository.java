package com.idt.boot.repository;

import com.idt.boot.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface EmployeeRepository  {

   // Optional<Employee> findByEmployeeNo(final String employeeNo);
}

