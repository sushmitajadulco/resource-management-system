package com.idt.boot.service;

import com.idt.boot.dto.AllocationDto;
import com.idt.boot.entity.Allocation;
import com.idt.boot.entity.Employee;
import com.idt.boot.entity.Project;

import java.util.List;

public interface AllocationService {

    public Allocation createAllocation(Employee employee, Project project, AllocationDto allocationDto);

    public List<Allocation> updateAllocation(AllocationDto allocationDto, Long id);

    public List<Allocation> getAllCurrentAllocationsByEmployee(Long id);

    public List<Allocation> getAllPastAllocationsByEmployee(Long id);

    public Allocation getAllocation(Long id);
}
