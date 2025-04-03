/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.repo;

/**
 *
 * @author rusir
 */

import NSBM.HRMS.model.User;
import java.util.Optional;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends CrudRepository<User, Integer> {

    @Query("SELECT `id` FROM `user` WHERE `username`=:username")
    Integer getUserDetailsByUsername(@Param("username") String username);

    Optional<User> findByUsername(String username);

}