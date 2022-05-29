package com.t2010a.fruits.controller.admin.product;

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

public class ListProductServlet extends HttpServlet {
    private ProductModel productModel;
    private CategoryModel categoryModel;

    public ListProductServlet() {
        this.productModel = new MySqlProductModel();
        this.categoryModel = new MySqlCategoryModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productModel.findAll();
        req.setAttribute("title","List Product");
        req.setAttribute("listProduct",products);
        req.setAttribute("category", categoryModel.findAll());
        req.getRequestDispatcher("/admin/products/list.jsp").forward(req,resp);
    }
}
