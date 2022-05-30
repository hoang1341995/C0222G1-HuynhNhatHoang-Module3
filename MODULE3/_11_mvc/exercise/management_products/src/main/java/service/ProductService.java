package service;

import model.Product;

import java.util.List;

public interface ProductService {

    List<Product> showAll();

    void addNew(Product product);

    Product findProduct(int id);

    void update( Product product);

    void remove(int id);

    List<Product>  searchProduct(String search);
}
