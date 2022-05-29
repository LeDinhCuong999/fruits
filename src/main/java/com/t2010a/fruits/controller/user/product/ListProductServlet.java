package com.t2010a.fruits.controller.user.product;

import com.t2010a.fruits.entity.Product;
import com.t2010a.fruits.model.product.MySqlProductModel;
import com.t2010a.fruits.model.product.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListProductServlet extends HttpServlet {
    private ProductModel productModel;

    public ListProductServlet() {
        this.productModel = new MySqlProductModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> product = productModel.findAll();
        req.setAttribute("product", product);
        req.setAttribute("title","Shop");
        req.getRequestDispatcher("/user/product/product-list.jsp").forward(req, resp);
    }
}
