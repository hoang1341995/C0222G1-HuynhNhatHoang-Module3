package controller;

import model.Customer;
import repository.DAO;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();
    DAO dao = new DAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list":
                listCustomer(request, response);
                break;
            case "add":
                addCustomer(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) {
        Map<Integer,String> customerList = customerService.getCustomerType();
        request.setAttribute("customerList",customerList);
        try {
            request.getRequestDispatcher("view/customer/create-customer.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("customerList",customerList);
        Map<Integer,String> customerTypeList = customerService.getCustomerType();
        request.setAttribute("customerTypeList",customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/select-all-customer.jsp").forward(request,response);
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
            case "list":
                listCustomer(request, response);
                break;
            case "add":
                saveCustomer(request, response);
                break;
            case "update":
                updateCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }

    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String key = request.getParameter("search-customer");
        List<Customer> customerList = customerService.findCustomer(key);
        if (customerList.size()>0){
            request.setAttribute("customerList",customerList);
            request.setAttribute("search",key);
            Map<Integer,String> customerTypeList = customerService.getCustomerType();
            request.setAttribute("customerTypeList",customerTypeList);
            try {
                request.getRequestDispatcher("view/customer/select-all-customer.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            request.setAttribute("customerList",customerList);
            request.setAttribute("error","Không tìm thấy");
            request.setAttribute("search",key);
            try {
                request.getRequestDispatcher("view/customer/select-all-customer.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("idDelete"));

        if (customerService.deleteCustomerById(id)){
            request.setAttribute("message","Xoá thành công");
            List<Customer> customerList = customerService.selectAllCustomer();
            request.setAttribute("customerList",customerList);
            try {
                request.getRequestDispatcher("view/customer/select-all-customer.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        Customer customer = new Customer();
        customer.setId(Integer.parseInt(request.getParameter("id")));
        customer.setCode(request.getParameter("code"));
        customer.setName(request.getParameter("name"));
        customer.setGender(Integer.parseInt(request.getParameter("gender")));
        customer.setCustomerTypeId(Integer.parseInt(request.getParameter("customerTypeId")));
        customer.setBirthday(request.getParameter("birthday"));
        customer.setIdCard(request.getParameter("idCard"));
        customer.setPhone(request.getParameter("phone"));
        customer.setEmail(request.getParameter("email"));
        customer.setAddress(request.getParameter("address"));
        Map<String,String> mapRegexCreateCustomer = customerService.updateCustomer(customer);

        if (mapRegexCreateCustomer.isEmpty()){
            request.setAttribute("message", "Sửa khách hàng thành công");
            try {
                List<Customer> customerList = customerService.selectAllCustomer();
                request.setAttribute("customerList",customerList);
                request.getRequestDispatcher("view/customer/select-all-customer.jsp").forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }else {
            List<Customer> customerList = customerService.selectAllCustomer();
            request.setAttribute("customerList",customerList);
            request.setAttribute("customer",customer);
            request.setAttribute("error",mapRegexCreateCustomer);
            try {
                request.getRequestDispatcher("view/customer/select-all-customer.jsp").forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void saveCustomer(HttpServletRequest request, HttpServletResponse response) {
        Customer customer = new Customer();
        customer.setCode(request.getParameter("code"));
        customer.setName(request.getParameter("name"));
        customer.setGender(Integer.parseInt(request.getParameter("gender")));
        customer.setCustomerTypeId(Integer.parseInt(request.getParameter("customerTypeId")));
        customer.setBirthday(request.getParameter("birthday"));
        customer.setIdCard(request.getParameter("idCard"));
        customer.setPhone(request.getParameter("phone"));
        customer.setEmail(request.getParameter("email"));
        customer.setAddress(request.getParameter("address"));

        Map<String,String> mapRegexCreateCustomer = customerService.createCustomer(customer);

        if (mapRegexCreateCustomer.isEmpty()){
            request.setAttribute("message", "Thêm mới khách hàng thành công");
            try {
                Map<Integer,String> customerList = customerService.getCustomerType();
                request.setAttribute("customerList",customerList);
                request.getRequestDispatcher("view/customer/create-customer.jsp").forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }else {
            Map<Integer,String> customerList = customerService.getCustomerType();
            request.setAttribute("customerList",customerList);
            request.setAttribute("customer",customer);
            request.setAttribute("error",mapRegexCreateCustomer);
            try {
                request.getRequestDispatcher("view/customer/create-customer.jsp").forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }
}


