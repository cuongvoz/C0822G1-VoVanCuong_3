import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Calculator", urlPatterns = {"/calculator"})
public class Calculator extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String operator = request.getParameter("select");
        int num1 = Integer.parseInt(request.getParameter("first"));
        int num2 = Integer.parseInt(request.getParameter("second"));
        if (num2 == 0) {
            throw new ArithmeticException("khong chia chia cho 0");
        } else {
            int result = 0;
            String operation = null;
            switch (operator) {
                case "add":
                    operation = "+";
                    result = num1 + num2;
                    break;
                case "sub":
                    operation = "-";
                    result = num1 - num2;
                    break;
                case "mul":
                    operation = "*";
                    result = num1 * num2;
                    break;
                case "div":
                    operation = "/";
                    result = num1 / num2;
                    break;
            }
            request.setAttribute("first", num1);
            request.setAttribute("operator", operation);
            request.setAttribute("second", num2);
            request.setAttribute("result", result);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
            requestDispatcher.forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
