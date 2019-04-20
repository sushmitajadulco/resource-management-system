package com.idt.boot.repository;

import com.idt.boot.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectRepository  extends JpaRepository<Project, Long> {

    List<Project> findAllByIsActiveOrderByIdDesc(Boolean isActive);
}
