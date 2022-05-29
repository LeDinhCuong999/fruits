<%@ page import="com.t2010a.hellot2010aagain.entity.Product" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="com.t2010a.hellot2010aagain.entity.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.t2010a.hellot2010aagain.entity.myenum.ProductStatus" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product obj = (Product) request.getAttribute("obj");
    List<Category> categories = (List<Category>) request.getAttribute("categories");
    if (categories == null){
        categories = new ArrayList<>();
    }
    int action = (int) request.getAttribute("action");
    HashMap<String, String> errors = obj.getErrors();
    String url = "/admin/products/create";
    if(action == 2){
        url = "/admin/products/edit";
    }
    if (errors == null){
        errors = new HashMap<>();
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
                        <h1>Product Management</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="/admin/products/list">Product Management</a></li>
                            <li class="breadcrumb-item active">Create new</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <%
                    if (errors != null && errors.size() > 0){
                %>
                <div class="row">
                    <div class="col-md-12">
                        <div class="callout callout-danger">
                            <h5>Please fix error below</h5>
                            <ul>
                                <%
                                    for (String msg: errors.values()){
                                %>
                                    <li class="text-danger"><%=msg%></li>
                                <%
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                </div>
                <%}%>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-warning">
                            <div class="card-header">
                                <h3 class="card-title">Please enter information below</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <form action="<%=url%>" method="post" name="product-form">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" name="name" value="<%=obj.getName()%>" class="form-control" placeholder="Please enter name">
                                                <%if (errors.containsKey("name")) {%>
                                                    <span class="text-danger">* <%=errors.get("name")%></span>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-8">
                                            <!-- select -->
                                            <div class="form-group">
                                                <label>Status</label>
                                                <select name="status" class="form-control">
                                                    <%
                                                        for (int i = 0; i < ProductStatus.values().length; i++) {
                                                    %>
                                                        <option <%=obj.getStatus() == ProductStatus.values()[i] ? "selected": ""%> value="<%=ProductStatus.values()[i].getValue()%>"><%=ProductStatus.values()[i].name()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-8">
                                            <!-- select -->
                                            <div class="form-group">
                                                <label>Select Category</label>
                                                <select name="categoryId" class="form-control">
                                                    <%
                                                        for (int i = 0; i < categories.size(); i++) {
                                                    %>
                                                    <option value="<%=categories.get(i).getId()%>"><%=categories.get(i).getName()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>Price</label>
                                                <input type="text" name="price" value="<%=obj.getPrice()%>" class="form-control" placeholder="Please enter price">
                                                <%if (errors.containsKey("price")) {%>
                                                    <span class="text-danger">* <%=errors.get("price")%></span>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>description</label>
                                                <input type="text" description="name" value="<%=obj.getDescription()%>" class="form-control" placeholder="Please enter description">
                                                <%if (errors.containsKey("description")) {%>
                                                <span class="text-danger">* <%=errors.get("description")%></span>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>thumbnail</label>
                                                <div class="input-group">
                                                    <div class="custom-file">
                                                        <input type="text" thumbnail="name" value="<%=obj.getThumbnail()%>" class="form-control" placeholder="Please enter thumbnail">
                                                    </div>
                                                    <div class="input-group-append" id="upload_widget">
                                                        <span class="input-group-text">Upload</span>
                                                    </div>
                                                </div>
                                                <img src="preview-image" style="display: none" src="" alt="" class="img-bordered mt-2" width="200px">
                                                <%if (errors.containsKey("thumbnail")) {%>
                                                <span class="text-danger">* <%=errors.get("thumbnail")%></span>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-10">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>detail</label>
                                                <textarea id="summernote" name="detail"><%=obj.getDetail()%></textarea>
                                                <%if (errors.containsKey("detail")) {%>
                                                <span class="text-danger">* <%=errors.get("detail")%></span>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <button class="btn btn-primary">Save</button>
                                                <input type="reset" class="btn btn-default" value="Reset">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                    <!--/.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="../includes/footer.jsp"></jsp:include>

    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>

</div>
<!-- ./wrapper -->

<!-- jQuery -->
<jsp:include page="../includes/script.jsp"></jsp:include>
<script src="https://upload-widget.cloudinary.com/global/all.js" type="text/javascript"></script>
<script>
    document.addEventListener('DOMContentLoaded', function (){
        $('#summernote').summernote();

        var myWidget = cloudinary.createUploadWidget({
                cloudName: 'fpt-aptech-t2010a',
                uploadPreset: 'm2z1sask'}, (error, result) => {
                if (!error && result && result.event === "success") {
                    console.log('Done! Here is the image info: ', result.info.secure_url);
                    document.forms['product-form'] ['thumbnail'].value = result.info.secure_url;
                    document.getElementById('preview-image').src = result.info.secure.url;
                    document.getElementById('preview-image').style.display = "block";
                }
            }
        )

        document.getElementById("upload_widget").addEventListener("click", function(){
            myWidget.open();
        }, false);
    })
</script>

</body>
</html>
