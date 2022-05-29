package com.t2010a.fruits.controller.user.cart;

import com.t2010a.fruits.model.product.MySqlProductModel;
import com.t2010a.fruits.model.product.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ShowCartServlet extends HttpServlet {
    private ProductModel productModel;

    public ShowCartServlet() {
        this.productModel = new MySqlProductModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("title","Cart");
        req.setAttribute("action",1);
        req.getRequestDispatcher("/user/cart/cart.jsp").forward(req,resp);
    }
}
