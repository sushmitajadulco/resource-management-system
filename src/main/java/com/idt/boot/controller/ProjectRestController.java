package com.idt.boot.controller;


import com.idt.boot.dto.ProjectDto;
import com.idt.boot.entity.Project;
import com.idt.boot.exception.ResourceNotFoundException;
import com.idt.boot.repository.ProjectRepository;
import com.idt.boot.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Optional;

@RestController
@RequestMapping("api/project")
public class ProjectRestController {

    @Autowired
    private ProjectService projectService;

    @GetMapping("/list")
    public ResponseEntity<?> getAllProjects() {

        return new ResponseEntity<>(this.projectService.findAll(), HttpStatus.OK) ;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getProjectProfile(@PathVariable final Long id) throws ResourceNotFoundException {
        Project project = this.projectService.findById(id).orElseThrow(ResourceNotFoundException::new);

        return new ResponseEntity<>(project, HttpStatus.OK) ;
    }

    @PostMapping("delete/{id}")
    public ResponseEntity<?> delete(@PathVariable final Long id) {
        this.projectService.delete(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("delete/{id}")
    public ResponseEntity<?> deleteProject(@PathVariable final Long id) {
        this.projectService.delete(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/add")
    public ResponseEntity<?> createProject(@RequestBody final ProjectDto projectDto) {
        Project project = new Project();

        project.setName(projectDto.getName());
        project.setDescription(projectDto.getDescription());
        project.setStartDate(projectDto.getStartDate());
        project.setEndDate(projectDto.getEndDate());

        return new ResponseEntity<>(this.projectService.save(project), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateProject(@PathVariable Long id, @RequestBody final ProjectDto projectDto ) throws ResourceNotFoundException {
        Project project = this.projectService.findById(id).orElseThrow(ResourceNotFoundException::new);

        project.setName(projectDto.getName());
        project.setDescription(projectDto.getDescription());
        project.setStartDate(projectDto.getStartDate());
        project.setEndDate(projectDto.getEndDate());

        return new ResponseEntity<>(this.projectService.save(project), HttpStatus.OK);
    }



}
