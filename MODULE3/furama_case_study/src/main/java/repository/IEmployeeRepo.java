package repository;

import model.Customer;
import model.Employee;

import java.util.List;
import java.util.Map;

public interface IEmployeeRepo {

    List<Employee> findEmployee(String key);

    List<Employee> selectAllEmployee();

    void createEmployee(Employee employee);

    void  updateEmployee(Employee employee);

    boolean deleteEmployeeById(Integer id);

    boolean createAccountforEmployee(Employee employee);

    public Map<Integer,String> getPositon();

    public Map<Integer,String> getEducation();

    public Map<Integer,String> getDivision();
}
