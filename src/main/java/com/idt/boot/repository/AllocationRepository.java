package com.idt.boot.repository;

import com.idt.boot.entity.Allocation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface AllocationRepository extends JpaRepository<Allocation, Long> {

    List<Allocation> findByProjectId(Long id);

    List<Allocation> findAllByStartDateLessThanEqualAndEndDateGreaterThanEqualAndEmployeeId(LocalDate endDate, LocalDate startDate,
                                                                                          Long id);


}
