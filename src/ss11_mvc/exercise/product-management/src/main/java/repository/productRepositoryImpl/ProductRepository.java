package repository.productRepositoryImpl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
   private static List<Product> productList = new ArrayList<>();
   static {
       productList.add(new Product(1,"Chó",2000,"Gâu gâu","Nhà"));
       productList.add(new Product(2,"Mèo",3000,"meo meo","Nhà"));
       productList.add(new Product(3,"Gà",4000,"cục tác","Vườn"));
       productList.add(new Product(4,"Chim",5000,"hót líu lo","Rừng"));
   }

   public List<Product> findAll() {
      return productList;
   }

    @Override
    public void removeProduct(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if(id == productList.get(i).getId()) {
                productList.remove(i);
            }
        }
    }


    @Override
    public void createProduct(Product product) {
        productList.add(product);
    }

    @Override
    public Product findByID(int id) {
       Product product = new Product();
        for (Product x : productList) {
            if(x.getId() == id) {
                product = x;
            }
        }
        return product;
    }

    @Override
    public void update(int oldId, Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == oldId) {
                productList.set(i,product);
                break;
            }
        }
    }

}
