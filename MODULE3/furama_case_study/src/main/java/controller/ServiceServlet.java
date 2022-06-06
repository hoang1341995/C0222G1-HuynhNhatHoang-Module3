package controller;

import model.Employee;
import model.service.Service;
import service.IServiceService;
import service.impl.ServiceService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServiceServlet", value = "/service")
public class ServiceServlet extends HttpServlet {
    IServiceService serviceService = new ServiceService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listService(request, response);
    }

    private void addService(HttpServletRequest request, HttpServletResponse response) {

    }

    private void listService(HttpServletRequest request, HttpServletResponse response) {
        List<Service> serviceList = serviceService.selectAllService();
        request.setAttribute("serviceList", serviceList);
        Map<Integer, String> serviceTypeMap = serviceService.getServiceType();
        request.setAttribute("serviceTypeMap", serviceTypeMap);
        Map<Integer, String> rentTypeMap = serviceService.getRentType();
        request.setAttribute("rentTypeMap", rentTypeMap);
        try {
            request.getRequestDispatcher("view/service/index-service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addService(request, response);
                break;
            case "delete":
                deleteService(request, response);
                break;
            case "update":
                editService(request, response);
                break;
                case "search":
                searchService(request, response);
                break;
            default:
                listService(request, response);
                break;
        }
    }

    private void searchService(HttpServletRequest request, HttpServletResponse response) {
        String key = request.getParameter("search-service");
        List<Service> serviceList = serviceService.findService(key);
        if (serviceList.size()>0){
            request.setAttribute("serviceList",serviceList);
            request.setAttribute("search",key);
        }else{
            request.setAttribute("error","Không tìm thấy");
            request.setAttribute("openModalMessage","$('#message').modal();");
            request.setAttribute("search",key);
        }
        Map<Integer, String> serviceTypeMap = serviceService.getServiceType();
        request.setAttribute("serviceTypeMap", serviceTypeMap);
        Map<Integer, String> rentTypeMap = serviceService.getRentType();
        request.setAttribute("rentTypeMap", rentTypeMap);
        try {
            request.getRequestDispatcher("view/service/index-service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editService(HttpServletRequest request, HttpServletResponse response) {

        Service service = new Service();
        service.setId(Integer.parseInt(request.getParameter("id")));
        //service.setCode(request.getParameter("code"));
        service.setName(request.getParameter("name"));
        service.setArea(Double.parseDouble(request.getParameter("area")));
        service.setServiceCost(Double.parseDouble(request.getParameter("serviceCost")));
        service.setMaxPeople(Integer.parseInt(request.getParameter("maxPeople")));
        service.setRentTypeId(Integer.parseInt(request.getParameter("rentTypeId")));
        service.setServiceTypeId(Integer.parseInt(request.getParameter("serviceTypeId")));
        service.setStandardRoom(request.getParameter("standardRoom"));
        service.setDescription(request.getParameter("description"));
        if (service.getServiceTypeId() == 1||service.getServiceTypeId() == 2){
            service.setNumberFloors(Integer.parseInt(request.getParameter("numberFloors")));
        }
        if (service.getServiceTypeId() == 1){
            service.setPoolArea(Double.parseDouble(request.getParameter("poolArea")));
        }
//        service.setServiceTypeValue(request.getParameter("id"));
//        service.setRentTypeValue(request.getParameter("id"));
        Map<String,String> mapRegexUpdateService = serviceService.updateService(service);

        if (mapRegexUpdateService.isEmpty()){
            request.setAttribute("message", "Sửa dịch vụ thành công");
            request.setAttribute("openModalMessage","$('#message').modal();");
        }else {
            request.setAttribute("errorEdit",mapRegexUpdateService);
            request.setAttribute("service",service);
            request.setAttribute("openModalEdit","$('#edit').modal();");
        }
        List<Service> serviceList = serviceService.selectAllService();
        request.setAttribute("serviceList", serviceList);
        Map<Integer, String> serviceTypeMap = serviceService.getServiceType();
        request.setAttribute("serviceTypeMap", serviceTypeMap);
        Map<Integer, String> rentTypeMap = serviceService.getRentType();
        request.setAttribute("rentTypeMap", rentTypeMap);
        try {
            request.getRequestDispatcher("view/service/index-service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("idDelete"));

        if (serviceService.deleteServiceById(id)) {
            request.setAttribute("message", "Xoá thành công");
            request.setAttribute("openModalMessage","$('#message').modal();");
        }else{
            request.setAttribute("error", "Xoá không thành công");
            request.setAttribute("openModalMessage","$('#message').modal();");
        }
        List<Service> serviceList = serviceService.selectAllService();
        request.setAttribute("serviceList", serviceList);
        Map<Integer, String> serviceTypeMap = serviceService.getServiceType();
        request.setAttribute("serviceTypeMap", serviceTypeMap);
        Map<Integer, String> rentTypeMap = serviceService.getRentType();
        request.setAttribute("rentTypeMap", rentTypeMap);
        try {
            request.getRequestDispatcher("view/service/index-service.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
