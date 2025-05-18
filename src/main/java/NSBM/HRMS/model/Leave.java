/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.model;

import java.time.Year;
import java.util.Date;
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
@Table("leave")
public class Leave {

    @Id
    private Integer id;
    private Integer empId;
    private String leaveYear;
    private String leaveType;
    private String fromDate;
    private String toDate;
    private String comments;
    private Integer approver;
    @Transient
    private String empName;
    @Transient
    private String empNo;

}
