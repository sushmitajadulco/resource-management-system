package com.idt.boot.service;


import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import java.io.IOException;
import java.io.InputStream;

public interface JasperService {

    public void generateReport() throws IOException;

    public void export(InputStream inputStream, JRBeanCollectionDataSource dataSource);
}
