/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.service;

import NSBM.HRMS.dto.NewEmpDTO;
import NSBM.HRMS.model.Idea;
import NSBM.HRMS.repo.IdeaRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author rusir
 */
@Service
public class DashboardService {

    @Autowired
    IdeaRepo repo;

    public Idea saveIdea(String idea, Integer empNo) throws Exception {
        Idea idea1 = new Idea();;
        idea1.setIdea(idea);
        idea1.setEmpNo(empNo);
        idea1 = repo.save(idea1);
        return idea1;
    }

    public Iterable<NewEmpDTO> showNewEmp() {

        return repo.getNewEmp();
    }
}
