package service;

import model.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerService {

    List<Customer> findCustomer(String key);

    List<Customer> selectAllCustomer();

    Map<String, String> createCustomer(Customer customer);

    Map<String, String>  updateCustomer(Customer customer);

    boolean deleteCustomerById(Integer id);

    public Map<Integer,String> getCustomerType();

}
