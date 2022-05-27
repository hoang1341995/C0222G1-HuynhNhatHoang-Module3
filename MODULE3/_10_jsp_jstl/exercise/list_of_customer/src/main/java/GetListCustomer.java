import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetListCustomer", urlPatterns = "/list")
public class GetListCustomer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer[] customers = new Customer[3];
        customers[0] = new Customer("Huỳnh Nhật Hoàng","1996-04-13","Đà Nẵng", "img/av1.jpeg");
        customers[1] = new Customer("Nguyễn Dương Trung Kiên","2000-04-13","Đà Nẵng", "img/av2.jpeg");
        customers[2] = new Customer("Nguyễn Hoàng Hảo","1999-04-13","Đà Nẵng", "img/av3.jpeg");
        request.setAttribute("CustomerList",customers);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
