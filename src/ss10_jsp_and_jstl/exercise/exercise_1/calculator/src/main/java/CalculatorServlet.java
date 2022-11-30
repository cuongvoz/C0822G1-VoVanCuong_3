import com.sun.org.apache.bcel.internal.generic.ATHROW;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float first = Float.parseFloat(request.getParameter("first"));
        float second = Float.parseFloat(request.getParameter("second"));

        String operator = request.getParameter("select");
        float result = 0;
        try {


            switch (operator) {
                case "+":
                    result = first + second;
                    break;
                case "-":
                    result = first - second;
                    break;
                case "x":
                    result = first * second;
                    break;
                case "/":
                    if (second == 0.0) {
                        throw new ArithmeticException("Không được chia cho 0");
                    }
                    result = first / second;
                    break;
            }

        } catch (ArithmeticException e) {
            request.setAttribute("result", e.getMessage());
            request.getRequestDispatcher("display.jsp").forward(request, response);
        }
        request.setAttribute("result", "kết quả của " + first + " " + operator + " " + second + " = " + result);
        request.getRequestDispatcher("display.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
