/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.repo;

import NSBM.HRMS.model.Attendance;
import java.sql.Time;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author rusir
 */
@Repository
public interface AttendanceRepo extends CrudRepository<Attendance, Integer> {

//    Optional<Attendance> findByDateAndIntime(java.sql.Date date, Time intime);
}
