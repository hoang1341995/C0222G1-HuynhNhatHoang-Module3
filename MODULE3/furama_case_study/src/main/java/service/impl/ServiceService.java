package service.impl;

import model.Employee;
import model.service.Service;
import repository.IServiceRepo;
import repository.impl.ServiceRepo;
import service.IServiceService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import static utils.regex.REGEX_CODE_SERVICE;

public class ServiceService implements IServiceService {
    IServiceRepo serviceRepo = new ServiceRepo();
    @Override
    public List<Service> findService(String key) {
        List<Service> serviceList = serviceRepo.findService(key);
        List<Service> serviceList2 = new ArrayList<>();
        for (Service services: serviceList){
            if (services.getName().toLowerCase().contains(key.toLowerCase())||
                    services.getCode().toLowerCase().contains(key.toLowerCase())||
                    services.getRentTypeValue().toLowerCase().contains(key.toLowerCase())||
                    services.getServiceTypeValue().toLowerCase().contains(key.toLowerCase())||
                    services.getDescription().toLowerCase().contains(key.toLowerCase())||
                    services.getStandardRoom().toLowerCase().contains(key.toLowerCase())){
                serviceList2.add(services);
            }
        }
        return serviceList2;
    }

    @Override
    public List<Service> selectAllService() {
        return serviceRepo.selectAllService();
    }

    @Override
    public Map<String, String> createService(Service service) {
        Map<String, String> mapRegexAddService = new HashMap<>();

        boolean flag = true;

        if (!Pattern.matches(REGEX_CODE_SERVICE,service.getCode())){
            flag = false;
            mapRegexAddService.put("code","Mã dịch vụ không đúng định dạng. (vd: DV-0123)");
        }

        if (service.getName().equals("")){
            flag = false;
            mapRegexAddService.put("name","Chưa nhập tên dịch vụ");
        }
        if (service.getDescription().equals("")){
            flag = false;
            mapRegexAddService.put("description","Chưa nhập mô tả");
        }
        if (service.getArea()<=0){
            flag = false;
            mapRegexAddService.put("area","Diện tích phải là số dương");
        }
        if (service.getMaxPeople()<=0){
            flag = false;
            mapRegexAddService.put("maxPeople","Số người tối đa phải là số dương");
        }
        if (service.getServiceTypeId() == 1||service.getServiceTypeId() == 2){
            if (service.getNumberFloors()<=0){
                flag = false;
                mapRegexAddService.put("numberFloors","Số tầng phải là số dương");
            }
        }
        if (service.getServiceTypeId() == 1){
            if (service.getPoolArea()<=0){
                flag = false;
                mapRegexAddService.put("poolArea","Diện tích hồ bơi phải là số dương");
            }
        }

        if (flag){
            serviceRepo.createService(service);
        }
        return mapRegexAddService;
    }

    @Override
    public Map<String, String> updateService(Service service) {
        Map<String, String> mapRegexUpdateService = new HashMap<>();

        boolean flag = true;
        if (service.getName().equals("")){
            flag = false;
            mapRegexUpdateService.put("name","Chưa nhập tên dịch vụ");
        }
        if (service.getDescription().equals("")){
            flag = false;
            mapRegexUpdateService.put("description","Chưa nhập mô tả");
        }
        if (service.getArea()<=0){
            flag = false;
            mapRegexUpdateService.put("area","Diện tích phải là số dương");
        }
        if (service.getMaxPeople()<=0){
            flag = false;
            mapRegexUpdateService.put("maxPeople","Số người tối đa phải là số dương");
        }
        if (service.getServiceTypeId() == 1||service.getServiceTypeId() == 2){
            if (service.getNumberFloors()<=0){
                flag = false;
                mapRegexUpdateService.put("numberFloors","Số tầng phải là số dương");
            }
        }
        if (service.getServiceTypeId() == 1){
            if (service.getPoolArea()<=0){
                flag = false;
                mapRegexUpdateService.put("poolArea","Diện tích hồ bơi phải là số dương");
            }
        }

        if (flag){
            serviceRepo.updateService(service);
        }
        return mapRegexUpdateService;
    }

    @Override
    public boolean deleteServiceById(Integer id) {
        return serviceRepo.deleteServiceById(id);
    }

    @Override
    public Map<Integer, String> getRentType() {
        return serviceRepo.getRentType();
    }

    @Override
    public Map<Integer, String> getServiceType() {
        return serviceRepo.getServiceType();
    }
}
