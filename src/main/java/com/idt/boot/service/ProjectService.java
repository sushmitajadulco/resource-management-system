package com.idt.boot.service;

import com.idt.boot.entity.Project;

import java.util.List;
import java.util.Optional;

public interface ProjectService {

    List<Project> findAll();

    Optional<Project> findById(final Long id);

    Project save(final Project project);

    void delete(final Long id);
}
