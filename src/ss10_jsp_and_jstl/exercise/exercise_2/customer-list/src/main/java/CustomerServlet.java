import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/list-customer")
public class CustomerServlet extends HttpServlet {
    static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://scr.vn/wp-content/uploads/2020/07/avt-cute.jpg.webp"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://kynguyenlamdep.com/wp-content/uploads/2022/06/avatar-cute-meo-con-than-chet-700x695.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa","1983-08-22","Nam Định","https://haycafe.vn/wp-content/uploads/2022/02/Hinh-avatar-de-thuong-cho-Facebook.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây","https://phunugioi.com/wp-content/uploads/2020/10/hinh-anh-avatar-de-thuong-cute.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-08-20","Hà Nội","https://thao68.com/wp-content/uploads/2021/12/avatar-cute-2.jpg"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setAttribute("list",customerList);
      request.getRequestDispatcher("display.jsp").forward(request,response);
    }
}
