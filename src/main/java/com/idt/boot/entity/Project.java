package com.idt.boot.entity;


import javax.persistence.*;
import java.sql.Date;
import java.util.List;
import java.util.ArrayList;

@Table(name = "projects")
@Entity
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String percentage;

    @Column(name = "description")
    private String description;

    @Column(name = "startDate")
    private Date startDate;

    @Column(name = "endDate")
    private Date endDate;

    @Column(name = "allocation")
    private String allocation;
//
//    @OneToMany
//    private List<Allocation> allocations = new ArrayList<>();

}
