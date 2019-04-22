package com.idt.boot.controller;


import com.idt.boot.service.JasperService;
import net.sf.jasperreports.engine.JRException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequestMapping("/api")
public class ReportRestController {

    @Autowired
    JasperService jasperService;

    @GetMapping("/report/export")
    public void export() throws IOException, JRException {
        jasperService.generateReport();
    }
}
