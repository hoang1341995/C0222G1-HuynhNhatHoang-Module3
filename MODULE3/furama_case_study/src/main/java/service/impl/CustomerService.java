package service.impl;

import model.Customer;

import repository.DAO;
import repository.ICustomerRepo;
import repository.impl.CustomerRepo;
import service.ICustomerService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    ICustomerRepo customerRepo = new CustomerRepo();

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
    public Map<Integer,String> getCustomerType(){
        return customerRepo.getCustomerType();
    }
}
