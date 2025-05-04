/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.controllers;

import NSBM.HRMS.service.AttendanceService;
import NSBM.HRMS.model.Attendance;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author rusir
 */
@RestController
@RequestMapping("/attendance")
public class AttendanceController {

    @Autowired
    AttendanceService service;

    @PostMapping("/save")
    public Attendance saveAttendance(
            @RequestParam("date") String dateStr,
            @RequestParam(value = "intime", required = false) String intimeStr,
            @RequestParam(value = "outtime", required = false) String outtimeStr,
            @RequestParam(value = "leaveType", required = false) String leaveType,
            @RequestParam("type") String type,
            @RequestParam(value = "leaveReason", required = false) String leaveReason) {

        try {
            java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

            Attendance a1 = new Attendance();
            a1.setDate(utilDate);
            a1.setType(type);
            if (intimeStr != null && outtimeStr != null) {
                Time intime = Time.valueOf(intimeStr + ":00");
                Time outtime = Time.valueOf(outtimeStr + ":00");
                a1.setIntime(intime);
                a1.setOuttime(outtime);
            }

            if (leaveType != null) {
                a1.setLeaveType(leaveType);
            }
            if (leaveReason != null) {
                a1.setLeaveReason(leaveReason);
            }
            return service.saveAttendance(a1);
        } catch (ParseException e) {
            throw new RuntimeException("Invalid date format", e);
        }
    }

    @GetMapping("/list")
    public List<Map<String, Object>> getAllAttendancesForCalendar() {
        Iterable<Attendance> attendances = service.getAllAttendances();
        List<Map<String, Object>> events = new ArrayList<>();

        for (Attendance a : attendances) {
            Map<String, Object> event = new HashMap<>();

            if ("present".equalsIgnoreCase(a.getType())) {
                // If it's a Present entry
                String intime = (a.getIntime() != null) ? a.getIntime().toString() : "-";
                String outtime = (a.getOuttime() != null) ? a.getOuttime().toString() : "-";
                event.put("title", "IN: " + intime + " | OUT: " + outtime);
            } else if ("leave".equalsIgnoreCase(a.getType())) {
                // If it's a Leave entry
                String leaveType = (a.getLeaveType() != null) ? a.getLeaveType() : "Leave";
                String leaveReason = (a.getLeaveReason() != null) ? a.getLeaveReason() : "";
                event.put("title", "Leave: " + leaveType + (leaveReason.isEmpty() ? "" : " (" + leaveReason + ")"));
            } else {
                // Unknown type, fallback
                event.put("title", "Attendance");
            }

            event.put("start", a.getDate().toString()); // must be in yyyy-MM-dd format
            events.add(event);
        }

        return events;
    }

}
