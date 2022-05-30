package controller;

import model.Product;
import service.ProductService;
import service.impl.IProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new IProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "add":
               // addNewProduct(request,response);
                break;
            case "edit":
                editProduct(request,response);
                break;
            case "remove":
                removeProduct(request,response);
                break;
            case "save":
                saveProduct(request,response);
                break;
            case "search":
                searchProduct(request,response);
                break;
            case "view":
                profileProduct(request,response);
                break;
            default:
                listProduct(request,response);
                break;
        }
    }

    private void profileProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findProduct(id);
        request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("view/profile-product.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void removeProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        try {
            response.sendRedirect("/products");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findProduct(id);
        request.setAttribute("productEdit",product);
        try {
            request.getRequestDispatcher("view/edit-product.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void addNewProduct(HttpServletRequest request, HttpServletResponse response) {
        Product product = new Product();
        product.setId(Integer.parseInt(request.getParameter("id")));
        product.setName(request.getParameter("name"));
        product.setPrice(Integer.parseInt(request.getParameter("price")));
        product.setDecription(request.getParameter("decription"));
        product.setProducer(request.getParameter("producer"));
        productService.addNew(product);
        request.setAttribute("message","Thêm mới thành công");
        try {
            request.getRequestDispatcher("view/add-new-product.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {

        List<Product> productList = this.productService.showAll();
        request.setAttribute("listProduct",productList);
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "add":
                addNewProduct(request,response);
                break;
            case "edit":
                break;
            case "remove":
                removeProduct(request,response);
                break;
            case "save":
                saveProduct(request,response);
                break;
            case "view":
                profileProduct(request,response);
                break;
            case "search":
                searchProduct(request,response);
                break;
            default:
                listProduct(request,response);
                break;
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String search = request.getParameter("searchProduct");
        List<Product> productList = productService.searchProduct(search);
        request.setAttribute("listProduct",productList);
        try {
            request.getRequestDispatcher("view/search-profile.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response) {
        Product product = new Product();
        product.setId(Integer.parseInt(request.getParameter("id")));
        product.setName(request.getParameter("name"));
        product.setPrice(Integer.parseInt(request.getParameter("price")));
        product.setDecription(request.getParameter("decription"));
        product.setProducer(request.getParameter("producer"));
        productService.update(product);
        request.setAttribute("message","Chỉnh sửa sản phẩm thành công");
        try {
            request.getRequestDispatcher("view/edit-product.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
