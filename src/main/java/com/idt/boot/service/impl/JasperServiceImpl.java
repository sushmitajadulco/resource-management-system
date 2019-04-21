package com.idt.boot.service.impl;


import com.idt.boot.repository.AllocationRepository;
import com.idt.boot.repository.EmployeeRepository;
import com.idt.boot.service.JasperService;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;

@Service
public class JasperServiceImpl implements JasperService {

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    AllocationRepository allocationRepository;


    @Override
    public void generateReport() throws IOException {

        JRBeanCollectionDataSource dataSource = null;
        InputStream inputStream = null;

        try{
            inputStream = this.getClass().getResourceAsStream("/jrxml/available-resources-report.jrxml");
            dataSource = new JRBeanCollectionDataSource(allocationRepository.findAll());

            export(inputStream, dataSource);

        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
        }
    }

    @Override
    public void export(InputStream inputStream, JRBeanCollectionDataSource dataSource) {

    }
}
