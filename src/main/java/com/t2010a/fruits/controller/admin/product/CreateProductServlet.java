package com.t2010a.fruits.controller.admin.product;

import com.t2010a.fruits.entity.Product;
import com.t2010a.fruits.entity.myenum.ProductStatus;
import com.t2010a.fruits.model.category.CategoryModel;
import com.t2010a.fruits.model.category.MySqlCategoryModel;
import com.t2010a.fruits.model.product.MySqlProductModel;
import com.t2010a.fruits.model.product.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.ColorModel;
import java.io.IOException;

public class CreateProductServlet extends HttpServlet {
    private ProductModel productModel;
    private CategoryModel categoryModel;

    public CreateProductServlet() {
        this.productModel = new MySqlProductModel();
        this.categoryModel = new MySqlCategoryModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("product", new Product());
        req.setAttribute("category", categoryModel.findAll());
        req.setAttribute("action", 1);
        req.setAttribute("title", "Create Product");
        req.getRequestDispatcher("/admin/products/form.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String thumbnail = req.getParameter("thumbnail");
        double price = Double.valueOf(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String description = req.getParameter("description");
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        int status = Integer.parseInt(req.getParameter("status"));
        Product product = new Product();
        product.setId(id);
        product.setName(name);
        product.setThumbnail(thumbnail);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setDescription(description);
        product.setCategoryId(categoryId);
        product.setStatus(ProductStatus.of(status));

        if (!product.isValid()){
            req.setAttribute("product",product);
            req.setAttribute("category", categoryModel.findAll());
            req.setAttribute("action",1);
            req.setAttribute("title","Create Product");
            req.setAttribute("errors",product.getErrors());
            req.getRequestDispatcher("/admin/products/form.jsp").forward(req,resp);
        }
        if (productModel.save(product) != null){
            resp.sendRedirect("/admin/products/list");
        }else {
            req.setAttribute("action",1);
            req.setAttribute("title", "Create Product");
            req.getRequestDispatcher("/admin/products/form.jsp").forward(req,resp);
        }
    }
}
