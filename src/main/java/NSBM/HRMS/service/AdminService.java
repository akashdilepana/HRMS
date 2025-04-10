/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.service;

import NSBM.HRMS.datatable.DataTableRepo;
import NSBM.HRMS.datatable.DataTableRequest;
import NSBM.HRMS.datatable.DataTablesResponse;
import NSBM.HRMS.dto.GetPagesDTO;
import NSBM.HRMS.dto.UserDataTable;
import NSBM.HRMS.dto.UserTypeDataTable;
import NSBM.HRMS.repo.PageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author rusir
 */
@Service
public class AdminService {

    @Autowired
    PageRepo pageRepo;

    @Autowired
    private DataTableRepo<UserDataTable> userDt;

    @Autowired
    private DataTableRepo<UserTypeDataTable> userTypeDt;

    public DataTablesResponse<UserDataTable> getUsers(DataTableRequest param) throws Exception {
        return userDt.getData(UserDataTable.class, param, "select `id`,`username`,`name`,(select `name` from `user_type` where `id`=u.`user_type`) as `userType`,(select `username` from `user` where `id`=u.`mod_by`) as `ModBy`,`mod_on`,`status` FROM `user` u WHERE true ");
    }

    public DataTablesResponse<UserTypeDataTable> getUserType(DataTableRequest param) throws Exception {
        return userTypeDt.getData(UserTypeDataTable.class, param, "SELECT `id`,`name`,`dashboard`,(SELECT `username` FROM `user` WHERE `id`=u.`mod_by`) AS `mod_by`,`mod_on`,`status` FROM `user_type` u WHERE TRUE ");
    }

    public GetPagesDTO getPage() {
//    public Iterable<Page> getPage() {
        System.out.println(pageRepo.getPage());
        return pageRepo.getPage();
    }

    public GetPagesDTO getSelectedPage(Integer id) {
//    public Iterable<Page> getPage() {
        return pageRepo.getSelectedPage(id);
    }
}
