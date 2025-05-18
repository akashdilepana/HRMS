/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author rusir
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class EmpSalaryDTO {
    private String empName;
    private Integer empNo;
    private String designation;
    private Integer basicSalary;
    private Integer allowances;
    private Integer tolSalary;
    private Integer deduction;
    private Integer netSalary;
}
