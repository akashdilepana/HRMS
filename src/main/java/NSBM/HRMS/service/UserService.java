/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.service;

import NSBM.HRMS.model.User;
import NSBM.HRMS.repo.UserRepo;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

/**
 *
 * @author rusir
 */
@Service
public class UserService {

    @Autowired
    JdbcTemplate jdbc;

    @Autowired
    UserRepo repo;

    @Autowired
    ObjectMapper mapper;

    public Iterable<User> getAllUsers() {
        return repo.findAll();
    }
//    public List<Map<String, Object>> getAllUsers() {
//       return jdbc.queryForList("select * from user");
//    }

    public Map<String, Object> getUserById(Integer id) {
        return jdbc.queryForMap("select * from user where id=?", id);
    }

//    public Object getUserById(Integer id)throws Exception{
//        Map<String, Object> map = jdbc.queryForMap("select username,ent_on as entOn from user where id=?",id);
//       
//      return mapper.convertValue(map, User.class);
//    }
    public User saveUser(User user) {

        return repo.save(user);
    }
}
