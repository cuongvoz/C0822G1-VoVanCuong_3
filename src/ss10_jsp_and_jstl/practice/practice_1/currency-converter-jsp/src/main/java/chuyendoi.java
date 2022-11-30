import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "chuyendoi", urlPatterns = {"/chuyen"})
public class chuyendoi extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Float tien = Float.parseFloat(request.getParameter("rate"));
        Float usd = Float.parseFloat(request.getParameter("usd"));
        Float vnd = tien * usd;
        request.setAttribute("rate", tien);
        request.setAttribute("usd", usd);
        request.setAttribute("vnd", tien);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
