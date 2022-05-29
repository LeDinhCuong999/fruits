<%@ page import="java.util.List" %>
<%@ page import="com.t2010a.hellot2010aagain.entity.Product" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> list = (List<Product>)request.getAttribute("listProduct");
    if (list == null){
        list = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../includes/head.jsp"></jsp:include>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <jsp:include page="../includes/navbar.jsp"></jsp:include>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <jsp:include page="../includes/sidebar.jsp"></jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>DataTables</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">DataTables</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <a href="/admin/products/create">Create new Product</a>
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title"><%= (String) request.getAttribute("title")%></h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Thumbnail</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>

                                    <%for (Product obj : list) {
                                    %>
                                    <tbody>
                                    <td><%=obj.getId()%></td>
                                    <td><%=obj.getName()%></td>
                                    <td><%=obj.getPrice()%></td>
                                    <td>
                                        <img class="img-bordered" width="150px" src="<%=obj.getThumbnail()%>" alt="">
                                    </td>
                                    <td><a href="/admin/customers/detail?id=<%=obj.getId()%>">Detail</a>&nbsp;&nbsp;
                                        <a href="/admin/customers/edit?id=<%=obj.getId()%>">Edit</a>&nbsp;&nbsp;
                                        <a href="/admin/customers/delete?id=<%=obj.getId()%>" onclick="confirm('Are you sure?')">Delete</a></td>
                                    </tbody>
                                    <%}%>

                                    <tfoot>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Thumbnail</th>
                                        <th>Action</th>
                                    </tr>
                                    </tfoot>

                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="../includes/footer.jsp"></jsp:include>

</div>
<!-- ./wrapper -->

<jsp:include page="../includes/script.jsp"></jsp:include>

</body>
</html>
