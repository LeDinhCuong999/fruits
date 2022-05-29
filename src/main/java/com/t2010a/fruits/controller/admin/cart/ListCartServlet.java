package com.t2010a.fruits.controller.admin.cart;


import com.t2010a.fruits.entity.cart.ShoppingCart;
import com.t2010a.fruits.model.cart.CheckoutModel;
import com.t2010a.fruits.model.cart.MySqlCartModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListCartServlet extends HttpServlet {
    private CheckoutModel shoppingCartModel;

    public ListCartServlet() {
        this.shoppingCartModel = new MySqlCartModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ShoppingCart> shoppingCart = shoppingCartModel.findAll();
        req.setAttribute("shoppingCart",shoppingCart);
        req.setAttribute("title","Order");
        req.getRequestDispatcher("/admin/cart/list.jsp").forward(req,resp);
    }
}
