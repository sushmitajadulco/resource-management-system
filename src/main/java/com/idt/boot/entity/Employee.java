package com.idt.boot.entity;

import javax.persistence.*;

@Table
@Entity(name = "employees")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "designationID", nullable = false)
    private Long designation;

    @Column(name = "levelID", nullable = false)
    private Long level;

    @Column(name = "projectID", nullable = false)
    private Long project;


}
