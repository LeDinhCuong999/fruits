<%@ page import="com.t2010a.fruits.entity.cart.ShoppingCart" %>
<%@ page import="com.t2010a.fruits.entity.cart.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingcart");
  int action = (int) request.getAttribute("action");
  double totalPrice =0;
  if (shoppingCart == null) {
    shoppingCart = new ShoppingCart();
    action = 2;
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
            <p>Fresh and Organic</p>
            <h1><%=request.getAttribute("title")%></h1>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- end breadcrumb section -->

  <!-- cart -->
  <div class="cart-section mt-150 mb-150">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-12">
          <div class="cart-table-wrap">
            <table class="cart-table">
              <thead class="cart-table-head">
              <tr class="table-head-row">
                <th class="product-remove"></th>
                <th class="product-image">Product Image</th>
                <th class="product-name">Name</th>
                <th class="product-price">Price</th>
                <th class="product-quantity">Quantity</th>
                <th class="product-total">Total</th>
              </tr>
              </thead>

              <tbody>
              <%
                List<CartItem> items = shoppingCart.getListItems();
                for (int i = 0; i < items.size(); i++) {
                  totalPrice += items.get(i).getUnitPrice() * items.get(i).getQuantity();%>
              <tr class="table-body-row">
                <td class="product-remove"><a href="#"><i class="far fa-window-close"></i></a></td>
                <td class="product-image"><img src="<%=items.get(i).getProductThumbnail()%>" alt=""></td>
                <td class="product-name"><%=items.get(i).getProductName()%></td>
                <td class="product-price"><%=items.get(i).getUnitPrice()%> VND</td>
                <td class="product-quantity"><input type="number" placeholder="0"><%=items.get(i).getQuantity()%></td>
                <td class="product-total"><%=items.get(i).getQuantity() * items.get(i).getUnitPrice()%> VND</td>
              </tr>
              <%}%>
              </tbody>
            </table>
          </div>
        </div>


        <div class="col-lg-4">
          <div class="total-section">
            <table class="total-table">
              <thead class="total-table-head">
              <tr class="table-total-row">
                <th>Total</th>
                <th>Price</th>
              </tr>
              </thead>
              <tbody>
              <tr class="total-data">
                <td><strong>Subtotal: </strong></td>
                <td><%=totalPrice%> VND</td>
              </tr>
              <tr class="total-data">
                <td><strong>Total: </strong></td>
                <td><%=totalPrice%> VND</td>
              </tr>
              </tbody>
            </table>
            <div class="cart-buttons">
              <a href="cart/show" class="boxed-btn">Update Cart</a>
              <a href="checkout" class="boxed-btn black">Check Out</a>
            </div>
          </div>
          <div class="coupon-section">
            <h3>Apply Coupon</h3>
            <div class="coupon-form-wrap">
              <form action="home">
                <p><input type="text" placeholder="Coupon"></p>
                <p><input type="submit" value="Apply"></p>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- end cart -->

  <!-- footer -->
  <jsp:include page="/user/includes/footer.jsp"></jsp:include>
  <!-- end footer -->

  <!-- jquery -->
  <jsp:include page="/user/includes/script.jsp"></jsp:include>
  </body>
</html>