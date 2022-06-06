package service;

import model.Customer;
import model.Employee;

import java.util.List;
import java.util.Map;

public interface IEmployeeService {

    List<Employee> findEmployee(String key);

    List<Employee> selectAllEmployee();

    Map<String, String> createEmployee(Employee employee);

    Map<String, String>  updateEmployee(Employee employee);

    boolean deleteEmployeeById(Integer id);

    public Map<Integer,String> getPositon();

    public Map<Integer,String> getEducation();

    public Map<Integer,String> getDivision();

}
