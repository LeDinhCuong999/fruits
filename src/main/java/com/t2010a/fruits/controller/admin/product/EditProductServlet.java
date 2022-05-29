package com.t2010a.fruits.controller.admin.product;

import com.t2010a.fruits.entity.Product;
import com.t2010a.fruits.entity.myenum.ProductStatus;
import com.t2010a.fruits.model.category.CategoryModel;
import com.t2010a.fruits.model.category.MySqlCategoryModel;
import com.t2010a.fruits.model.product.MySqlProductModel;
import com.t2010a.fruits.model.product.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.ColorModel;
import java.io.IOException;
import java.time.LocalDateTime;

public class EditProductServlet extends HttpServlet {
    private ProductModel productModel;
    private CategoryModel categoryModel;

    public EditProductServlet() {
        this.productModel = new MySqlProductModel();
        this.categoryModel = new MySqlCategoryModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Product product = productModel.findById(id);

        if (product == null){
            req.setAttribute("message","Data not found!");
            req.getRequestDispatcher("/admin/errors/404.jsp").forward(req,resp);
        }else {
            req.setAttribute("title", "Edit Product");
            req.setAttribute("category", categoryModel.findAll());
            req.setAttribute("product",product);
            req.setAttribute("action",2);
            req.getRequestDispatcher("/admin/products/form.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        Product existproduct = productModel.findById(id);
        if(existproduct == null){
            req.setAttribute("message", "Data not found!");
            req.getRequestDispatcher("/admin/errors/404.jsp").forward(req, resp);
        }else {
            String name = req.getParameter("name");
            String thumbnail = req.getParameter("thumbnail");
            double price = Double.valueOf(req.getParameter("price"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            String description = req.getParameter("description");
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));
            int status = Integer.parseInt(req.getParameter("status"));
            Product product = new Product();
            product.setName(name);
            product.setThumbnail(thumbnail);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setDescription(description);
            product.setCategoryId(categoryId);
            product.setStatus(ProductStatus.of(status));

            if (product.isValid()) {
                req.setAttribute("product", product);
                req.setAttribute("category", categoryModel.findAll());
                req.setAttribute("action", 2);
                req.setAttribute("title", "Edit Product");
                req.setAttribute("errors", product.getErrors());
                req.getRequestDispatcher("/admin/products/form.jsp").forward(req, resp);
            }
            if (productModel.update(id,product) != null) {
                resp.sendRedirect("/admin/products/list");
            } else {
                req.setAttribute("product",product);
                req.setAttribute("category", categoryModel.findAll());
                req.setAttribute("action", 2);
                req.setAttribute("title", "Edit Product");
                req.getRequestDispatcher("/admin/products/form.jsp").forward(req, resp);
            }
        }
    }
}
