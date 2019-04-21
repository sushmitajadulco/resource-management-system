package com.idt.boot.service.impl;

import com.idt.boot.dto.AllocationDto;
import com.idt.boot.dto.EmployeeDto;
import com.idt.boot.entity.*;
import com.idt.boot.exception.ResourceNotFoundException;
import com.idt.boot.repository.DesignationRepository;
import com.idt.boot.repository.EmployeeRepository;
import com.idt.boot.repository.LevelRepository;
import com.idt.boot.repository.ProjectRepository;
import com.idt.boot.service.AllocationService;
import com.idt.boot.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private DesignationRepository designationRepository;

    @Autowired
    private LevelRepository levelRepository;

    @Autowired
    private AllocationService allocationService;

    public EmployeeServiceImpl() {
    }

    @Override
    public List<Employee> getEmployees() {
        return employeeRepository.findAllByIsEmployedOrderByIdDesc(true);
    }

    @Transactional
    @Override
    public Employee createEmployee(EmployeeDto employeeDto) {
        Designation designation = getDesignation(employeeDto.getDesignationId());
        Level level = getLevel(employeeDto.getLevelId());

        Employee employee = employeeDto.toModel();
        employee.setDesignation(designation);
        employee.setLevel(level);

        return employeeRepository.save(employee);
    }

    @Transactional
    @Override
    public Employee updateEmployee(Long id, EmployeeDto employeeDto) {
        Employee employee = getEmployee(id);
        Designation designation = getDesignation(employeeDto.getDesignationId());
        Level level = getLevel(employeeDto.getLevelId());

        employee = employeeDto.mergeChanges(employee);
        employee.setDesignation(designation);
        employee.setLevel(level);

        return employeeRepository.save(employee);
    }

    @Transactional
    @Override
    public void terminateEmployee(Long id) {
        Employee employee = getEmployee(id);
        employee.setEmployed(false);

        employeeRepository.save(employee);
    }

    @Override
    public Employee addAllocation(AllocationDto allocationDto) {
        Employee employee = getEmployee(allocationDto.getEmployeeId());
        Project project = getProject(allocationDto.getProjectId());

        Allocation allocation = allocationService.createAllocation(employee, project, allocationDto);
        if (allocation != null) {
            if(employee.getAllocationList() == null) {
                employee.setAllocationList(new ArrayList<>());
            }
            employee.getAllocationList().add(allocation);
        }

        return employeeRepository.save(employee);
    }

    @Override
    public Employee updateAllocation(AllocationDto allocationDto, Long id) {
        Employee employee = getEmployee(allocationDto.getEmployeeId());

        if (employee.getAllocationList() == null) {
            employee.setAllocationList(new ArrayList<>());
        }
        employee.getAllocationList().clear();
        employee.getAllocationList().addAll(allocationService.updateAllocation(allocationDto, id));

        return employeeRepository.save(employee);
    }

    public Employee getEmployee(Long id) {
        return employeeRepository.findById(id).orElseThrow(() ->
            new ResourceNotFoundException(Employee.class, id)
        );
    }

    private Project getProject(Long id) {
        return projectRepository.findById(id).orElseThrow(() ->
            new ResourceNotFoundException(Project.class, id)
        );
    }

    private Designation getDesignation(Long id) {
        return designationRepository.findById(id).orElseThrow(() ->
            new ResourceNotFoundException(Designation.class, id)
        );
    }

    private Level getLevel(Long id) {
        return levelRepository.findById(id).orElseThrow(() ->
            new ResourceNotFoundException(Level.class, id)
        );
    }
}
