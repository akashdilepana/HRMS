/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.controllers;

import NSBM.HRMS.datatable.DataTableRequest;
import NSBM.HRMS.datatable.DataTablesResponse;
import NSBM.HRMS.dto.GetPagesDTO;
import NSBM.HRMS.dto.UserDataTable;
import NSBM.HRMS.dto.UserTypeDataTable;
import NSBM.HRMS.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author rusir
 */
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService service;

    @PostMapping("/users")
    public DataTablesResponse<UserDataTable> getUsers(@RequestBody DataTableRequest param) throws Exception {
        return service.getUsers(param);
    }

    @PostMapping("/userType")
    public DataTablesResponse<UserTypeDataTable> getUserType(@RequestBody DataTableRequest param) throws Exception {
        return service.getUserType(param);
    }

    @PostMapping("/getpages")
    public GetPagesDTO getPage() throws Exception {
//    public Iterable<Page> getPage() throws Exception {
        return service.getPage();
    }

    @PostMapping("/get-userType")
    public GetPagesDTO getUserType(@RequestParam Integer id) throws Exception {
        return service.getSelectedPage(id);
    }

}
