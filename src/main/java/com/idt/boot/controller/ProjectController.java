package com.idt.boot.controller;

import com.idt.boot.dto.ProjectDto;
import com.idt.boot.entity.Project;
import com.idt.boot.exception.ResourceNotFoundException;
import com.idt.boot.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import javax.transaction.Transactional;

//@RestController
//@RequestMapping("/projects")
public class ProjectController {

//    @Autowired
//    private ProjectRepository projectRepository;
//
//    @GetMapping
//    public List<Project> findAll() {
//        return this.projectRepository.findAll();
//    }
//
//    @GetMapping("/{id}")
//    public Project findById(@PathVariable final Long id) throws ResourceNotFoundException {
//        return this.projectRepository.findById(id)
//                .orElseThrow(ResourceNotFoundException::new);
//    }
//
//    @PostMapping
//    public Project create(@RequestBody final ProjectDto projectDto) {
//        Project project = new Project();
//
//        project.setName(projectDto.getName());
//        project.setDescription(projectDto.getDescription());
//        project.setMembers(projectDto.getMembers());
//
//        return this.projectRepository.save(project);
//    }
//
//    @PutMapping("/{id}")
//    public Project update(@PathVariable Long id, @RequestBody final ProjectDto projectDto) throws ResourceNotFoundException {
//        Project project = this.projectRepository.findById(id).orElseThrow(ResourceNotFoundException::new);
//
//        project.setName(projectDto.getName());
//        project.setDescription(projectDto.getDescription());
//        project.setMembers(projectDto.getMembers());
//
//        return this.projectRepository.save(project);
//    }

//    @DeleteMapping("/{id}")
//    public void deleteById(@PathVariable final Long id) throws ResourceNotFoundException {
//        this.projectRepository.findById(id).orElseThrow(ResourceNotFoundException::new);
//
//        this.projectRepository.deleteById(id);
//    }

}
