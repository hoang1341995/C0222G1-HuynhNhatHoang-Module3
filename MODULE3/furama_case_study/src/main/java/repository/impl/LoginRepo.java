package repository.impl;

import model.Employee;
import repository.DAO;
import repository.ILoginRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoginRepo implements ILoginRepo {
    private static final String SELECT_ALL_USER = "SELECT e.username,u.password,p.position_id FROM employee e " +
            " join position p on p.position_id = e.position_id " +
            " join user u on u.username = e.username WHERE e.employee_delete = 0;";
    DAO dao = new DAO();

    @Override
    public boolean checkAccount(String username, String password) {
//        List<Employee> employeeList = new ArrayList<>();
//        Connection connection = dao.getConnection();
//        try {
//            PreparedStatement ps = connection.prepareStatement(FIND_EMPLOYEE);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()){
//                Employee employee = new Employee();
//                employee.setId(rs.getInt("employee_id"));
//                employee.setName(rs.getString("employee_name"));
//                employee.setBirthday(rs.getString("employee_birthday"));
//                employee.setIdCard(rs.getString("employee_id_card"));
//                employee.setSalary(rs.getDouble("employee_salary"));
//                employee.setPhone(rs.getString("employee_phone"));
//                employee.setEmail(rs.getString("employee_email"));
//                employee.setAddress(rs.getString("employee_address"));
//                employee.setPositionId(rs.getInt("position_id"));
//                employee.setEducationId(rs.getInt("education_degree_id"));
//                employee.setDivisionId(rs.getInt("division_id"));
//                employee.setPositionValue(rs.getString("position_name"));
//                employee.setEducationValue(rs.getString("education_degree_name"));
//                employee.setDivisionValue(rs.getString("division_name"));
//
//                employeeList.add(employee);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return employeeList;
        return false;
    }
}
