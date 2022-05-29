package com.t2010a.fruits.entity.cart;

import com.t2010a.fruits.entity.Product;
import com.t2010a.fruits.entity.base.BaseEntity;
import com.t2010a.fruits.entity.myenum.ShoppingCartStatus;

import java.util.ArrayList;
import java.util.HashMap;

public class ShoppingCart extends BaseEntity implements ShoppingCartAction {
    private int id;
    private int userId;
    private String shipName;
    private String shipPhone;
    private String shipAddress;
    private String shipNote;
    private double totalPrice;
    private ShoppingCartStatus status;
    private HashMap<Integer, CartItem> cartItems;

    HashMap<String,String> errors = new HashMap<>();
    public boolean isValid(){
        checkValidate();
        return errors.size()== 0;
    }
    private void checkValidate(){
        if (shipName == null || shipName.length() == 0){
            errors.put("shipName","Please enter name");
        }
        if (shipPhone == null || shipPhone.length() == 0){
            errors.put("shipPhone","Please enter phone}");
        }
        if (shipAddress == null || shipAddress.length() == 0){
            errors.put("shipAddress","Please enter address");
        }
        if (shipNote == null || shipNote.length() == 0){
            errors.put("shipNote","Please enter note");
        }
    }

    public ShoppingCart() {
        cartItems = new HashMap<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getShipName() {
        return shipName;
    }

    public void setShipName(String shipName) {
        this.shipName = shipName;
    }

    public String getShipPhone() {
        return shipPhone;
    }

    public void setShipPhone(String shipPhone) {
        this.shipPhone = shipPhone;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public String getShipNote() {
        return shipNote;
    }

    public void setShipNote(String shipNote) {
        this.shipNote = shipNote;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public ShoppingCartStatus getStatus() {
        return status;
    }

    public void setStatus(ShoppingCartStatus status) {
        this.status = status;
    }

    public HashMap<Integer, CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(HashMap<Integer, CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public HashMap<String, String> getErrors() {
        return errors;
    }

    public void setErrors(HashMap<String, String> errors) {
        this.errors = errors;
    }

    @Override
    public void add(Product product, int quantity) {
        if (cartItems.containsKey(product.getId())) {
            CartItem currentItem = cartItems.get(product.getId());
            int numberQuantity = currentItem.getQuantity() + quantity;
            update(product, numberQuantity);
        }else {
            update(product, quantity);
        }
    }

    @Override
    public void update(Product product, int quantity) {
        if (cartItems.containsKey(product.getId())) {
            CartItem currentItem = cartItems.get(product.getId());
            currentItem.setQuantity(quantity);
            cartItems.put(Integer.valueOf(product.getId()), currentItem);
        } else {
            CartItem item = new CartItem();
            item.setProductId(product.getId());
            item.setProductName(product.getName());
            item.setProductThumbnail(product.getThumbnail());
            item.setUnitPrice(product.getPrice());
            item.setQuantity(quantity);
            cartItems.put(Integer.valueOf(product.getId()), item);
        }
    }

    @Override
    public void remove(Product product) {
        if (cartItems.containsKey(product.getId())) {
            cartItems.remove(product.getId());
        }
    }

    @Override
    public ArrayList<CartItem> getListItems() {
        return new ArrayList<>(cartItems.values());
    }
}
