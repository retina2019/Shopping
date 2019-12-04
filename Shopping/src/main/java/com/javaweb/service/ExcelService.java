package com.javaweb.service;

import javax.servlet.ServletOutputStream;

public interface ExcelService {
    public void export(String[] titles, ServletOutputStream out)throws Exception;
}
