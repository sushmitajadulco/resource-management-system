package com.idt.boot.dto;

import com.idt.boot.common.AllocationPercentage;
import com.idt.boot.entity.Allocation;
import com.idt.boot.entity.Employee;
import com.idt.boot.entity.Project;
import org.springframework.beans.BeanUtils;

import java.time.LocalDate;

public class AllocationDto {

    private LocalDate startDate;
    private LocalDate endDate;
    private AllocationPercentage percentage;
    private Long projectId;
    private Long employeeId;

    public AllocationDto() {

    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public AllocationPercentage getPercentage() {
        return percentage;
    }

    public void setPercentage(AllocationPercentage percentage) {
        this.percentage = percentage;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Allocation toModel() {
        Allocation allocation = new Allocation();
        allocation.setStartDate(startDate);
        allocation.setEndDate(endDate);
        allocation.setPercentage(percentage);

        return allocation;
    }

    public Allocation mergeChanges(Allocation allocation) {
        BeanUtils.copyProperties(this, allocation);

        return allocation;
    }
}
