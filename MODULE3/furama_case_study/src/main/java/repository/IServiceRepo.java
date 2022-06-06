package repository;

import model.service.Service;

import java.util.List;
import java.util.Map;

public interface IServiceRepo {

    List<Service> findService(String key);

    List<Service> selectAllService();

    void createService(Service service);

    void  updateService(Service service);

    boolean deleteServiceById(Integer id);

    Map<Integer,String> getRentType();

    Map<Integer,String> getServiceType();
}
