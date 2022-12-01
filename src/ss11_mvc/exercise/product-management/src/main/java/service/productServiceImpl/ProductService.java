package service.productServiceImpl;

import model.Product;
import repository.IProductRepository;
import repository.productRepositoryImpl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();
    @Override
    public void createProduct(Product product) {
        productRepository.createProduct(product);
    }

    @Override
    public Product findByID(int id) {
       return productRepository.findByID(id);
    }

    @Override
    public void update(int index, Product product) {
        productRepository.update(index,product);
    }

    @Override
    public void removeProduct(int id) {
        productRepository.removeProduct(id);
    }

    @Override
    public List<Product> findAll() {
       return productRepository.findAll();
    }
}
