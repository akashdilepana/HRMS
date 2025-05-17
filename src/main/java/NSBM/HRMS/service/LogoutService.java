/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.service;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

/**
 *
 * @author rusir
 */
@Service
public class LogoutService {

    public void logout(HttpSession session, HttpServletResponse resp) {
        try {
            session.removeAttribute("uid");
            resp.sendRedirect("login");
        } catch (Exception e) {
        }

    }
}
