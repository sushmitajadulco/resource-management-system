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
}
