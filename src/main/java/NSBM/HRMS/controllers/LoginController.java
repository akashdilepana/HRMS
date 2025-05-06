/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.controllers;

/**
 *
 * @author rusir
 */

import NSBM.HRMS.service.LoginService;
import NSBM.HRMS.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginController {

    @Autowired
    LoginService servr;

    @PostMapping("/login")
    public String checkLogin(@RequestParam String username, @RequestParam String password, HttpSession session) {

        User user = servr.checkLogin(username);
//        System.out.println(user);
        if (user == null) {
            return "error";
        } else {

            session.setAttribute("uid", user.getId());
            session.setAttribute("username", username);
            session.setAttribute("type", user.getUserType().getId());
            String dashboard = servr.getDashboard(user.getUserType().getId());
            session.setAttribute("dashboard", dashboard);

            return "ok";

        }

    }
}
