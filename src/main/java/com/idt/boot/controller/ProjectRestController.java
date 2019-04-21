package com.idt.boot.controller;


import com.idt.boot.dto.ProjectDto;
import com.idt.boot.entity.Project;
import com.idt.boot.exception.ResourceNotFoundException;
import com.idt.boot.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/project")
public class ProjectRestController {

    @Autowired
    private ProjectRepository projectRepository;

    @GetMapping("/list")
    public ResponseEntity<?> getAllProjects() {
        return new ResponseEntity<>(this.projectRepository.findAllByIsActiveOrderByIdDesc(true), HttpStatus.OK) ;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getProjectProfile(@PathVariable final Long id) {
        Project project = this.projectRepository.findById(id).orElseThrow(() ->
            new ResourceNotFoundException(Project.class, id)
        );

        return new ResponseEntity<>(project, HttpStatus.OK) ;
    }

    @PostMapping("delete/{id}")
    public ResponseEntity<?> delete(@PathVariable final Long id) throws ResourceNotFoundException {
        Project project = this.projectRepository.findById(id).orElseThrow(() ->
                new ResourceNotFoundException(Project.class, id)
        );

        project.setActive(false);
        projectRepository.save(project);
        return new ResponseEntity<>("Project deleted successfully.",HttpStatus.OK);
    }

    @PostMapping("/add")
    public ResponseEntity<?> createProject(@RequestBody final ProjectDto projectDto) {
        return new ResponseEntity<>(this.projectRepository.save(projectDto.toModel()), HttpStatus.OK);
    }

    @PutMapping("/edit/{id}")
    public ResponseEntity<?> updateProject(@PathVariable final Long id, @RequestBody final ProjectDto projectDto) {
        Project project = this.projectRepository.findById(id).orElseThrow(() ->
                new ResourceNotFoundException(Project.class, id)
        );

        return new ResponseEntity<>(this.projectRepository.save(projectDto.mergeChanges(project)), HttpStatus.OK);
    }
}
