package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    void createProduct(Product product);

    Product findByID(int id);
 void update(int index,Product product);
    List<Product> findAll();

    void removeProduct(int id);
}
