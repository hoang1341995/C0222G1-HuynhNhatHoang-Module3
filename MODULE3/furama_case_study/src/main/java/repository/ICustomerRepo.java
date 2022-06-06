package repository;

import model.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerRepo {

    List<Customer> findCustomer(String key);

    List<Customer> selectAllCustomer();

    void createCustomer(Customer customer);

    void updateCustomer(Customer customer);

    boolean deleteCustomerById(Integer id);

    public Map<Integer,String> getCustomerType();

}
