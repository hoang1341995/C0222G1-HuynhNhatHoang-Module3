package repository.impl;

import model.Customer;
import model.Employee;
import repository.DAO;
import repository.IEmployeeRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeRepo implements IEmployeeRepo {
    private static final String SELECT_ALL_EMPLOYEE = "SELECT * FROM employee WHERE employee_delete = 0;";
    private static final String CREATE_ACCOUNT_FOR_EMPLOYEE = "insert into `user` (`username`,`password`) values(?,?);";
    private static final String FIND_EMPLOYEE = "SELECT *,ps.position_name,education_degree_name,division_name FROM database_furama_danang.employee e " +
            " join position ps on ps.position_id = e.position_id " +
            " join education_degree ed on ed.education_degree_id = e.education_degree_id " +
            " join division dv on dv.division_id = e.division_id " +
            " WHERE employee_delete = 0;";
    private static final String DELETE_EMPLOYEE = "UPDATE employee SET employee_delete = '1' WHERE (employee_id = ?);";
    private static final String UPDATE_EMPLOYEE = "UPDATE employee SET employee_name = ?, employee_birthday = ?, employee_id_card = ?, employee_salary = ?," +
            " employee_phone = ?, employee_email = ?, employee_address = ?, position_id = ?, education_degree_id = ?, division_id = ? WHERE (employee_id = ?);";
    private static final String CREATE_EMPLOYEE = "insert into employee (employee_name, employee_birthday, " +
            "employee_id_card, employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id, division_id,username)" +
            "value (?,?,?,?,?,?,?,?,?,?,?);";

    DAO dao = new DAO();
    @Override
    public List<Employee> findEmployee(String key) {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(FIND_EMPLOYEE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Employee employee = new Employee();
                employee.setId(rs.getInt("employee_id"));
                employee.setName(rs.getString("employee_name"));
                employee.setBirthday(rs.getString("employee_birthday"));
                employee.setIdCard(rs.getString("employee_id_card"));
                employee.setSalary(rs.getDouble("employee_salary"));
                employee.setPhone(rs.getString("employee_phone"));
                employee.setEmail(rs.getString("employee_email"));
                employee.setAddress(rs.getString("employee_address"));
                employee.setPositionId(rs.getInt("position_id"));
                employee.setEducationId(rs.getInt("education_degree_id"));
                employee.setDivisionId(rs.getInt("division_id"));
                employee.setPositionValue(rs.getString("position_name"));
                employee.setEducationValue(rs.getString("education_degree_name"));
                employee.setDivisionValue(rs.getString("division_name"));

                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public List<Employee> selectAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Employee employee = new Employee();
                employee.setId(rs.getInt("employee_id"));
                employee.setName(rs.getString("employee_name"));
                employee.setBirthday(rs.getString("employee_birthday"));
                employee.setIdCard(rs.getString("employee_id_card"));
                employee.setSalary(rs.getDouble("employee_salary"));
                employee.setPhone(rs.getString("employee_phone"));
                employee.setEmail(rs.getString("employee_email"));
                employee.setAddress(rs.getString("employee_address"));
                employee.setPositionId(rs.getInt("position_id"));
                employee.setEducationId(rs.getInt("education_degree_id"));
                employee.setDivisionId(rs.getInt("division_id"));
                employee.setUsername(rs.getString("username"));

                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public void createEmployee(Employee employee) {
        Connection connection  = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(CREATE_EMPLOYEE);
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getBirthday());
            ps.setString(3, employee.getIdCard());
            ps.setDouble(4, employee.getSalary());
            ps.setString(5, employee.getPhone());
            ps.setString(6, employee.getEmail());
            ps.setString(7, employee.getAddress());
            ps.setInt(8, employee.getPositionId());
            ps.setInt(9, employee.getEducationId());
            ps.setInt(10, employee.getDivisionId());
            ps.setString(11, employee.getUsername());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateEmployee(Employee employee) {
        Connection connection  = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_EMPLOYEE);
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getBirthday());
            ps.setString(3, employee.getIdCard());
            ps.setDouble(4, employee.getSalary());
            ps.setString(5, employee.getPhone());
            ps.setString(6, employee.getEmail());
            ps.setString(7, employee.getAddress());
            ps.setInt(8, employee.getPositionId());
            ps.setInt(9, employee.getEducationId());
            ps.setInt(10, employee.getDivisionId());
            ps.setInt(11, employee.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleteEmployeeById(Integer id) {
        boolean flag = false;
        Connection connection = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_EMPLOYEE);
            ps.setInt(1, id);
            flag = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public boolean createAccountforEmployee(Employee employee) {
        boolean flag = false;
        Connection connection  = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(CREATE_ACCOUNT_FOR_EMPLOYEE);
            ps.setString(1, employee.getUsername());
            ps.setString(2, employee.getPassword());
            flag = ps.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public Map<Integer, String> getPositon() {
        Map<Integer,String> positonList = new HashMap<>();
        String query = "SELECT * FROM position;";
        try (Connection connection = dao.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("position_id");
                String name = rs.getString("position_name");
                positonList.put(id,name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return positonList;
    }

    @Override
    public Map<Integer, String> getEducation() {
        Map<Integer,String> educationList = new HashMap<>();
        String query = "SELECT * FROM education_degree;";
        try (Connection connection = dao.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("education_degree_id");
                String name = rs.getString("education_degree_name");
                educationList.put(id,name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return educationList;
    }

    @Override
    public Map<Integer, String> getDivision() {
        Map<Integer,String> divisionList = new HashMap<>();
        String query = "SELECT * FROM division;";
        try (Connection connection = dao.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("division_id");
                String name = rs.getString("division_name");
                divisionList.put(id,name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return divisionList;
    }
}
