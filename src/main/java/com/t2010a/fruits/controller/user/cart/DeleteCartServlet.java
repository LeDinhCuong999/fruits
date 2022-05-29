package com.t2010a.fruits.controller.user.cart;

import com.t2010a.fruits.entity.Account;
import com.t2010a.fruits.entity.Product;
import com.t2010a.fruits.entity.cart.ShoppingCart;
import com.t2010a.fruits.model.product.MySqlProductModel;
import com.t2010a.fruits.model.product.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeleteCartServlet extends HttpServlet {
    private ProductModel productModel;
    public DeleteCartServlet(){
        this.productModel = new MySqlProductModel();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
        Account account = (Account) session.getAttribute("currentLogin");
        if (account == null){
            resp.sendRedirect("/login");
        } else {
            String productId = req.getParameter("id");
            Product product = productModel.findById(productId);
            if (product == null) {
                req.setAttribute("message", "Product not found!");
                req.getRequestDispatcher("/user/error/404.jsp").forward(req, resp);
                return;
            }
            shoppingCart.remove(product);
            session.setAttribute("shoppingCart", shoppingCart);
            resp.sendRedirect("/cart/show");
        }
    }
}
