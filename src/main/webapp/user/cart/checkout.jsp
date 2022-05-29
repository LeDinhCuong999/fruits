<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <p>Fresh and Organic</p>
                    <h1>Check Out Product</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end breadcrumb section -->

<!-- check out section -->
<div class="checkout-section mt-150 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="checkout-accordion-wrap">
                    <div class="accordion" id="accordionExample">
                        <div class="card single-accordion">
                            <div class="card-header" id="headingOne">
                                <h5 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Billing
                                    </button>
                                </h5>
                            </div>

                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="billing-address-form">
                                        <form action="index.html">
                                            <p><input type="text" placeholder="Name"></p>
                                            <p><input type="email" placeholder="Email"></p>
                                            <p><input type="text" placeholder="Address"></p>
                                            <p><input type="tel" placeholder="Phone"></p>
                                            <p><textarea name="bill" id="bill" cols="30" rows="10" placeholder="Say Something"></textarea></p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-lg-4">
                <div class="order-details-wrap">
                    <table class="order-details">
                        <thead>
                        <tr>
                            <th>Your order Details</th>
                            <th>Price</th>
                        </tr>
                        </thead>
                        <tbody class="order-details-body">
                        <tr>
                            <td>Product</td>
                            <td>Total</td>
                        </tr>
                        <tr>
                            <td>Strawberry</td>
                            <td>$85.00</td>
                        </tr>
                        <tr>
                            <td>Berry</td>
                            <td>$70.00</td>
                        </tr>
                        <tr>
                            <td>Lemon</td>
                            <td>$35.00</td>
                        </tr>
                        </tbody>
                        <tbody class="checkout-details">
                        <tr>
                            <td>Subtotal</td>
                            <td>$190</td>
                        </tr>
                        <tr>
                            <td>Shipping</td>
                            <td>$50</td>
                        </tr>
                        <tr>
                            <td>Total</td>
                            <td>$240</td>
                        </tr>
                        </tbody>
                    </table>
                    <a href="#" class="boxed-btn">Place Order</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end check out section -->

<!-- footer -->
<jsp:include page="/user/includes/footer.jsp"></jsp:include>
<!-- end footer -->

<!-- jquery -->
<jsp:include page="/user/includes/script.jsp"></jsp:include>
</body>

</html>
