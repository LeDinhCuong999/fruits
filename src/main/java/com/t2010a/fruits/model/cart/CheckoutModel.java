package com.t2010a.fruits.model.cart;

import com.t2010a.fruits.entity.cart.ShoppingCart;

import java.util.List;

public interface CheckoutModel {
    ShoppingCart save(ShoppingCart shoppingCart);

    List<ShoppingCart> findAll();

    ShoppingCart findById(int id);

    boolean browse(int id);
}
