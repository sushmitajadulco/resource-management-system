package com.idt.boot.dto;

import com.idt.boot.entity.Allocation;
import com.idt.boot.entity.Employee;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

public class EmployeeDto {

    private String firstName;
    private String lastName;
    private String middleName;
    private String email;
    private Long designationId;
    private Long levelId;
    private List<Allocation> allocationList = new ArrayList<>();

    public EmployeeDto() {
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getDesignationId() {
        return designationId;
    }

    public void setDesignationId(Long designationId) {
        this.designationId = designationId;
    }

    public Long getLevelId() {
        return levelId;
    }

    public void setLevelId(Long levelId) {
        this.levelId = levelId;
    }

    public List<Allocation> getAllocationList() {
        return allocationList;
    }

    public void setAllocationList(List<Allocation> allocationList) {
        this.allocationList = allocationList;
    }

    public Employee toModel() {
        Employee employee = new Employee();
        employee.setFirstName(firstName);
        employee.setLastName(lastName);
        employee.setMiddleName(middleName);
        employee.setEmail(email);
        employee.setAllocationList(allocationList);

        return employee;
    }

    public Employee mergeChanges(Employee employee) {
        BeanUtils.copyProperties(this, employee, "allocationList");
        if (employee.getAllocationList() != null) {
            employee.getAllocationList().clear();
        } else {
            employee.setAllocationList(new ArrayList<>());
        }
        employee.getAllocationList().addAll(allocationList);

        return employee;
    }
}
