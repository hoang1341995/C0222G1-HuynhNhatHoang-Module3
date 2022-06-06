package controller;

import model.Customer;
import model.Employee;
import service.IEmployeeService;
import service.impl.EmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list":
                listEmployee(request, response);
                break;
            default:
                listEmployee(request, response);
                break;
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        Map<Integer, String> positonList = employeeService.getPositon();
        request.setAttribute("positonList", positonList);
        Map<Integer, String> educationList = employeeService.getEducation();
        request.setAttribute("educationList", educationList);
        Map<Integer, String> divisionList = employeeService.getDivision();
        request.setAttribute("divisionList", divisionList);
        try {
            request.getRequestDispatcher("view/employee/index-employee.jsp").forward(request, response);
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
            case "update":
                editEmployee(request, response);
                break;
            case "add":
                addEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
                case "search":
                searchEmployee(request, response);
                break;
            default:
                listEmployee(request, response);
                break;
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String key = request.getParameter("search-employee");
        List<Employee> employeeList = employeeService.findEmployee(key);
        if (employeeList.size()>0){
            request.setAttribute("employeeList",employeeList);
            request.setAttribute("search",key);
        }else{
            request.setAttribute("error","Không tìm thấy");
            request.setAttribute("openModalMessage","$('#message').modal();");
            request.setAttribute("search",key);
        }
        Map<Integer, String> positonList = employeeService.getPositon();
        request.setAttribute("positonList", positonList);
        Map<Integer, String> educationList = employeeService.getEducation();
        request.setAttribute("educationList", educationList);
        Map<Integer, String> divisionList = employeeService.getDivision();
        request.setAttribute("divisionList", divisionList);
        try {
            request.getRequestDispatcher("view/employee/index-employee.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response) {
        Employee employee = new Employee();
        employee.setName(request.getParameter("name"));
        employee.setBirthday(request.getParameter("birthday"));
        employee.setIdCard(request.getParameter("idCard"));
        employee.setSalary(Double.parseDouble(request.getParameter("salary")));
        employee.setPhone(request.getParameter("phone"));
        employee.setEmail(request.getParameter("email"));
        employee.setAddress(request.getParameter("address"));
        employee.setPositionId(Integer.parseInt(request.getParameter("position")));
        employee.setEducationId(Integer.parseInt(request.getParameter("education")));
        employee.setDivisionId(Integer.parseInt(request.getParameter("division")));
        employee.setUsername(request.getParameter("username"));
        employee.setPassword(request.getParameter("password"));

        Map<String,String> mapRegexAddEmployee = employeeService.createEmployee(employee);

        if (mapRegexAddEmployee.isEmpty()){
            request.setAttribute("message", "Thêm nhân viên thành công");
            request.setAttribute("openModalMessage","$('#message').modal();");
        }else {
            request.setAttribute("errorAdd",mapRegexAddEmployee);
            request.setAttribute("openModalAdd","$('#addNew').modal();");
            request.setAttribute("employee",employee);
        }
        List<Employee> employeeList = employeeService.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        Map<Integer, String> positonList = employeeService.getPositon();
        request.setAttribute("positonList", positonList);
        Map<Integer, String> educationList = employeeService.getEducation();
        request.setAttribute("educationList", educationList);
        Map<Integer, String> divisionList = employeeService.getDivision();
        request.setAttribute("divisionList", divisionList);
        try {
            request.getRequestDispatcher("view/employee/index-employee.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        Employee employee = new Employee();
        employee.setId(Integer.parseInt(request.getParameter("id")));
        employee.setName(request.getParameter("name"));
        employee.setBirthday(request.getParameter("birthday"));
        employee.setIdCard(request.getParameter("idCard"));
        employee.setSalary(Double.parseDouble(request.getParameter("salary")));
        employee.setPhone(request.getParameter("phone"));
        employee.setEmail(request.getParameter("email"));
        employee.setAddress(request.getParameter("address"));
        employee.setPositionId(Integer.parseInt(request.getParameter("position")));
        employee.setEducationId(Integer.parseInt(request.getParameter("education")));
        employee.setDivisionId(Integer.parseInt(request.getParameter("division")));

        Map<String,String> mapRegexUpdateEmployee = employeeService.updateEmployee(employee);

        if (mapRegexUpdateEmployee.isEmpty()){
            request.setAttribute("message", "Sửa nhân viên thành công");
            request.setAttribute("openModalMessage","$('#message').modal();");
        }else {
            request.setAttribute("errorEdit",mapRegexUpdateEmployee);
            request.setAttribute("employee",employee);
            request.setAttribute("openModalEdit","$('#edit').modal();");
        }
        List<Employee> employeeList = employeeService.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        Map<Integer, String> positonList = employeeService.getPositon();
        request.setAttribute("positonList", positonList);
        Map<Integer, String> educationList = employeeService.getEducation();
        request.setAttribute("educationList", educationList);
        Map<Integer, String> divisionList = employeeService.getDivision();
        request.setAttribute("divisionList", divisionList);
        try {
            request.getRequestDispatcher("view/employee/index-employee.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("idDelete"));

        if (employeeService.deleteEmployeeById(id)) {
            request.setAttribute("message", "Xoá thành công");
            request.setAttribute("openModalMessage","$('#message').modal();");
        }else{
            request.setAttribute("error", "Xoá không thành công");
            request.setAttribute("openModalMessage","$('#message').modal();");
        }
        List<Employee> employeeList = employeeService.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        Map<Integer, String> positonList = employeeService.getPositon();
        request.setAttribute("positonList", positonList);
        Map<Integer, String> educationList = employeeService.getEducation();
        request.setAttribute("educationList", educationList);
        Map<Integer, String> divisionList = employeeService.getDivision();
        request.setAttribute("divisionList", divisionList);
        try {
            request.getRequestDispatcher("view/employee/index-employee.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
