<%-- 
Document   : shop
Created on : Mar 2, 2022, 8:35:23 PM
Author     : Duc Tran
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <div class="col-md-12 mb-0"><a href="home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong></div>
                        </div>
                    </div>
                </div>

                <div class="site-section">
                    <div class="container">
                        <div class="row mb-5">
                            <div class="col-md-9 order-2">
                                <div class="row">
                                    <div class="col-md-12 mb-5">
                                        <div class="float-md-left mb-4"><h2 class="text-black h5">Sản Phẩm</h2></div>
                                        <div class="d-flex">
                                            <div class="dropdown mr-1 ml-md-auto">
                                                <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuReference" data-toggle="dropdown">Sắp xếp</button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                                                    <a class="dropdown-item" href="sortasc">Giá, thấp đến cao</a>
                                                    <a class="dropdown-item" href="sortdesc">Giá, cao đến thấp</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-5">
                                <c:forEach items="${listP}" var="o">
                                    <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                                        <div class="block-4 text-center border">
                                            <figure class="block-4-image">
                                                <a href="detail?pid=${o.id}">
                                                    <img src="${o.img}" alt="Image placeholder" class="img-fluid"></a>
                                            </figure>
                                            <div class="block-4-text p-4">
                                                <h3><a href="detail?pid=${o.id}">${o.name}</a></h3>
                                                <p class="mb-0">Hàng replica</p>
                                                <p class="text-primary font-weight-bold" >
                                                    <fmt:setLocale value = "vi_VN"/>
                                                    <fmt:formatNumber value="${o.price}" type="currency" />
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>

                            <c:set var="page" value="${requestScope.page}"/>
                            <div class="row" data-aos="fade-up">
                                <div class="col-md-12 text-center">
                                    <div class="site-block-27">
                                        <ul>
                                            <li><a href="shop?page=${page-1}">&lt;</a></li>
                                                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                                <li><a class="${i==page?"active":""}" href="shop?page=${i}">${i}</a></li>
                                                </c:forEach>
                                            <li><a href="shop?page=${page+1}">&gt;</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 order-1 mb-5 mb-md-0">
                            <div class="border p-4 rounded mb-4">
                                <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
                                <ul class="list-unstyled mb-0">
                                    <c:forEach items="${listC}" var="o">
                                        <li class="mb-1 ${o.id==tag?"active":""}"><a href="category?id=${o.id}" class="d-flex"><span>${o.name}</span></a></li>
                                    </c:forEach>
                                </ul>
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