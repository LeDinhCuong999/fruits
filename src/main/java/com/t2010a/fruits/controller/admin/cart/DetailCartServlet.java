package com.t2010a.fruits.controller.admin.cart;

import com.t2010a.fruits.entity.cart.CartItem;
import com.t2010a.fruits.model.cart.CheckoutCartItemModel;
import com.t2010a.fruits.model.cart.MySqlCartItemModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DetailCartServlet extends HttpServlet {
    private CheckoutCartItemModel cartItemModel;
    public DetailCartServlet() {
        this.cartItemModel = new MySqlCartItemModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        List<CartItem> cartItems = cartItemModel.findByShoppingCartId(id);
        req.setAttribute("cartItem",cartItems);
        req.setAttribute("title","List Order");
        req.getRequestDispatcher("/admin/cart/detail.jsp").forward(req,resp);
    }
}
