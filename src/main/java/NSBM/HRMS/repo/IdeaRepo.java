/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.repo;

import NSBM.HRMS.dto.NewEmpDTO;
import NSBM.HRMS.model.Idea;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author rusir
 */
public interface IdeaRepo extends CrudRepository<Idea, Integer> {

    @Query("SELECT `name`,`designation`,`department`,DATE_FORMAT(`ent_on`, '%e %M %Y') AS ent_date FROM `user` ORDER BY `ent_on` DESC LIMIT 3;")
    Iterable<NewEmpDTO> getNewEmp();
}
