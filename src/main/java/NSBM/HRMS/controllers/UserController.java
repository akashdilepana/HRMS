/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.controllers;

import NSBM.HRMS.service.UserService;
import NSBM.HRMS.model.User;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jdbc.core.mapping.AggregateReference;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author rusir
 */
@RestController
@RequestMapping("/allusers")
public class UserController {

    @Autowired
    UserService serv;

    @GetMapping
    public Iterable<User> getAllUsers() {
        return serv.getAllUsers();
    }

//    @GetMapping
//    public List<Map<String, Object>> getAllUsers() {
//       return serv.getAllUsers();
//    }
    @GetMapping("/{id}")
    public Object getAllUsers(@PathVariable Integer id) throws Exception {
        return serv.getUserById(id);
    }

    @GetMapping("/save")
    public User getUser(String username, String name, Integer utype) {
        User user = new User();
        user.setName(name);
        user.setUsername(username);
        user.setUserType(AggregateReference.to(utype));
        return serv.saveUser(user);
    }

}
