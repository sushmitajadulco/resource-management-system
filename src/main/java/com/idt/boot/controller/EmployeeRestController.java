package com.idt.boot.controller;

import com.idt.boot.dto.EmployeeDto;
import com.idt.boot.entity.Employee;
import com.idt.boot.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/employee")
public class EmployeeRestController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/list")
    public ResponseEntity<List<Employee>> getAllEmployees() {
        return new ResponseEntity<>(this.employeeService.getEmployees(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getEmployeeProfile(@PathVariable final Long id) {
        return new ResponseEntity<>(employeeService.getEmployee(id), HttpStatus.OK);
    }

    @PostMapping("/add")
    public ResponseEntity<Employee> createEmployee(@RequestBody final EmployeeDto employeeDto) {
        return new ResponseEntity<>(employeeService.createEmployee(employeeDto), HttpStatus.OK);
    }

    @PutMapping("/edit/{id}")
    public ResponseEntity<Employee> updateEmployee(@PathVariable final Long id, @RequestBody final EmployeeDto employeeDto) {
        return new ResponseEntity<>(employeeService.updateEmployee(id, employeeDto), HttpStatus.OK);
    }

    @PostMapping("/delete/{id}")
    public ResponseEntity delete(@PathVariable final Long id) {
        employeeService.terminateEmployee(id);

        return new ResponseEntity(HttpStatus.OK);
    }
}
