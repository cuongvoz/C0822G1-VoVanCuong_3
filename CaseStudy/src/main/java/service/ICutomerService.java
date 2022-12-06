package service;

import model.Customer;
import model.CustomerType;

import java.util.List;

public interface ICutomerService {
    List<Customer> selectAll();

    List<CustomerType> selectType();

    void insertCustomer(Customer customer);

    void delete(int id);

    void updateCustomer(Customer customer);

    List<Customer> findByName(String name);
}
