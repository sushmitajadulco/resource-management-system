package com.idt.boot.service;

import com.idt.boot.dto.EmployeeDto;
import com.idt.boot.entity.Employee;

import java.util.List;

public interface EmployeeService {

    public List<Employee> getEmployees();

    public Employee createEmployee(EmployeeDto employeeDto);

    public Employee updateEmployee(Long id, EmployeeDto employeeDto);

    public void terminateEmployee(Long id);

    public Employee getEmployee(Long id);
}
