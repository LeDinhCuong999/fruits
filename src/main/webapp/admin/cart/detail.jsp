<%@ page import="com.t2010a.fruits.entity.cart.CartItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.t2010a.fruits.entity.myenum.CartItemStatus" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<CartItem> cartItem = (ArrayList<CartItem>) request.getAttribute("cartItem");
  if (cartItem == null) {
    cartItem = new ArrayList<>();
  }
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../includes/head.jsp"></jsp:include>
<body>
<div id="app">
  <div class="main-wrapper main-wrapper-1">
    <jsp:include page="../includes/navbar.jsp"></jsp:include>
    <jsp:include page="../includes/sidebar.jsp"></jsp:include>
    <!-- Main Content -->
    <div class="main-content">
      <section class="section">
        <h2 class="section-title"><a href="/admin/products/create">Create New Product</a></h2>
        <div class="section-body">
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h4>List Product</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-striped" id="table-1">
                      <thead>
                      <tr>
                        <th>Product Id</th>
                        <th>Product Name</th>
                        <th>Product Image</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Status</th>
                      </tr>
                      </thead>
                      <tbody>
                      <%for (CartItem ci : cartItem){%>
                      <tr>
                        <th><%=ci.getProductId()%></th>
                        <th><%=ci.getProductName()%></th>
                        <th><img src="<%=ci.getProductThumbnail()%>" class="img-thumbnail" width="150px"></th>
                        <th><%=ci.getUnitPrice()%></th>
                        <th><%=ci.getQuantity()%></th>
                        <th><%=ci.getUnitPrice() * ci.getQuantity()%></th>
                        <th>
                          <%if (ci.getStatus() == CartItemStatus.ACTIVE){%>
                          <div class="badge badge-success">Not approved yet</div>
                          <%}%>
                          <%if (ci.getStatus() == CartItemStatus.DEACTIVE){%>
                          <div class="badge badge-danger">Approved</div>
                          <%}%>
                        </th>
                      </tr>
                      <%}%>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
  </div>
</div>

<jsp:include page="../includes/script.jsp"></jsp:include>

</body>

</html>
