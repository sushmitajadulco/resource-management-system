package com.idt.boot.service.impl;


import com.idt.boot.entity.Project;
import com.idt.boot.repository.ProjectRepository;
import com.idt.boot.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectRepository projectRepository;

    @Override
    public List<Project> findAll() {
        return this.projectRepository.findAll();
    }

    @Override
    public Optional<Project> findById(Long id) {
        return this.projectRepository.findById(id);
    }

    @Override
    @Transactional
    public Project save(Project project) {
        return this.projectRepository.save(project);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        this.projectRepository.deleteById(id);
    }
}
