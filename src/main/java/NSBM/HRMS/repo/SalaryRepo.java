/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.repo;

import NSBM.HRMS.dto.EmpSalaryDTO;
import NSBM.HRMS.model.Salary;
import java.util.List;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author rusir
 */
public interface SalaryRepo extends CrudRepository<Salary, Integer> {

    @Query("SELECT (SELECT `name` FROM `user` u WHERE u.id = s.`emp_id`) AS emp_name,(SELECT `emp_no` FROM `user` u WHERE u.id = s.`emp_id`) AS emp_no,(SELECT `designation` FROM `user` u WHERE u.id = s.`emp_id`) AS designation,`basic_salary`,`allowances`,`tol_salary`,`deduction`,`net_salary` FROM `salary` s WHERE `emp_id` = :uid")
    List<EmpSalaryDTO> getSalariesByUserId(@Param("uid") Integer id);



}
