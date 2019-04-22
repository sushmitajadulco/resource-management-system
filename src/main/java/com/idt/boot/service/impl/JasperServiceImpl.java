package com.idt.boot.service.impl;


import com.idt.boot.repository.AllocationRepository;
import com.idt.boot.repository.EmployeeRepository;
import com.idt.boot.service.JasperService;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

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
            inputStream = this.getClass().getResourceAsStream("/jrxml/allocation-report.jrxml");
            dataSource = new JRBeanCollectionDataSource(allocationRepository.findAll());

            export(inputStream, dataSource);

        } catch (JRException e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
        }
    }

    @Override
    public void export(InputStream inputStream, JRBeanCollectionDataSource dataSource) throws JRException {
        try {
            Map<String, Object> parameters = new HashMap<>();


            String months [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
                                "Nov", "Dec"};

            List<String> reportMonths = new ArrayList();
            Date today = new Date();
            Calendar cal =  Calendar.getInstance();
            cal.setTime(today);
            int curr_month = cal.get(Calendar.MONTH);
            for(int i = curr_month; i<= curr_month+3; i++) {
                reportMonths.add(months[i]);
            }

            List<String> allocationList = new ArrayList();
            List<String> totalAllocations = new ArrayList();

            parameters.put("monthList", reportMonths);

            JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);

            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);


        } catch ( JRException e) {
            throw(e);
        }

    }


    public void exportToPdf(String fileName, JasperPrint jasperPrint) throws JRException {
        try {
            JasperExportManager.exportReportToPdfFile(jasperPrint, "reports/" + fileName + ".pdf");
        } catch ( JRException e) {
            throw(e);
        }
    }
}
