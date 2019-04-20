package com.idt.boot.dto;

import com.idt.boot.entity.Project;
import org.springframework.beans.BeanUtils;

import java.time.LocalDate;

public class ProjectDto {

    private String name;

    private String description;
    
	private LocalDate startDate;

	private LocalDate endDate;

	public ProjectDto() {

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public Project toModel() {
		Project project = new Project();
		project.setName(name);
		project.setDescription(description);
		project.setStartDate(startDate);
		project.setEndDate(endDate);
		return project;
	}

	public Project mergeChanges(Project project) {
		BeanUtils.copyProperties(this, project);
		return project;
	}
}

