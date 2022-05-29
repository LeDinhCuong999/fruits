package com.t2010a.fruits.model.category;

import com.t2010a.fruits.entity.Category;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MySqlCategoryModelTest {

    private MySqlCategoryModel mySqlCategoryModel;
    @BeforeEach
    void setUp() {
        mySqlCategoryModel = new MySqlCategoryModel();
    }

    @Test
    public void create() {
        Category category = new Category();
        category.setName("banana");
        mySqlCategoryModel.save(category);
    }
}