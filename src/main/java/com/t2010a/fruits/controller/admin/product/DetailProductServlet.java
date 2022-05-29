package com.t2010a.fruits.controller.admin.product;

import com.t2010a.fruits.entity.Category;
import com.t2010a.fruits.entity.Product;
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
import java.util.List;

public class DetailProductServlet extends HttpServlet {
    private ProductModel productModel;
    private CategoryModel categoryModel;

    public DetailProductServlet() {
        this.productModel = new MySqlProductModel();
        this.categoryModel = new MySqlCategoryModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        req.setAttribute("title", "Detail Product");
        Product product = productModel.findById(id);
        List<Category> category = categoryModel.findAll();

        if (product == null) {
            req.setAttribute("message", "Data not found!");
            req.getRequestDispatcher("/admin/errors/404.jsp").forward(req, resp);
        } else {
            req.setAttribute("product", product);
            req.setAttribute("category", category);
            req.getRequestDispatcher("/admin/products/detail.jsp").forward(req, resp);
        }
    }
}
