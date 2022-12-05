package service.product_service;

import model.Product;
import repository.IProductRepository;
import repository.product_repository.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> selectAll() {
        return this.productRepository.selectAll();
    }

    @Override
    public void insert(Product product) {
       this.productRepository.insert(product);
    }

    @Override
    public void delete(int id) {
       this.productRepository.delete(id);
    }

    @Override
    public void update(int id, Product product) {
      this.productRepository.update(id,product);
    }

    @Override
    public List<Product> selectByName(String name) {
        return null;
    }

    @Override
    public Product selectByID(int id) {
        return this.productRepository.selectByID(id);
    }
}
