package service;

import model.Product;

import java.util.List;

public interface IProductService {
    void createProduct(Product product);
    Product findByID(int id);
    void update(int index,Product product);
    void removeProduct(int id);
    List<Product> findAll();
}
