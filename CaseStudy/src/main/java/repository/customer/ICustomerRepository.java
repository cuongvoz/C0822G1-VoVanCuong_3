package repository.customer;

import model.Customer;
import model.CustomerType;

import java.util.List;

public interface ICustomerRepository {

    void updateCustomer(Customer customer);

    List<Customer> findByName(String name);

    void insertCustomer(Customer customer);

    void delete(int id);

    List<CustomerType> selectType();

    List<Customer> selectAll();
}
