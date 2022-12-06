package controller;

import model.Customer;
import model.CustomerType;
import service.CustomerService;
import service.ICutomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Signature;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    ICutomerService cutomerService = new CustomerService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                add(request,response);
                break;
            case "find":
                 find(request,response);
                 break;
            case "edit":
                update(request,response);
                break;

            case "delete":
                delete(request,response);
                break;

        }
    }

    private void find(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Customer> list = this.cutomerService.findByName(name);
        List<CustomerType> typeList = this.cutomerService.selectType();
        request.setAttribute("find",name);
        request.setAttribute("list",list);
        request.setAttribute("typeList",typeList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthday");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idcard");
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int idType = Integer.parseInt(request.getParameter("typeid"));
        CustomerType customerType = new CustomerType(idType);
        Customer customer = new Customer(id,name,birthDay,gender,idCard,phoneNumber,email,address,customerType);
        this.cutomerService.updateCustomer(customer);
        showList(request,response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        this.cutomerService.delete(id);
        showList(request,response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String date = request.getParameter("birthday");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idcard");
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int typeId = Integer.parseInt(request.getParameter("typeid"));
        CustomerType customerType = new CustomerType(typeId);
        Customer customer = new Customer(name,date,gender,idCard,phoneNumber,email,address,customerType);
        this.cutomerService.insertCustomer(customer);
        showList(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String action = request.getParameter("action");
      if (action == null) {
          action = "";
      }
      switch (action) {
          case "dasdsa":
              break;
          default:
              showList(request,response);
              break;
      }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
       List<Customer> list = this.cutomerService.selectAll();
       List<CustomerType> typeList = this.cutomerService.selectType();
       request.setAttribute("list",list);
       request.setAttribute("typeList",typeList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
