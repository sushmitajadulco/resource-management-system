package com.idt.boot.entity;

import javax.persistence.*;

@Table
@Entity(name = "employee")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "designationID", nullable = false)
    private Long designationID;

    @Column(name = "levelID", nullable = false)
    private Long levelID;

    @Column(name = "projectID", nullable = false)
    private Long projectID;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getDesignationID() {
        return designationID;
    }

    public void setDesignationID(Long designationID) {
        this.designationID = designationID;
    }

    public Long getLevelID() {
        return levelID;
    }

    public void setLevelID(Long levelID) {
        this.levelID = levelID;
    }

    public Long getProjectID() {
        return projectID;
    }

    public void setProjectID(Long projectID) {
        this.projectID = projectID;
    }
}
