package repository.impl;

import model.Customer;
import repository.DAO;
import repository.ICustomerRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerRepo implements ICustomerRepo {
    private static final String CREATE_CUSTOMER = "insert into customer (customer_code, customer_name, " +
            "customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address, customer_type_id)" +
            "value (?,?,?,?,?,?,?,?,?);";
    private static final String SELECT_ALL_CUSTOMER = "SELECT * FROM customer WHERE customer_delete = 0;";
//    private static final String SELECT_ALL_CUSTOMER = "SELECT *,ct.customer_type_name as `type` FROM customer c" +
//        "join customer_type ct on ct.customer_type_id = c.customer_type_id;";
    private static final String DELETE_CUSTOMER = "UPDATE customer SET customer_delete = '1' WHERE (customer_id = ?);";
    private static final String UPDATE_CUSTOMER = "UPDATE customer SET customer_code = ?," +
            " customer_name = ?, customer_birthday = ?, customer_gender = ?, customer_id_card = ?," +
            " customer_phone = ?, customer_email = ?, customer_address = ?, customer_type_id = ? WHERE (customer_id = ?);";

    DAO dao = new DAO();

    @Override
    public List<Customer> findCustomer(String key) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("customer_id");
                String code = rs.getString("customer_code");
                String name = rs.getString("customer_name");
                String birthday = rs.getString("customer_birthday");
                int gender = rs.getInt("customer_gender");
                String idCard = rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                int typeId = rs.getInt("customer_type_id");
                customerList.add(new Customer(id,code,name,birthday,gender,idCard,phone,email,address,typeId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("customer_id");
                String code = rs.getString("customer_code");
                String name = rs.getString("customer_name");
                String birthday = rs.getString("customer_birthday");
                int gender = rs.getInt("customer_gender");
                String idCard = rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                int typeId = rs.getInt("customer_type_id");
                customerList.add(new Customer(id,code,name,birthday,gender,idCard,phone,email,address,typeId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void createCustomer(Customer customer) {
        Connection connection = this.dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(CREATE_CUSTOMER);
            ps.setString(1, customer.getCode());
            ps.setString(2, customer.getName());
            ps.setString(3, customer.getBirthday());
            ps.setInt(4, customer.getGender());
            ps.setString(5, customer.getIdCard());
            ps.setString(6, customer.getPhone());
            ps.setString(7, customer.getEmail());
            ps.setString(8, customer.getAddress());
            ps.setInt(9, customer.getCustomerTypeId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void updateCustomer(Customer customer) {
        Connection connection  = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_CUSTOMER);
            ps.setString(1, customer.getCode());
            ps.setString(2, customer.getName());
            ps.setString(3, customer.getBirthday());
            ps.setInt(4, customer.getGender());
            ps.setString(5, customer.getIdCard());
            ps.setString(6, customer.getPhone());
            ps.setString(7, customer.getEmail());
            ps.setString(8, customer.getAddress());
            ps.setInt(9, customer.getCustomerTypeId());
            ps.setInt(10, customer.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleteCustomerById(Integer id) {
        boolean flag = false;
        Connection connection = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_CUSTOMER);
            ps.setInt(1, id);
            flag = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
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
