package com.t2010a.fruits.model.cart;

import com.t2010a.fruits.entity.cart.CartItem;

import java.util.List;

public interface CheckoutCartItemModel {
    CartItem save(CartItem cartItem, int shopppingcartId);

    List<CartItem> findAll();

    List<CartItem> findByShoppingCartId(int shoppingcartId);
}
