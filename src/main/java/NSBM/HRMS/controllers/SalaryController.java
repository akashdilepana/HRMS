/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.controllers;

import NSBM.HRMS.datatable.DataTableRequest;
import NSBM.HRMS.datatable.DataTablesResponse;
import NSBM.HRMS.dto.EmpSalaryDTO;
import NSBM.HRMS.dto.SalaryDataTable;
import NSBM.HRMS.dto.UserDataTable;
import NSBM.HRMS.model.Salary;
import NSBM.HRMS.service.SalaryService;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping("/empSalary")
    public ResponseEntity<?> getEmployeeSalary(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("uid"); // ✅ lowercase "uid"

        if (userId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged in");
        }

        List<EmpSalaryDTO> salaryList = service.getSalaries(userId);
        return ResponseEntity.ok(salaryList);
    }
    
//        public Iterable<NewEmpDTO> showNewEmp() {
//
//        return repo.getNewEmp();
//    }

}
