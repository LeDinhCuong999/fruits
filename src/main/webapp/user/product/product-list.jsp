<%@ page import="com.t2010a.fruits.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.t2010a.fruits.entity.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("product");
    List<Category> categories = (List<Category>) request.getAttribute("category");
    if (products == null){
        products = new ArrayList<>();
    }
    if (categories == null){
        categories = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html lang="en">
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
                    <p>Fresh and Organic</p>
                    <h1><%=request.getAttribute("title")%></h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end breadcrumb section -->

<!-- products -->
<div class="product-section mt-150 mb-150">
    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <div class="product-filters">
                    <ul>
                        <li class="active" data-filter="*">All</li>
                        <li data-filter=".strawberry">Strawberry</li>
                        <li data-filter=".berry">Berry</li>
                        <li data-filter=".lemon">Lemon</li>
                        <li data-filter=".apple">Apple</li>
                        <li data-filter=".avocado">Avocado</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row product-lists">
            <%for (Product product:products){%>
                <div class="col-lg-4 col-md-6 text-center ">
                    <div class="single-product-item">
                        <div class="product-image">
                            <a href="/single-product?id=<%=product.getId()%>"><img src="<%=product.getThumbnail()%>" alt=""></a>
                        </div>
                        <h3><%=product.getName()%></h3>
                        <p class="product-price"><span>Per Kg</span> <%=product.getPrice()%>VND </p>
                        <a href="/cart/add?productId=<%=product.getId()%>&quantity=1" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                    </div>
                </div>
            <%}%>
        </div>

        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="pagination-wrap">
                    <ul>
                        <li><a href="#">Prev</a></li>
                        <li><a href="#">1</a></li>
                        <li><a class="active" href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">Next</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end products -->

<!-- footer -->
<jsp:include page="/user/includes/footer.jsp"></jsp:include>
<!-- end footer -->

<!-- jquery -->
<jsp:include page="/user/includes/script.jsp"></jsp:include>
</body>
</html>