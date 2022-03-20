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
                                                <th>Id</th>
                                                <th class="product-thumbnail">Image</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>Describe</th>
                                                <th>Quantity</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listP}" var="o">
                                            <tr>
                                                <td>${o.id}</td>
                                                <td class="product-thumbnail">
                                                    <img src="${o.img}" alt="Image" class="img-fluid">
                                                </td>
                                                <td class="product-name">
                                                    <h2 class="h5 text-black">${o.name}</h2>
                                                </td>
                                                <td>${o.price}</td>
                                                <td style="max-width:400px">${o.describe}</td>
                                                <td>${o.quantity}</td>
                                                <td>
                                                    <a href="load?pid=${o.id}" class="btn btn-primary btn-sm">Edit</a>
                                                    <br>
                                                    <a href="delete?pid=${o.id}" class="btn btn-primary btn-sm">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </form>
                        <c:set var="page" value="${requestScope.page}"/>
                        <div class="row" data-aos="fade-up">
                            <div class="col-md-12 text-center">
                                <div class="site-block-27">
                                    <ul>
                                        <li><a href="manager?page=${page-1}">&lt;</a></li>
                                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                            <li><a class="${i==page?"active":""}" href="manager?page=${i}">${i}</a></li>
                                            </c:forEach>
                                        <li><a href="manager?page=${page+1}">&gt;</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="row mb-5">
                                <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal">
                                    <i class="material-icons">&#xE147;</i> 
                                    <span>Add New Product</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>

            <!-- Edit Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="add" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>id</label>
                                    <input name="id" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="image" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="price" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Describe</label>
                                    <textarea name="describe" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <textarea name="quantity" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="c">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
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