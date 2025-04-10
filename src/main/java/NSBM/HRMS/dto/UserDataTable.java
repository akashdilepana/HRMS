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
public class UserDataTable {
    
    public Integer id;
    public String username;
    public String name;
    public String userType;
    public String modBy;
    public String modOn;
    public String status;
    
}

