package com.t2010a.fruits.controller.admin.cart;

import com.t2010a.fruits.entity.cart.ShoppingCart;
import com.t2010a.fruits.model.cart.CheckoutModel;
import com.t2010a.fruits.model.cart.MySqlCartModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BrowseCartServlet extends HttpServlet {
    private CheckoutModel shoppingCartModel;

    public BrowseCartServlet() {
        this.shoppingCartModel = new MySqlCartModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ShoppingCart shoppingCart = shoppingCartModel.findById(id);
        if (shoppingCart == null) {
            req.setAttribute("message", "Data not found!");
            req.getRequestDispatcher("/admin/errors/404.jsp").forward(req, resp);
        } else {
            boolean result = shoppingCartModel.browse(id);
            if (!result) {
                resp.sendRedirect("/admin/cart/list");
            } else {
                req.setAttribute("message", "Action fails!");
                req.getRequestDispatcher("/admin/errors/500.jsp").forward(req, resp);
            }
        }
    }
}
