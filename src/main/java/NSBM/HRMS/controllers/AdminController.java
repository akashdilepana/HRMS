/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.controllers;

import NSBM.HRMS.datatable.DataTableRequest;
import NSBM.HRMS.datatable.DataTablesResponse;
import NSBM.HRMS.dto.GetPagesDTO;
import NSBM.HRMS.dto.SlimSelectDTO;
import NSBM.HRMS.dto.UserDataTable;
import NSBM.HRMS.dto.UserTypeDataTable;
import NSBM.HRMS.model.Salary;
import NSBM.HRMS.service.AdminService;
import NSBM.HRMS.model.User;
import jakarta.servlet.http.HttpSession;
import java.time.Year;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    @GetMapping("/user/{id}")
    public User getUser(@PathVariable Integer id) throws Exception {
        return service.getUser(id);
    }
    @GetMapping("/salary/{id}")
    public Salary getSalary(@PathVariable Integer id) throws Exception {
        return service.getSalary(id);
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

    @PostMapping("/user-type-save")
    public ResponseEntity<CommonResponse> saveUserType(@RequestParam String name, @RequestParam String dashboard, @RequestParam String pages) throws Exception {
        service.saveUserType(name, dashboard, pages);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/user-type-update")
    public ResponseEntity<CommonResponse> updateUserType(@RequestParam Integer id, @RequestParam String name, @RequestParam String dashboard, @RequestParam String pages) throws Exception {
        service.updateUserType(id, name, dashboard, pages);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/save-user")
    public ResponseEntity<CommonResponse> saveUser(@RequestParam String username, @RequestParam String name, @RequestParam Integer type,@RequestParam String address,@RequestParam Integer tpno,@RequestParam String email,@RequestParam String password,@RequestParam Integer empno,@RequestParam Integer designation ) throws Exception {
        service.saveUser(name, username, type,address,tpno,email,password,empno,designation);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/save-salary")
    public ResponseEntity<CommonResponse> saveSalary(@RequestParam Integer basic, @RequestParam Integer allowance, @RequestParam Double total, @RequestParam Integer deduct, @RequestParam Double net, @RequestParam Integer emp) throws Exception {
        service.saveSalary(basic, allowance, total, deduct, net, emp);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/save-leave")
    public ResponseEntity<CommonResponse> saveleave(HttpSession session,@RequestParam String leaveYear, @RequestParam String leaveType, @RequestParam String from, @RequestParam String to, @RequestParam String comment, @RequestParam Integer emp) throws Exception {
        service.saveLeave(session,leaveYear, leaveType, from, to, comment, emp);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/update-salary")
    public ResponseEntity<CommonResponse> updateSalary(@RequestParam Integer basic, @RequestParam Integer allowance, @RequestParam Double total, @RequestParam Integer deduct, @RequestParam Double net, @RequestParam Integer emp) throws Exception {
        service.updateSalary(basic, allowance, total, deduct, net, emp);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
    
    @PostMapping("/update-user")
    public ResponseEntity<CommonResponse> saveUser(@RequestParam Integer id, @RequestParam String username, @RequestParam String name, @RequestParam Integer type,@RequestParam String address,@RequestParam Integer tpno,@RequestParam String email,@RequestParam String password,@RequestParam Integer empno,@RequestParam Integer designation) throws Exception {
        service.updateUser(id, name, username, type,address,tpno,email,password,empno,designation);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/deactivate-user")
    public ResponseEntity<CommonResponse> deactivateUser(@RequestParam Integer id) throws Exception {
        service.deactivateUser(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/reactivate-user")
    public ResponseEntity<CommonResponse> reactivateUser(@RequestParam Integer id) throws Exception {
        service.reactivateUser(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/deactivate-user-Type")
    public ResponseEntity<CommonResponse> deactivateUserType(@RequestParam Integer id) throws Exception {
        service.deactivateUserType(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/reactivate-user-Type")
    public ResponseEntity<CommonResponse> reactivateUserType(@RequestParam Integer id) throws Exception {
        service.reactivateUserType(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/search-dashboard")
    public Iterable<SlimSelectDTO> searchDashboard(@RequestParam String search) throws Exception {
        return service.getDashboard(search);
    }

    @PostMapping("/get-userType")
    public GetPagesDTO getUserType(@RequestParam Integer id) throws Exception {
        return service.getSelectedPage(id);
    }

    @PostMapping("/search-user-types")
    public Iterable<SlimSelectDTO> searchUserTypes(@RequestParam String search) throws Exception {
        return service.getUserTypeIdAndName(search);
    }
    
    @PostMapping("/search-emp")
    public Iterable<SlimSelectDTO> searchEmp(@RequestParam String search) throws Exception {
        return service.getEmpIdAndName(search);
    }
    
    @PostMapping("/search-user-designation")
    public Iterable<SlimSelectDTO> searchUserDesignation(@RequestParam String search) throws Exception {
        return service.getUserDesignationIdAndName(search);
    }
}
