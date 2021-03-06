package com.t2010a.fruits.model.cart;

import com.t2010a.fruits.entity.cart.CartItem;
import com.t2010a.fruits.util.ConnectionHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

public class MySqlCartItemModel implements CheckoutCartItemModel{
    @Override
    public CartItem save(CartItem cartItem, int shoppingcartId) {
        try {
            Connection connection = ConnectionHelper.getConnection();
            String sqlQuery = "insert into cartitem "+
                    "(shoppingcartId,productId,productName,productThumbnail,unitPrice,quantity,createdAt)"+
                    " value "+"(?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,shoppingcartId);
            preparedStatement.setString(2,cartItem.getProductId());
            preparedStatement.setString(3,cartItem.getProductName());
            preparedStatement.setString(4,cartItem.getProductThumbnail());
            preparedStatement.setDouble(5,cartItem.getUnitPrice());
            preparedStatement.setInt(6,cartItem.getQuantity());
            preparedStatement.setString(7, LocalDateTime.now().toString());
            System.out.println("Connection success!");
            preparedStatement.execute();
            return cartItem;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CartItem> findAll() {
        List<CartItem> list = new ArrayList<>();
        try {
            Connection connection = ConnectionHelper.getConnection();
            String sqlQuery = "select * from cartitem";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int shoppingcartId = Integer.parseInt(resultSet.getString("shoppingcartId"));
                String productId = resultSet.getString("productId");
                String productName = resultSet.getString("productName");
                String productThumbnail = resultSet.getString("productThumbnail");
                double unitPrice = Double.parseDouble(resultSet.getString("unitPrice"));
                int quantity = Integer.parseInt(resultSet.getString("quantity"));
                LocalDateTime createdAt = LocalDateTime.ofInstant(resultSet.getTimestamp("createdAt").toInstant(), ZoneId.systemDefault());
                CartItem cartItem = new CartItem();
                cartItem.setShoppingcartId(shoppingcartId);
                cartItem.setProductId(productId);
                cartItem.setProductName(productName);
                cartItem.setProductThumbnail(productThumbnail);
                cartItem.setUnitPrice(unitPrice);
                cartItem.setQuantity(quantity);
                cartItem.setCreatedAt(createdAt);
                list.add(cartItem);
            }
            preparedStatement.execute();

        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<CartItem> findByShoppingCartId(int shoppingcartId) {
        List<CartItem> list = new ArrayList<>();
        try {
            Connection connection = ConnectionHelper.getConnection();
            String sqlQuery = "select * from cartitem where shoppingcartId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,shoppingcartId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String productId = resultSet.getString("productId");
                String productName = resultSet.getString("productName");
                String productThumbnail = resultSet.getString("productThumbnail");
                double unitPrice = Double.parseDouble(resultSet.getString("unitPrice"));
                int quantity = Integer.parseInt(resultSet.getString("quantity"));
                LocalDateTime createdAt = LocalDateTime.ofInstant(resultSet.getTimestamp("createdAt").toInstant(), ZoneId.systemDefault());
                CartItem cartItem = new CartItem();
                cartItem.setShoppingcartId(shoppingcartId);
                cartItem.setProductId(productId);
                cartItem.setProductName(productName);
                cartItem.setProductThumbnail(productThumbnail);
                cartItem.setUnitPrice(unitPrice);
                cartItem.setQuantity(quantity);
                cartItem.setCreatedAt(createdAt);
                list.add(cartItem);
            }
            preparedStatement.execute();

        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }
}
