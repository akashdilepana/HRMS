/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.repo;

import NSBM.HRMS.model.Leave;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author rusir
 */
public interface LeaveRepo extends CrudRepository<Leave, Integer> {
    
}
