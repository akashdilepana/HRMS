/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.controllers;

/**
 *
 * @author rusir
 */
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

//    @GetMapping("/")
//    public String index(HttpSession session) {
//        if (session.getAttribute("dashboard").equals("2")) {
//            return "dashboard";
//        } else if (session.getAttribute("dashboard").equals("1")) {
//            return "admin_dashboard";
//        } else {
//            return null;
//        }
//
//    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }  
}
