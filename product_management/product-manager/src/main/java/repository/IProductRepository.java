package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> selectAll();

    void insert(Product product);
    void delete(int id);
    void update(int id,Product product);

    List<Product> selectByName(String name);

    Product selectByID(int id);
}
