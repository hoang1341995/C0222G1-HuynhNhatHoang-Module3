import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "calculator", value = "/calculator")
public class calculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float number1 = Float.parseFloat(request.getParameter("number1"));
        float number2 = Float.parseFloat(request.getParameter("number2"));
        char operator = request.getParameter("operator").charAt(0);
        try {
            float total = Cal(number1,number2,operator);
            request.setAttribute("total","Result: "+number1 + " "+ operator + " "+number2+ " = "+total);
            request.setAttribute("number1",number1);
            request.setAttribute("number2",number2);
            request.setAttribute("operator",request.getParameter("operator"));
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }catch (Exception e) {
            request.setAttribute("total",e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    }
    public static float Cal(float number1, float number2, char operator){
        switch (operator){
            case '+':
                return number1 + number2;
            case '-':
                return number1 - number2;
            case '*':
                return number1 * number2;
            case '/':
                if(number2 != 0)
                    return number1 / number2;
                else
                    throw new RuntimeException("Can't divide by zero");
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
