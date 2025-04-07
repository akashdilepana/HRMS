/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.controllers;

/**
 *
 * @author rusir
 */
import NSBM.HRMS.service.PageService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PageController {

    @GetMapping("/")
    public String index(HttpSession session) {
        System.out.println(session.getAttribute("dashboard"));
        if (session.getAttribute("dashboard").equals("userDashboard")) {
            return "userDashboard";
        } else if (session.getAttribute("dashboard").equals("adminDashboard")) {
            return "adminDashboard";
        } else {
            return null;
        }

    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @Autowired
    PageService ser;

    @GetMapping("/pages")
    @ResponseBody
    public String getPages(HttpSession session) {
//        return ser.getPagesForUser(2 + "");
        Integer uid = (Integer) session.getAttribute("uid");
        return ser.getPagesForUser(uid.toString());
    }

    @GetMapping("/index")
    public String dashboard(HttpSession session) {
        return index(session);
    }
//     @GetMapping("/users")
//    public String users() {
//        return "user";
//    }
}
