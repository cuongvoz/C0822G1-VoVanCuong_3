import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = {"/caculator"})
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String name = request.getParameter("discription");
     double price = Double.parseDouble(request.getParameter("price"));
     double percent = Double.parseDouble(request.getParameter("percent"));
     double discountAmount = price * percent * 0.01;
     double discountPrice = price - discountAmount;
     request.setAttribute("name",name);
     request.setAttribute("amount",discountAmount);
     request.setAttribute("price",discountPrice);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display.jsp");
        requestDispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
