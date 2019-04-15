package com.idt.boot.controller;

import com.idt.boot.dto.EmployeeDto;
import com.idt.boot.entity.Employee;
import com.idt.boot.exception.ResourceNotFoundException;
import com.idt.boot.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
//
//@RestController
//@RequestMapping("/employees")
@Controller
@RequestMapping("/employee")
public class EmployeeController {


    @GetMapping("/list")
    public String home(Model model, @RequestParam(value="name", required=false) String name) {
        model.addAttribute("name", name);
        return "employee/list";
    }

    @GetMapping("/profile")
    public String getProfile(Model model, @RequestParam(value="name", required=false) String name) {
        model.addAttribute("name", name);
        return "employee/profile";
    }
//    @Autowired
//    private EmployeeRepository employeeRepository;
//
//    @GetMapping
//    public List<Employee> findAll() {
//        return this.employeeRepository.findAll();
//    }
//
//    @GetMapping("/{id}")
//    public Employee findById(@PathVariable final Long id) throws ResourceNotFoundException {
//        return this.employeeRepository.findById(id).orElseThrow(ResourceNotFoundException::new);
//    }

//    @PostMapping
//    public Employee create(@RequestBody final EmployeeDto employeeDto) {
//        Employee employee = new Employee();
//
//        employee.setEmployeeNo(employeeDto.getEmployeeNo());
//        employee.setName(employeeDto.getName());
//        employee.setJobTitle(employeeDto.getJobTitle());
//
//        return this.employeeRepository.save(employee);
//    }
//
//    @PutMapping("/{id}")
//    public Employee update(@PathVariable Long id, @RequestBody final EmployeeDto employeeDto) throws ResourceNotFoundException {
//        Employee employee = this.employeeRepository.findById(id).orElseThrow(ResourceNotFoundException::new);
//
//        employee.setEmployeeNo(employeeDto.getEmployeeNo());
//        employee.setName(employeeDto.getName());
//        employee.setJobTitle(employeeDto.getJobTitle());
//
//        return this.employeeRepository.save(employee);
//    }
//
//    @DeleteMapping("/{id}")
//    public void deleteById(@PathVariable final Long id) {
//        this.employeeRepository.deleteById(id);
//    }

//    @GetMapping("/employeeNo/{employeeNo}")
//    private Employee findyByEmployeeNo(@PathVariable final String employeeNo) throws ResourceNotFoundException {
//        return this.employeeRepository.findByEmployeeNo(employeeNo).orElseThrow(ResourceNotFoundException::new);
//    }
}
