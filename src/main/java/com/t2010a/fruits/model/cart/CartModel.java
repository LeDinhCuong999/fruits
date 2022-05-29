package com.t2010a.fruits.model.cart;

import com.t2010a.fruits.entity.Product;
import com.t2010a.fruits.entity.cart.CartItem;

import java.util.ArrayList;

public interface CartModel {
    void add(Product product, int qty);
    void update(Product product,int qty);
    void remove(Product product);
    ArrayList<CartItem> getListItems();
}
