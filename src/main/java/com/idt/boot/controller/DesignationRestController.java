package com.idt.boot.controller;

import com.idt.boot.entity.Designation;
import com.idt.boot.repository.DesignationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/designation")
public class DesignationRestController {

    @Autowired
    private DesignationRepository designationRepository;

    @GetMapping("/list")
    public List<Designation> getAllDesignations() {
        return designationRepository.findAll();
    }
}
