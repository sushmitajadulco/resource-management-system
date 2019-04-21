package com.idt.boot.service.impl;

import com.idt.boot.dto.AllocationDto;
import com.idt.boot.entity.Allocation;
import com.idt.boot.entity.Employee;
import com.idt.boot.entity.Project;
import com.idt.boot.exception.AllocationException;
import com.idt.boot.exception.ResourceNotFoundException;
import com.idt.boot.repository.AllocationRepository;
import com.idt.boot.service.AllocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AllocationServiceImpl implements AllocationService {

    @Autowired
    private AllocationRepository allocationRepository;

    @Override
    public Allocation createAllocation(Employee employee, Project project, AllocationDto allocationDto) {
        Allocation allocation = allocationDto.toModel();
        allocation.setEmployee(employee);
        allocation.setProject(project);

        if (isAllocationPossible(allocation)) {
            return allocation;
        }
        return null;
    }

    @Override
    public List<Allocation> updateAllocation(AllocationDto allocationDto, Long id) {
        Allocation allocation = allocationRepository.findById(id).orElseThrow(() ->
            new ResourceNotFoundException(Allocation.class, id)
        );

        Employee employee = allocation.getEmployee();
        List<Allocation> allocationList = employee.getAllocationList();

        //get allocation from employee record in db
        for (Allocation alloc : allocationList) {
            if (alloc.getId() == allocation.getId()) {
                allocation = alloc;
                break;
            }
        }

        allocation = allocationDto.mergeChanges(allocation);
        isAllocationPossible(allocation);

        return allocationList;
    }

    private boolean isAllocationPossible(Allocation allocation) {
        List<Allocation> allocationList = allocationRepository.findAllByStartDateLessThanEqualAndEndDateGreaterThanEqualAndEmployeeId(
                allocation.getEndDate(),
                allocation.getStartDate(),
                allocation.getEmployee().getId());

        Double totalAllocation = allocation.getPercentage().getPercentage();
        for (int i = 0; i < allocationList.size(); i++) {
            Allocation allocationFromDb = allocationList.get(i);

            if (allocationFromDb.getId() != allocation.getId()) {
                totalAllocation += allocationFromDb.getPercentage().getPercentage();
                if (totalAllocation > 1.0) {
                    throw new AllocationException(allocation.getEmployee().toString());
                }
            }
        }

        return true;
    }
}
