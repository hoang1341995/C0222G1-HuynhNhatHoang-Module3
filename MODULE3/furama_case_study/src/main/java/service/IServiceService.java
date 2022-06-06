package service;

import model.Customer;
import model.service.Service;

import java.util.List;
import java.util.Map;

public interface IServiceService {

    List<Service> findService(String key);

    List<Service> selectAllService();

    Map<String, String> createService(Service service);

    Map<String, String>  updateService(Service service);

    boolean deleteServiceById(Integer id);

    Map<Integer,String> getRentType();

    Map<Integer,String> getServiceType();
}
