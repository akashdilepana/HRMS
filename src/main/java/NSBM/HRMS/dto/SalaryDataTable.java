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
public class SalaryDataTable {

    public Integer id;
    public Integer empNo;
    public String empName;
    public Integer basicSalary;
    public Integer allowances;
    public Integer tolSalary;
    public Integer deduction;
    public Integer netSalary;
}
