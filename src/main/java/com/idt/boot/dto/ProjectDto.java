package com.idt.boot.dto;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.FetchType;

import com.idt.boot.entity.Developer;


public class ProjectDto {

    private String name;

    private String description;
    
    private List<Developer> members = new ArrayList<>();

	public List<Developer> getMembers() {
		return members;
	}

	public void setMembers(List<Developer> members) {
		if (members == null) {
			members = new ArrayList<>();
		}
		this.members = members;
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
    
    
}

