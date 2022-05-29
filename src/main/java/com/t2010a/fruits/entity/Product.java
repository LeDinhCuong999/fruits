package com.t2010a.fruits.entity;

import com.t2010a.fruits.entity.base.BaseEntity;
import com.t2010a.fruits.entity.myenum.ProductStatus;

import java.time.LocalDateTime;
import java.util.HashMap;

public class Product extends BaseEntity {
    private String id;
    private String name;
    private String thumbnail;
    private double price;
    private int quantity;
    private String description;
    private int categoryId;
    private ProductStatus status;
    HashMap<String, String> errors = new HashMap<>();

    public boolean isValid(){
        checkValidate();
        return errors.size() == 0;
    }
    private void checkValidate(){
        if (id == null || id.length() == 0){
            errors.put("id","Please enter id");
        }
        if (name == null || name.length() == 0){
            errors.put("name","Please enter name");
        }
        if (thumbnail == null || thumbnail.length() == 0){
            errors.put("image","Please enter image");
        }
        if (price == 0){
            errors.put("price","Please enter price");
        }
        if (quantity == 0){
            errors.put("quantity","Please enter qty");
        }
        if (description == null || description.length() == 0){
            errors.put("content","Please enter content");
        }
        if (categoryId == 0){
            errors.put("category_id","Please enter category");
        }
    }

    public Product() {
        this.id = "";
        this.name = "";
        this.thumbnail = "";
        this.price = 0;
        this.quantity = 0;
        this.description = "";
        this.setCreatedAt(LocalDateTime.now());
        this.setUpdatedAt(LocalDateTime.now());
        this.status = ProductStatus.ACTIVE;
    }

    public Product(String id, String name, String thumbnail, double price, int quantity, String description, int categoryId) {
        this.id = id;
        this.name = name;
        this.thumbnail = thumbnail;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.categoryId = categoryId;
        this.status = ProductStatus.ACTIVE;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", description='" + description + '\'' +
                ", categoryId=" + categoryId +
                ", status=" + status +
                ", errors=" + errors +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public ProductStatus getStatus() {
        return status;
    }

    public void setStatus(ProductStatus status) {
        this.status = status;
    }

    public HashMap<String, String> getErrors() {
        return errors;
    }

    public void setErrors(HashMap<String, String> errors) {
        this.errors = errors;
    }
}
