/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.service;

import NSBM.HRMS.repo.PageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author rusir
 */
@Service
public class PageService {

    @Autowired
    PageRepo repo;

    public String getPagesForUser(String userId) {
        // Get pages for the user
        String pages = repo.getAllPages(userId);
//        System.out.println(pages);

        return pages;
    }
}
