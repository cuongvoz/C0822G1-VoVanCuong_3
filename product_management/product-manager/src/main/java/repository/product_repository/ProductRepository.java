package repository.product_repository;

import model.Product;
import repository.IProductRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private final String URL = "jdbc:mysql://localhost:3306/product_management";
    private final String Username = "root";
    private final String Password = "codegym";

    private static final String SELECT_ALL = "select * from product;";
    private static final String INSERT_INTO = "insert into product (name,status,price,description) values(?,?,?,?);";
    private static final String UPDATE = "update product set name = ?,status = ?,price = ?,description = ? where id = ?;";
    private static final String SELECT_BY_ID = "select * from product where id = ?;";
    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL,Username,Password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }



    @Override
    public List<Product> selectAll() {
        Connection connection = getConnection();
        List<Product> list = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                boolean status = rs.getBoolean("status");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                list.add(new Product(id,name,status,price,description));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public void insert(Product product) {
     Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setBoolean(2,product.isStatus());
            preparedStatement.setFloat(3,product.getPrice());
            preparedStatement.setString(4,product.getDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(int id, Product product) {
       Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setBoolean(2,product.isStatus());
            preparedStatement.setFloat(3,product.getPrice());
            preparedStatement.setString(4,product.getDescription());
            preparedStatement.setInt(5,id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Product> selectByName(String name) {
        return null;
    }

    @Override
    public Product selectByID(int id) {
        Connection connection = getConnection();
        Product product = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            int idz = rs.getInt("id");
            String name = rs.getString("name");
            boolean status = rs.getBoolean("status");
            float price = rs.getFloat("price");
            String  description = rs.getString("description");
             product = new Product(idz,name,status,price,description);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return product;
    }
}
