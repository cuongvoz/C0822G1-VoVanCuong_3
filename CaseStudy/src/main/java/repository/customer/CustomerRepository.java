package repository.customer;

import model.Customer;
import model.CustomerType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String URL = "jdbc:mysql://localhost:3306/case_study_jsp_servlet";
    private final String Username = "root";
    private final String Password = "codegym";

    private static final String SELECT_ALL = "select c.*,ct.name as type_name from customer c join customer_type ct on c.customer_type_id = ct.id order by c.id;";
    private static final String SELECT_CUSTOMER_TYPE = "select * from customer_type;";
    private static final String INSERT = "INSERT INTO customer (id,name, date_of_birth, gender, id_card, phone_number, email, address, customer_type_id) VALUES (id(),?,?,?,?,?,?,?,?);";
    private static final String DELETE = "delete from customer where id = ?";
    private static final String SAFE = "SET FOREIGN_KEY_CHECKS=0;";
    private static final String CONTRAINS = "set SQL_SAFE_UPDATES = 0;";
    private static final String UPDATE = "UPDATE customer set name = ?,date_of_birth = ?,gender = ?,id_card = ?,phone_number = ?, email = ?, address = ?, customer_type_id = ? where id = ?;";
    private static final String FIND_BY_NAME = "select c.*,ct.name as type_name from customer c join customer_type ct on c.customer_type_id = ct.id where c.name like ?;";

    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, Username, Password);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }




    @Override
    public void updateCustomer(Customer customer) {
        Connection connection = getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1,customer.getName());
            preparedStatement.setString(2,customer.getDateOfBirth());
            preparedStatement.setBoolean(3,customer.isGender());
            preparedStatement.setString(4,customer.getiDCard());
            preparedStatement.setString(5,customer.getPhoneNumber());
            preparedStatement.setString(6,customer.getEmail());
            preparedStatement.setString(7,customer.getAddress());
            preparedStatement.setInt(8,customer.getCustomerType().getId());
            preparedStatement.setInt(9,customer.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
//  "UPDATE customer set name = ?,date_of_birth = ?,gender = ?,id_card = ?,phone_number = ?, email = ?, address = ?, customer_type_id = ? where id = ?;";
    }

    @Override
    public List<Customer> findByName(String name) {
        List<Customer> list = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NAME);
            preparedStatement.setString(1,"%" + name + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                int idType = rs.getInt("customer_type_id");
                String namez = rs.getString("name");
                String date = rs.getString("date_of_birth");
                boolean gender = rs.getBoolean("gender");
                String iDcard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String typeName = rs.getString("type_name");
                CustomerType customerType = new CustomerType(idType, typeName);
                Customer customer = new Customer(id, namez, date, gender, iDcard, phoneNumber, email, address, customerType);
                list.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    @Override
    public void insertCustomer(Customer customer) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1,customer.getName());
            preparedStatement.setString(2,customer.getDateOfBirth());
            preparedStatement.setBoolean(3,customer.isGender());
            preparedStatement.setString(4,customer.getiDCard());
            preparedStatement.setString(5,customer.getPhoneNumber());
            preparedStatement.setString(6,customer.getEmail());
            preparedStatement.setString(7,customer.getAddress());
            preparedStatement.setInt(8,customer.getCustomerType().getId());
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }



    @Override
    public void delete(int id) {
        Connection connection = getConnection();
        try {
            PreparedStatement statement =connection.prepareStatement(SAFE);
            statement.executeUpdate();
            PreparedStatement statement1 = connection.prepareStatement(CONTRAINS);
            statement1.executeUpdate();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<CustomerType> selectType() {
        List<CustomerType> list = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_TYPE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                CustomerType customerType = new CustomerType(id,name);
                list.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }



    @Override
    public List<Customer> selectAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int idType = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String date = rs.getString("date_of_birth");
                boolean gender = rs.getBoolean("gender");
                String iDcard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String typeName = rs.getString("type_name");
                CustomerType customerType = new CustomerType(idType, typeName);
                Customer customer = new Customer(id, name, date, gender, iDcard, phoneNumber, email, address, customerType);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }
}
