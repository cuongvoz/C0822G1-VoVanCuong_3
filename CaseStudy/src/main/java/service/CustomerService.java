package service;

import model.Customer;
import model.CustomerType;
import repository.customer.CustomerRepository;
import repository.customer.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICutomerService{
    ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> selectAll() {
        return this.customerRepository.selectAll();
    }

    @Override
    public List<CustomerType> selectType() {
        return this.customerRepository.selectType();
    }

    @Override
    public void insertCustomer(Customer customer) {
        this.customerRepository.insertCustomer(customer);
    }

    @Override
    public void delete(int id) {
        this.customerRepository.delete(id);
    }

    @Override
    public void updateCustomer(Customer customer) {
        this.customerRepository.updateCustomer(customer);
    }

    @Override
    public List<Customer> findByName(String name) {
        return this.customerRepository.findByName(name);
    }
}
