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
import java.util.regex.Pattern;

import static utils.regex.*;

public class CustomerService implements ICustomerService {
    ICustomerRepo customerRepo = new CustomerRepo();


    @Override
    public List<Customer> findCustomer(String key) {
        List<Customer> customerList = customerRepo.findCustomer(key);
        List<Customer> customerList2 = new ArrayList<>();
        for (Customer customers: customerList){
            if (customers.getName().toLowerCase().contains(key.toLowerCase())||
                    customers.getAddress().toLowerCase().contains(key.toLowerCase())||
                    customers.getCode().toLowerCase().contains(key.toLowerCase())||
                    customers.getIdCard().toLowerCase().contains(key.toLowerCase())||
                    customers.getPhone().toLowerCase().contains(key.toLowerCase())||
                    customers.getEmail().toLowerCase().contains(key.toLowerCase())){
                customerList2.add(customers);
            }
        }
        return customerList2;
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepo.selectAllCustomer();
    }

    @Override
    public Map<String, String> createCustomer(Customer customer) {
        Map<String, String> mapRegexCreateCustomer = new HashMap<>();
        boolean flag = true;
        if (!Pattern.matches(REGEX_CODE_CUSTOMER,customer.getCode())){
            flag = false;
            mapRegexCreateCustomer.put("code","Mã khách hàng không đúng định dạng. (vd: KH-0123)");
        }
        if (!Pattern.matches(REGEX_NAME,customer.getName())){
            flag = false;
            mapRegexCreateCustomer.put("name","Tên phải viết hoa chữ cái đầu. (vd: Nhật Hoàng)");
        }
        if (!Pattern.matches(REGEX_NUMBER,customer.getIdCard())){
            flag = false;
            mapRegexCreateCustomer.put("idCard","CMND phải là số.");
        }
        if (!Pattern.matches(REGEX_PHONE,customer.getPhone())){
            flag = false;
            mapRegexCreateCustomer.put("phone","Sai định dạng số điện thoại (vd: 84|09|08)");
        }
        if (!Pattern.matches(REGEX_EMAIL,customer.getEmail())){
            flag = false;
            mapRegexCreateCustomer.put("email","Sai định dạng email (vd: hoang@gmail.com)");
        }
        if (customer.getBirthday().equals("")){
            flag = false;
            mapRegexCreateCustomer.put("birthday","Chưa nhập ngày sinh");
        }
        if (customer.getAddress().equals("")){
            flag = false;
            mapRegexCreateCustomer.put("address","Chưa nhập địa chỉ");
        }
        if (flag){
            customerRepo.createCustomer(customer);
        }
        return mapRegexCreateCustomer;


    }

    @Override
    public Map<String, String>  updateCustomer(Customer customer) {
        Map<String, String> mapRegexCreateCustomer = new HashMap<>();
        boolean flag = true;
        if (!Pattern.matches(REGEX_CODE_CUSTOMER,customer.getCode())){
            flag = false;
            mapRegexCreateCustomer.put("code","Mã khách hàng không đúng định dạng. (vd: KH-0123)");
        }
        if (!Pattern.matches(REGEX_NAME,customer.getName())){
            flag = false;
            mapRegexCreateCustomer.put("name","Tên phải viết hoa chữ cái đầu. (vd: Nhật Hoàng)");
        }
        if (!Pattern.matches(REGEX_NUMBER,customer.getIdCard())){
            flag = false;
            mapRegexCreateCustomer.put("idCard","CMND phải là số.");
        }
        if (!Pattern.matches(REGEX_PHONE,customer.getPhone())){
            flag = false;
            mapRegexCreateCustomer.put("phone","Sai định dạng số điện thoại (vd: 84|09|08)");
        }
        if (!Pattern.matches(REGEX_EMAIL,customer.getEmail())){
            flag = false;
            mapRegexCreateCustomer.put("email","Sai định dạng email (vd: hoang@gmail.com)");
        }
        if (customer.getBirthday().equals("")){
            flag = false;
            mapRegexCreateCustomer.put("birthday","Chưa nhập ngày sinh");
        }
        if (customer.getAddress().equals("")){
            flag = false;
            mapRegexCreateCustomer.put("address","Chưa nhập địa chỉ");
        }
        if (flag){
            customerRepo.updateCustomer(customer);
        }
        return mapRegexCreateCustomer;
    }

    @Override
    public boolean deleteCustomerById(Integer id) {
        return customerRepo.deleteCustomerById(id);
    }

    @Override
    public Map<Integer, String> getCustomerType() {
        return customerRepo.getCustomerType();
    }
}
