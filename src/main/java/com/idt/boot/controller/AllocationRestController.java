package com.idt.boot.controller;

import com.idt.boot.dto.AllocationDto;
import com.idt.boot.dto.EmployeeDto;
import com.idt.boot.entity.Allocation;
import com.idt.boot.entity.Employee;
import com.idt.boot.entity.Project;
import com.idt.boot.repository.AllocationRepository;
import com.idt.boot.service.AllocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/allocation")
public class AllocationRestController {

    @Autowired
    private AllocationRepository allocationRepository;

    @GetMapping("/list/{id}")
    public List<Allocation> getAllocations(@PathVariable final Long id) {
        return allocationRepository.findByProjectId(id);
    }

    @GetMapping("/listByEmployee/{id}")
    public List<Allocation> getAllocationsByEmployee(@PathVariable final Long id) {
        return allocationRepository.findByEmployeeId(id);
    }

}
