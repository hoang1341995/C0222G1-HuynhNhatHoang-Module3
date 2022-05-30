package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {

    List<Product> showAll();

    void addNew(Product customer);

    Product findProduct(int id);

    void update( Product product);

    void remove(int id);

    List<Product> searchProduct(String search);
}
