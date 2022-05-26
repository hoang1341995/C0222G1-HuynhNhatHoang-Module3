import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "display_discount", value = "/display_discount")
public class display_discount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = "";
        int price = 0;
        int percent = 0;
        double discount_mount = 0;
        double total = 0;

        product = request.getParameter("product");
        price = Integer.parseInt(request.getParameter("price"));
        percent = Integer.parseInt(request.getParameter("percent"));
        discount_mount = price * percent * 0.01;
        total = (price * percent) - discount_mount;

        request.setAttribute("product",product);
        request.setAttribute("price",price);
        request.setAttribute("percent",percent);
        request.setAttribute("discount_mount",discount_mount);
        request.setAttribute("total",total);
        request.getRequestDispatcher("display.jsp").forward(request,response);
    }
}
