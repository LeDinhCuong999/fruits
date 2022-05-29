package com.t2010a.fruits.model.product;

import com.t2010a.fruits.entity.Product;

import java.util.List;

public interface ProductModel {
    Product save(Product obj); // lưu thông tin.

    List<Product> findAll();

    Product findById(String id);

    Product update(String id, Product updateObj);

    boolean delete(String id);
}