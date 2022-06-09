package controller;

import service.ILoginService;
import service.impl.LoginService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    ILoginService loginService = new LoginService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.sendRedirect("/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                login(request, response);
                break;
            default:
                response.sendRedirect("/");
                break;
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Map<String,String> mapRegexLogin = loginService.checkAccount(username,password);

        if (mapRegexLogin.isEmpty()){
            request.setAttribute("message", "Đăng nhập thành công thành công");
            request.setAttribute("openModalMessage","$('#message').modal();");
        }else {
            request.setAttribute("login",mapRegexLogin);
            request.setAttribute("login","$('#edit').modal();");
        }
        try {
            request.getRequestDispatcher("view/employee/index-employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
