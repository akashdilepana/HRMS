/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.service;

import NSBM.HRMS.model.User;
import NSBM.HRMS.model.UserType;
import NSBM.HRMS.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author rusir
 */
@Service
public class LoginService {
    @Autowired
    UserRepo serv;
    

    public User checkLogin(String username) {
        return serv.findByUsername(username).orElse(null);
    }

//    public String getDashboard(Integer userTypeId) {
//        return ut.findById(userTypeId).get().getDashboard();
//    }
}
