package controller;

import model.Product;
import service.IProductService;
import service.product_service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductServlet",value = "/product")
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                create(request,response);
                break;
            case "edit":
                updateProduct(request,response);
                break;

        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        float price = Float.parseFloat(request.getParameter("price"));
        String description = request.getParameter("description");
        Product product = new Product(name,status,price,description);
        this.productService.update(id,product);
        showList(request,response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        float price = Float.parseFloat(request.getParameter("price"));
        String description = request.getParameter("description");
        Product product = new Product(name,status,price,description);
        this.productService.insert(product);
        showList(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action");
       if(action == null) {
           action = "";
       }
       switch (action) {
           case "add":
               showFormAdd(request,response);
               break;
           case "edit":
               showFormEdit(request,response);
               break;
           case "delete":
               deleteProduct(request,response);
               break;
           default:
               showList(request,response);
       }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        this.productService.delete(id);
        showList(request,response);
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.selectByID(id);
        request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("view/update.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("list",this.productService.selectAll());
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
