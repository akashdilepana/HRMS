/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.repo;

import NSBM.HRMS.dto.SlimSelectDTO;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import NSBM.HRMS.model.UserType;

/**
 *
 * @author rusir
 */
@Repository
public interface UserTypeRepo extends CrudRepository<UserType, Integer>{
    
    @Query("select `id` as `value`,`name` as `text` from `user_type` where `name` like :search order by `name` limit 20")
    Iterable<SlimSelectDTO> getIdAndName(@Param("search") String search);
    
    @Query("SELECT `id` AS `value`,`name` AS `text` FROM `dashboard` WHERE `name` like :search ORDER BY `name` LIMIT 20")
    Iterable<SlimSelectDTO> getDashboard(@Param("search") String search);
    
}
