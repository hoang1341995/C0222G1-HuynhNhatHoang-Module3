package service.impl;

import model.Customer;
import model.Employee;
import repository.IEmployeeRepo;
import repository.impl.EmployeeRepo;
import service.IEmployeeService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import static utils.regex.*;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepo employeeRepo = new EmployeeRepo();
    @Override
    public List<Employee> findEmployee(String key) {
        List<Employee> employeeList = employeeRepo.findEmployee(key);
        List<Employee> employeeList2 = new ArrayList<>();
        Map<Integer,String> divisionMap = employeeRepo.getDivision();
        for (Employee employees: employeeList){
            if (employees.getName().toLowerCase().contains(key.toLowerCase())||
                    employees.getAddress().toLowerCase().contains(key.toLowerCase())||
                    employees.getIdCard().toLowerCase().contains(key.toLowerCase())||
                    employees.getDivisionValue().toLowerCase().contains(key.toLowerCase())||
                    employees.getEducationValue().toLowerCase().contains(key.toLowerCase())||
                    employees.getPositionValue().toLowerCase().contains(key.toLowerCase())||
                    employees.getPhone().toLowerCase().contains(key.toLowerCase())||
                    employees.getEmail().toLowerCase().contains(key.toLowerCase())){
                employeeList2.add(employees);
            }
        }
        return employeeList2;
    }

    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepo.selectAllEmployee();
    }

    @Override
    public Map<String, String> createEmployee(Employee employee) {
        Map<String, String> mapRegexAddEmployee = new HashMap<>();
        boolean flag = true;
        if (!Pattern.matches(REGEX_NAME,employee.getName())){
            flag = false;
            mapRegexAddEmployee.put("name","Tên phải viết hoa chữ cái đầu. (vd: Nhật Hoàng)");
        }
        if (!Pattern.matches(REGEX_NUMBER,employee.getIdCard())){
            flag = false;
            mapRegexAddEmployee.put("idCard","CMND phải là số.");
        }
        if (!Pattern.matches(REGEX_PHONE,employee.getPhone())){
            flag = false;
            mapRegexAddEmployee.put("phone","Sai định dạng số điện thoại (vd: 84|09|08)");
        }
        if (!Pattern.matches(REGEX_EMAIL,employee.getEmail())){
            flag = false;
            mapRegexAddEmployee.put("email","Sai định dạng email (vd: hoang@gmail.com)");
        }
        if (employee.getBirthday().equals("")){
            flag = false;
            mapRegexAddEmployee.put("birthday","Chưa nhập ngày sinh");
        }
        if (employee.getSalary()<=0){
            flag = false;
            mapRegexAddEmployee.put("salary","Lương phải là số dương");
        }
        if (employee.getAddress().equals("")){
            flag = false;
            mapRegexAddEmployee.put("address","Chưa nhập địa chỉ");
        }
        if (employee.getUsername().equals("")){
            flag = false;
            mapRegexAddEmployee.put("username","Chưa nhập tên tài khoản");
        }
        if (employee.getPassword().equals("")){
            flag = false;
            mapRegexAddEmployee.put("password","Chưa nhập mật khẩu");
        }
        if (flag){
            if (!employeeRepo.createAccountforEmployee(employee)){
                flag = false;
                mapRegexAddEmployee.put("username","Tên tài khoản đã tồn tại");
            }
        }

        if (flag){
            employeeRepo.createEmployee(employee);
        }
        return mapRegexAddEmployee;
    }

    @Override
    public Map<String, String> updateEmployee(Employee employee) {
        Map<String, String> mapRegexUpdateEmployee = new HashMap<>();
        boolean flag = true;
        if (!Pattern.matches(REGEX_NAME,employee.getName())){
            flag = false;
            mapRegexUpdateEmployee.put("name","Tên phải viết hoa chữ cái đầu. (vd: Nhật Hoàng)");
        }
        if (!Pattern.matches(REGEX_NUMBER,employee.getIdCard())){
            flag = false;
            mapRegexUpdateEmployee.put("idCard","CMND phải là số.");
        }
        if (!Pattern.matches(REGEX_PHONE,employee.getPhone())){
            flag = false;
            mapRegexUpdateEmployee.put("phone","Sai định dạng số điện thoại (vd: 84|09|08)");
        }
        if (!Pattern.matches(REGEX_EMAIL,employee.getEmail())){
            flag = false;
            mapRegexUpdateEmployee.put("email","Sai định dạng email (vd: hoang@gmail.com)");
        }
        if (employee.getBirthday().equals("")){
            flag = false;
            mapRegexUpdateEmployee.put("birthday","Chưa nhập ngày sinh");
        }
        if (employee.getSalary()<=0){
            flag = false;
            mapRegexUpdateEmployee.put("salary","Lương phải là số dương");
        }
        if (employee.getAddress().equals("")){
            flag = false;
            mapRegexUpdateEmployee.put("address","Chưa nhập địa chỉ");
        }
        if (flag){
            employeeRepo.updateEmployee(employee);
        }
        return mapRegexUpdateEmployee;
    }

    @Override
    public boolean deleteEmployeeById(Integer id) {
        return employeeRepo.deleteEmployeeById(id);
    }

    @Override
    public Map<Integer, String> getPositon() {
        return employeeRepo.getPositon();
    }

    @Override
    public Map<Integer, String> getEducation() {
        return employeeRepo.getEducation();
    }

    @Override
    public Map<Integer, String> getDivision() {
        return employeeRepo.getDivision();
    }
}
