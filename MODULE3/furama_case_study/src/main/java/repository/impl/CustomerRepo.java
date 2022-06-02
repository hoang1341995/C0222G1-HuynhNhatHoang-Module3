package repository.impl;

import model.Customer;
import repository.DAO;
import repository.ICustomerRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerRepo implements ICustomerRepo {
    DAO dao = new DAO();


    @Override
    public List<Customer> findCustomer(String key) {
        return null;
    }

    @Override
    public List<Customer> showList() {
        return null;
    }

    @Override
    public void addNewCustomer() {

    }

    @Override
    public void deleteCustomerById(int id) {

    }

    @Override
    public void editCustomerById(int id) {

    }

    @Override
    public Map<Integer, String> getCustomerType() {
        Map<Integer,String> listCustomerType = new HashMap<>();
        String query = "SELECT * FROM customer_type;";
        try (Connection connection = dao.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("customer_type_id");
                String name = rs.getString("customer_type_name");
                listCustomerType.put(id,name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listCustomerType;
    }
}
