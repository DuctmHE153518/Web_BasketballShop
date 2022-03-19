<%-- 
    Document   : Manage
    Created on : Mar 19, 2022, 11:20:37 PM
    Author     : Duc Tran
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Baller Shop</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">


        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/style.css">

    </head>
    <body>

        <div class="site-wrap">
            <jsp:include page="header.jsp"></jsp:include>
                <div class="bg-light py-3">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 mb-0"><a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
                        </div>
                    </div>
                </div>

                <div class="site-section">
                    <div class="container">
                        <div class="row mb-5">
                            <form class="col-md-20" method="post">
                                <div class="site-blocks-table">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <span class="custom-checkbox">
                                                        <input type="checkbox" id="selectAll">
                                                        <label for="selectAll"></label>
                                                    </span>
                                                </th>
                                                <th>Id</th>
                                                <th class="product-thumbnail">Image</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>Describe</th>
                                                <th>Quantity</th>
                                                <th>Size</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <span class="custom-checkbox">
                                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                                        <label for="checkbox1"></label>
                                                    </span>
                                                </td>
                                                <td>111</td>
                                                <td>
                                                    <img src="images/cloth_2.jpg" alt="Image" class="img-fluid">
                                                </td>
                                                <td class="product-name">
                                                    <h2 class="h5 text-black">Polo Shirt</h2>
                                                </td>
                                                <td>$49.00</td>
                                                <td style="max-width:400px"></td>
                                                <td>12345</td>
                                                <td>sml</td>
                                                <td><a href="#" class="btn btn-primary btn-sm">X</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="row mb-5">
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <button class="btn btn-primary btn-sm btn-block"><i class="material-icons">&#xE147;</i>Add New Product</button>
                                    </div>
                                    <div class="col-md-6">
                                        <button class="btn btn-outline-primary btn-sm btn-block"><i class="material-icons">&#xE15C;</i>Delete</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="footer.jsp"></jsp:include>
</div>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>

<script src="js/main.js"></script>

</body>
</html>