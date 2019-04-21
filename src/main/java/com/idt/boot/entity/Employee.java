package com.idt.boot.entity;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.List;

@Table
@Entity(name = "employee")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "middle_name")
    private String middleName;

    @Column(name = "email")
    private String email;

    @ManyToOne
    @JoinColumn(name = "designation_id")
    private Designation designation;

    @ManyToOne
    @JoinColumn(name = "level_id")
    private Level level;

    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private List<Allocation> allocationList;

    @Column(name = "is_employed")
    @Type(type = "yes_no")
    private Boolean isEmployed = true;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public Designation getDesignation() {
        return designation;
    }

    public void setDesignation(Designation designation) {
        this.designation = designation;
    }

    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public List<Allocation> getAllocationList() {
        return allocationList;
    }

    public Boolean getEmployed() {
        return isEmployed;
    }

    public void setEmployed(Boolean employed) {
        isEmployed = employed;
    }

    public void setAllocationList(List<Allocation> allocationList) {
        this.allocationList = allocationList;
    }

    @Override
    public String toString() {
        return this.firstName + " " + this.middleName + ", " + this.lastName;
    }
}
