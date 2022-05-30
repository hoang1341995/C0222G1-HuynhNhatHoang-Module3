package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static ArrayList<Product> productArrayList = new ArrayList<>();
    static {
        productArrayList.add(new Product(1,"Iphone 11",1000,"new 100%","apple"));
        productArrayList.add(new Product(2,"Iphone 12",1200,"new 100%","apple"));
        productArrayList.add(new Product(3,"Iphone 13",1300,"new 100%","apple"));
        productArrayList.add(new Product(4,"Iphone 11 pro max",1300,"new 100%","apple"));
        productArrayList.add(new Product(5,"Iphone 12 pro max",1400,"new 100%","apple"));
        productArrayList.add(new Product(6,"Iphone 13 pro max",1500,"new 100%","apple"));
        productArrayList.add(new Product(7,"Samsung galaxy s22 ultra 5G",1500,"new 100%","samsung"));
        productArrayList.add(new Product(8,"OPPO Find X5 Pro 5G",1400,"new 100%","oppo"));
    }

    @Override
    public List<Product> showAll() {
        return productArrayList;
    }

    @Override
    public void addNew(Product product) {
        productArrayList.add(product);

    }

    @Override
    public Product findProduct(int id) {
        for (Product element: productArrayList ){
            if (element.getId() == id){
                return element;
            }
        }
        return null;
    }

    @Override
    public void update( Product product) {
        for (Product element: productArrayList ){
            if (element.getId() == product.getId()){
                productArrayList.set(productArrayList.indexOf(element),product);
                break;
            }
        }
    }

    @Override
    public void remove(int id) {
        for (Product element: productArrayList ){
            if (element.getId() == id){
                productArrayList.remove(productArrayList.indexOf(element));
                break;
            }
        }

    }

    @Override
    public List<Product> searchProduct(String search) {
        List<Product> productList = new ArrayList<>();
        for (Product element: productArrayList ){
            if (search.equals(String.valueOf(element.getId())) || element.getName().equals(search)){
                productList.add(element);
            }
        }
        return productList;
    }
}
