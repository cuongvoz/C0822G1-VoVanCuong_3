import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "dictionary",urlPatterns = {"/dictionary"})
public class dictionary extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String text = request.getParameter("text");
        Map<String,String> list = new HashMap<>();
        list.put("dog","Cho");
        list.put("chicken","Ga");
        list.put("fish","Ca");
        list.put("bird","Chim");
        list.put("tiger","Ho");
        String check = list.get(text);
        String result = null;
        if(check != null) {
            result = "Word: " + text + "<br>" + "Result: " + check;
        } else  {
            result = "Not found";
        }
        request.setAttribute("result",result);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        requestDispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
