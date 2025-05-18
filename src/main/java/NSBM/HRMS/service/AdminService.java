/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.service;

import NSBM.HRMS.datatable.DataTableRepo;
import NSBM.HRMS.datatable.DataTableRequest;
import NSBM.HRMS.datatable.DataTablesResponse;
import NSBM.HRMS.dto.GetPagesDTO;
import NSBM.HRMS.dto.SlimSelectDTO;
import NSBM.HRMS.dto.UserDataTable;
import NSBM.HRMS.dto.UserTypeDataTable;
import NSBM.HRMS.repo.PageRepo;
import NSBM.HRMS.model.UserType;
import NSBM.HRMS.model.User;
import NSBM.HRMS.repo.UserDesignationRepo;
import NSBM.HRMS.repo.UserRepo;
import NSBM.HRMS.repo.UserTypeRepo;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jdbc.core.mapping.AggregateReference;
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
    UserTypeRepo userTypeRepo;

    @Autowired
    UserRepo userRepo;
    
    @Autowired
    UserDesignationRepo userDesignationRepo;

    @Autowired
    private DataTableRepo<UserDataTable> userDt;

    @Autowired
    private DataTableRepo<UserTypeDataTable> userTypeDt;

    public DataTablesResponse<UserDataTable> getUsers(DataTableRequest param) throws Exception {
        return userDt.getData(UserDataTable.class, param, "select `id`,`username`,`name`,(select `name` from `user_type` where `id`=u.`user_type`) as `userType`,(select `username` from `user` where `id`=u.`mod_by`) as `ModBy`,`mod_on`,`status` FROM `user` u WHERE true ");
    }

    public User getUser(Integer id) throws Exception {
        User user = userRepo.findById(id).get();
        UserType utype = userTypeRepo.findById(user.getUserType().getId()).get();
        user.setUserTypeName(utype.getName());
        return user;
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

    public UserType saveUserType(String name, String dashboard, String pages) throws Exception {

        List<Integer> pageNumbers = Arrays.asList(new ObjectMapper().readValue(pages, Integer[].class));

        String pagesJson = new ObjectMapper().writeValueAsString(pageNumbers);

        UserType page = new UserType();
        page.setDashboard(dashboard);
        page.setName(name);
        page.setPages(pagesJson);
        page.setStatus("active");

        page = userTypeRepo.save(page);

        return page;

    }

    public UserType updateUserType(Integer id, String name, String dashboard, String pages) throws Exception {

        List<Integer> pageNumbers = Arrays.asList(new ObjectMapper().readValue(pages, Integer[].class));

        String pagesJson = new ObjectMapper().writeValueAsString(pageNumbers);

        UserType page = userTypeRepo.findById(id).get();
        page.setDashboard(dashboard);
        page.setName(name);
        page.setPages(pagesJson);
        page.setStatus("active");

        page = userTypeRepo.save(page);

        return page;

    }

    public User saveUser(String name, String username, Integer userType,String address,Integer tpno,String email,String password,Integer empno,Integer designation) throws Exception {
        User user = new User();
        user.setUsername(username);
        user.setName(name);
        user.setUserType(AggregateReference.to(userType));
        user.setAddress(address);
        user.setMobile(tpno);
        user.setEmail(email);
        user.setPassword(password);
        user.setEmpNo(empno);
        user.setDesignation(AggregateReference.to(designation));
        user.setStatus("active");
        user = userRepo.save(user);
        return user;
    }

    public User updateUser(Integer id, String name, String username, Integer userType,String address,Integer tpno,String email,String password,Integer empno,Integer designation) throws Exception {
        User user = userRepo.findById(id).get();
        user.setUsername(username);
        user.setName(name);
        user.setUserType(AggregateReference.to(userType));
        user.setAddress(address);
        user.setMobile(tpno);
        user.setEmail(email);
        user.setPassword(password);
        user.setEmpNo(empno);
        user.setDesignation(AggregateReference.to(designation));
        user = userRepo.save(user);
        return user;
    }

    public UserType deactivateUserType(Integer id) throws Exception {
        UserType utype = userTypeRepo.findById(id).get();
        utype.setStatus("deactivated");
        utype = userTypeRepo.save(utype);
        return utype;
    }

    public UserType reactivateUserType(Integer id) throws Exception {
        UserType utype = userTypeRepo.findById(id).get();
        utype.setStatus("active");
        utype = userTypeRepo.save(utype);
        return utype;
    }

    public User deactivateUser(Integer id) throws Exception {
        User user = userRepo.findById(id).get();
        user.setStatus("deactivated");
        user = userRepo.save(user);
        return user;
    }

    public User reactivateUser(Integer id) throws Exception {
        User user = userRepo.findById(id).get();
        user.setStatus("active");
        user = userRepo.save(user);
        return user;
    }

    public Iterable<SlimSelectDTO> getDashboard(String search) {
        return userTypeRepo.getDashboard("%" + search.trim() + "%");
    }

    public Iterable<SlimSelectDTO> getUserTypeIdAndName(String search) {
        return userTypeRepo.getIdAndName("%" + search.trim() + "%");
    }
    public Iterable<SlimSelectDTO> getUserDesignationIdAndName(String search) {
        return userDesignationRepo.getIdAndName("%" + search.trim() + "%");
    }
}
