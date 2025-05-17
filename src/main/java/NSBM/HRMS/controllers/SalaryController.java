/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.controllers;

import NSBM.HRMS.datatable.DataTableRequest;
import NSBM.HRMS.datatable.DataTablesResponse;
import NSBM.HRMS.dto.SalaryDataTable;
import NSBM.HRMS.dto.UserDataTable;
import NSBM.HRMS.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author rusir
 */
@RestController
@RequestMapping("/salary")
public class SalaryController {

    @Autowired
    SalaryService service;

    @PostMapping("/getsheet")
    public DataTablesResponse<SalaryDataTable> getSalarys(@RequestBody DataTableRequest param) throws Exception {
        return service.getSalary(param);
    }
}
