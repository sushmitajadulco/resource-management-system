package com.idt.boot.controller;

import com.idt.boot.entity.Allocation;
import com.idt.boot.repository.AllocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
