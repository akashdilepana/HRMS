/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.controllers;

import NSBM.HRMS.dto.NewEmpDTO;
import NSBM.HRMS.service.DashboardService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
@RequestMapping("/dashboard")
public class DashboardController {

    @Autowired
    DashboardService service;

    @PostMapping("/save-idea")
    public ResponseEntity<CommonResponse> saveIdea(@RequestParam String idea, @RequestParam Integer empNo) throws Exception {
        service.saveIdea(idea, empNo);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping({"/new-emp"})
    public Iterable<NewEmpDTO> showCount() throws Exception {
        return service.showNewEmp();
    }
}
