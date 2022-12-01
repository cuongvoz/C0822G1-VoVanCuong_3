package controller;

import model.Product;
import service.IProductService;
import service.productServiceImpl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                create(request, response);
                break;
            case "update":
                update(request,response);
                break;
            case "find":
                findByName(request,response);
                break;
            default:
                showList(request, response);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int oldid = Integer.parseInt(request.getParameter("oldid"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String brand = request.getParameter("brand");
        Product product = new Product(id,name,price,description,brand);
        iProductService.update(oldid,product);
        showList(request,response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String brand = request.getParameter("brand");
        Product product = new Product(id, name, price, description, brand);
        iProductService.createProduct(product);
        showList(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showFormAdd(request, response);
                break;
            case "display":
                showFormDisplay(request,response);
                break;
            case "remove":
                remove(request, response);
                break;
            case "update":
                showFormUpdate(request,response);
                break;

            default:
                showList(request, response);
        }
    }

    private void findByName(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = this.iProductService.findAll();
        String name = request.getParameter("name");

        for (int i = 0;i < products.size();i++) {
            if(name.equals(products.get(i).getName())) {
                request.setAttribute("result",products.get(i));
                try {
                    request.getRequestDispatcher("view/find.jsp").forward(request,response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
                break;
            }
        };
        request.setAttribute("result","không tìm thấy");
    }

    private void showFormDisplay(HttpServletRequest request, HttpServletResponse response) {
      int id = Integer.parseInt(request.getParameter("id"));
      Product product = this.iProductService.findByID(id);
      request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("view/display.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
     int id = Integer.parseInt(request.getParameter("id"));
     Product product = this.iProductService.findByID(id);
     request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("view/update.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void remove(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iProductService.removeProduct(id);
       showList(request,response);
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    IProductService iProductService = new ProductService();

    private void showList(HttpServletRequest request, HttpServletResponse response) {

        List<Product> products = this.iProductService.findAll();
        request.setAttribute("list", products);
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
