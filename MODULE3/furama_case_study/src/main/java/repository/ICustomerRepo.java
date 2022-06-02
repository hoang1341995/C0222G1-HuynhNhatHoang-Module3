package repository;

import model.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerRepo {

    List<Customer> findCustomer(String key);

    List<Customer> showList();

    void addNewCustomer();

    void deleteCustomerById(int id);

    void editCustomerById(int id);

    public Map<Integer,String> getCustomerType();

}
