package repository.impl;

import model.Employee;
import model.service.Service;
import repository.DAO;
import repository.IServiceRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceRepo implements IServiceRepo {
    private static final String SELECT_ALL_SERVICE = "SELECT *,service_type_name,rent_type_name FROM service sv " +
            " join service_type svt on sv.service_type_id = svt.service_type_id " +
            " join rent_type rt on sv.rent_type_id = rt.rent_type_id WHERE service_delete = 0;";
    private static final String DELETE_SERVICE = "UPDATE service SET service_delete = '1' WHERE (service_id = ?);";
    private static final String UPDATE_SERVICE  = "UPDATE service SET service_name = ?, service_area = ?, service_cost = ? " +
            ", service_max_people = ?, rent_type_id = ?, service_type_id = ?, standard_room = ?, description_other_convenience = ?, number_of_floors = ? " +
            ", pool_area = ? WHERE (service_id = ?);";
    private static final String CREATE_SERVICE = "insert into service (service_code, service_name, " +
            "service_area, service_cost,service_max_people, rent_type_id, service_type_id, standard_room, description_other_convenience, number_of_floors, pool_area)" +
            "value (?,?,?,?,?,?,?,?,?,?,?);";

    DAO dao = new DAO();
    @Override
    public List<Service> findService(String key) {
        List<Service> serviceList = new ArrayList<>();
        Connection connection = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_SERVICE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Service service = new Service();
                service.setId(rs.getInt("service_id"));//
                service.setCode(rs.getString("service_code"));
                service.setName(rs.getString("service_name"));
                service.setArea(rs.getDouble("service_area"));
                service.setServiceCost(rs.getDouble("service_cost"));
                service.setMaxPeople(rs.getInt("service_max_people"));
                service.setRentTypeId(rs.getInt("rent_type_id"));//
                service.setServiceTypeId(rs.getInt("service_type_id"));//
                service.setStandardRoom(rs.getString("standard_room"));
                service.setDescription(rs.getString("description_other_convenience"));
                service.setPoolArea(rs.getDouble("pool_area"));
                service.setNumberFloors(rs.getInt("number_of_floors"));
                service.setServiceTypeValue(rs.getString("service_type_name"));
                service.setRentTypeValue(rs.getString("rent_type_name"));

                serviceList.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceList;
    }

    @Override
    public List<Service> selectAllService() {
        List<Service> serviceList = new ArrayList<>();
        Connection connection = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_SERVICE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Service service = new Service();
                service.setId(rs.getInt("service_id"));//
                service.setCode(rs.getString("service_code"));
                service.setName(rs.getString("service_name"));
                service.setArea(rs.getDouble("service_area"));
                service.setServiceCost(rs.getDouble("service_cost"));
                service.setMaxPeople(rs.getInt("service_max_people"));
                service.setRentTypeId(rs.getInt("rent_type_id"));//
                service.setServiceTypeId(rs.getInt("service_type_id"));//
                service.setStandardRoom(rs.getString("standard_room"));
                service.setDescription(rs.getString("description_other_convenience"));
                service.setPoolArea(rs.getDouble("pool_area"));
                service.setNumberFloors(rs.getInt("number_of_floors"));
                service.setServiceTypeValue(rs.getString("service_type_name"));
                service.setRentTypeValue(rs.getString("rent_type_name"));

                serviceList.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceList;
    }

    @Override
    public void createService(Service service) {
        Connection connection  = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(CREATE_SERVICE);
            ps.setString(1, service.getCode());
            ps.setString(2, service.getName());
            ps.setDouble(3, service.getArea());
            ps.setDouble(4, service.getServiceCost());
            ps.setDouble(5, service.getMaxPeople());
            ps.setInt(6, service.getRentTypeId());
            ps.setInt(7, service.getServiceTypeId());
            ps.setString(8, service.getStandardRoom());
            ps.setString(9, service.getDescription());
            if (service.getServiceTypeId() == 1||service.getServiceTypeId() == 2){
                ps.setInt(10, service.getNumberFloors());
            }else{
                ps.setInt(10, Types.NULL);
            }
            if (service.getServiceTypeId() == 1){
                ps.setDouble(11, service.getPoolArea());
            }else{
                ps.setInt(11, Types.NULL);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateService(Service service) {
        Connection connection  = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_SERVICE);
            ps.setString(1, service.getName());
            ps.setDouble(2, service.getArea());
            ps.setDouble(3, service.getServiceCost());
            ps.setDouble(4, service.getMaxPeople());
            ps.setInt(5, service.getRentTypeId());
            ps.setInt(6, service.getServiceTypeId());
            ps.setString(7, service.getStandardRoom());
            ps.setString(8, service.getDescription());
            if (service.getServiceTypeId() == 1||service.getServiceTypeId() == 2){
                ps.setInt(9, service.getNumberFloors());
            }else{
                ps.setInt(9, Types.NULL);
            }
            if (service.getServiceTypeId() == 1){
                ps.setDouble(10, service.getPoolArea());
            }else{
                ps.setInt(10, Types.NULL);
            }
            ps.setInt(11, service.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleteServiceById(Integer id) {
        boolean flag = false;
        Connection connection = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_SERVICE);
            ps.setInt(1, id);
            flag = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public Map<Integer, String> getRentType() {
        Map<Integer,String> rentTypeList = new HashMap<>();
        String query = "SELECT * FROM rent_type;";
        try (Connection connection = dao.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("rent_type_id");
                String name = rs.getString("rent_type_name");
                rentTypeList.put(id,name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypeList;
    }

    @Override
    public Map<Integer, String> getServiceType() {
        Map<Integer,String> serviceTypeList = new HashMap<>();
        String query = "SELECT * FROM service_type;";
        try (Connection connection = dao.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("service_type_id");
                String name = rs.getString("service_type_name");
                serviceTypeList.put(id,name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceTypeList;
    }
}
