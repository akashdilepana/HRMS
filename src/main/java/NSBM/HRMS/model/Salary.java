/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.relational.core.mapping.Table;

/**
 *
 * @author rusir
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Table("salary")
public class Salary {

    @Id
    private Integer id;
    private Integer empId;
    private Integer basicSalary;
    private Integer allowances;
    private Double tolSalary;
    private Integer deduction;
    private Double netSalary;
    @Transient
    private String empName;
    @Transient
    private String empNo;
    
}
