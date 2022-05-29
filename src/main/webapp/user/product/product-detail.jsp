<%@ page import="com.t2010a.fruits.entity.Product" %>
<%@ page import="com.t2010a.fruits.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product product = (Product) request.getAttribute("product");
    List<Category> categories = (List<Category>) request.getAttribute("category");
    if (categories == null){
        categories = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/user/includes/head.jsp"></jsp:include>
</head>
<body>
<!-- header -->
<jsp:include page="/user/includes/header.jsp"></jsp:include>
<!-- end header -->

<!-- breadcrumb-section -->
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>See more Details</p>
                    <h1><%=request.getAttribute("title")%></h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end breadcrumb section -->

<!-- single product -->
<div class="single-product mt-150 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="single-product-img">
                    <img src="<%=product.getThumbnail()%>" alt="">
                </div>
            </div>
            <div class="col-md-7">
                <div class="single-product-content">
                    <h3><%=product.getName()%></h3>
                    <p class="single-product-pricing"><span>Per Kg</span> <%=product.getPrice()%> VND</p>
                    <li>
                        <a class="active" href="#">
                            <%for (int i = 0; i < categories.size(); i++) {
                                if (product.getCategoryId() == categories.get(i).getId()){%>
                            <span>Category</span> : <%=categories.get(i).getName()%></a>
                        <%}}%>
                    </li>
                    <p><%=product.getDescription()%></p>
                    <div class="single-product-form">
                        <form action="home">
                            <input type="number" placeholder="0">
                        </form>
                        <a href="/cart/add?productId=<%=product.getId()%>&quantity=1" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                        <p><strong>Categories: </strong>Fruits, Organic</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end single product -->

<!-- more products -->
<div class="more-products mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="section-title">
                    <h3><span class="orange-text">Related</span> Products</h3>
                    <p>It is often frustrating to attempt to plan meals that are designed
                        for one. Despite this fact, we are seeing more and more recipe
                        books and Internet websites that are dedicated to the act of
                        cooking for one. Divorce and the death of spouses or grown
                        children leaving for college are all reasons that someone
                        accustomed to cooking for more than one would suddenly need to
                        learn how to adjust all the cooking practices utilized before into
                        a streamlined plan of cooking that is more efficient for one
                        person creating less</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="row">
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <a href=""><img src="user/resources/img/products/product-img-1.jpg" alt=""></a>
                        </div>
                        <h3>Strawberry</h3>
                        <p class="product-price"><span>Per Kg</span> 85$ </p>
                        <a href="" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <a href=""><img src="user/resources/img/products/product-img-2.jpg" alt=""></a>
                        </div>
                        <h3>Berry</h3>
                        <p class="product-price"><span>Per Kg</span> 70$ </p>
                        <a href="" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 offset-lg-0 offset-md-3 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <a href=""><img src="user/resources/img/products/product-img-3.jpg" alt=""></a>
                        </div>
                        <h3>Lemon</h3>
                        <p class="product-price"><span>Per Kg</span> 35$ </p>
                        <a href="" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end more products -->

<!-- footer -->
<jsp:include page="/user/includes/footer.jsp"></jsp:include>
<!-- end footer -->

<!-- jquery -->
<jsp:include page="/user/includes/script.jsp"></jsp:include>
</body>
</html>
