/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.service;

import NSBM.HRMS.datatable.DataTableRepo;
import NSBM.HRMS.datatable.DataTableRequest;
import NSBM.HRMS.datatable.DataTablesResponse;
import NSBM.HRMS.dto.EmpSalaryDTO;
import NSBM.HRMS.dto.SalaryDataTable;
import NSBM.HRMS.dto.UserDataTable;
import NSBM.HRMS.dto.UserTypeDataTable;
import NSBM.HRMS.model.Salary;
import NSBM.HRMS.repo.SalaryRepo;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author rusir
 */
@Service
public class SalaryService {

    @Autowired
    private DataTableRepo<SalaryDataTable> salaryDt;

    @Autowired
    SalaryRepo repo;

    public DataTablesResponse<SalaryDataTable> getSalary(DataTableRequest param) throws Exception {
        return salaryDt.getData(SalaryDataTable.class, param, "SELECT `id`,(SELECT `emp_no` FROM `user` WHERE `id` = s.`emp_id`) AS emp_no,(SELECT `name` FROM `user` WHERE `id` = s.`emp_id`) AS empName,`basic_salary`,`allowances`,`tol_salary`,`deduction`,`net_salary` FROM `salary` s WHERE TRUE");
    }

    public Optional<Salary> getEmpSalary(Integer uid) {
        return repo.findById(uid);
    }

    public List<EmpSalaryDTO> getSalaries(Integer empId) {
        return repo.getSalariesByUserId(empId);
    }

}
