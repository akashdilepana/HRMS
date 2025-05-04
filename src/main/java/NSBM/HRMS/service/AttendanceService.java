/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.service;

import NSBM.HRMS.model.Attendance;
import NSBM.HRMS.repo.AttendanceRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author rusir
 */
@Service
public class AttendanceService {

    @Autowired
    AttendanceRepo repo;

    public Attendance saveAttendance(Attendance a1) {
        return repo.save(a1);
    }

    public Iterable<Attendance> getAllAttendances() {
        return repo.findAll();
    }
}
