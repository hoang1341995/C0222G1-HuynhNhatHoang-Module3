package service.impl;

import model.Product;
import repository.impl.ProductRepository;
import repository.IProductRepository;
import service.ProductService;

import java.util.List;

public class IProductService implements ProductService {
    IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> showAll() {
        return productRepository.showAll();
    }

    @Override
    public void addNew(Product product) {
        productRepository.addNew(product);


    }

    @Override
    public Product findProduct(int id) {
        return productRepository.findProduct(id);
    }

    @Override
    public void update( Product product) {
        productRepository.update(product);
    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);

    }

    @Override
    public List<Product>  searchProduct(String search) {
        return productRepository.searchProduct(search);
    }
}
