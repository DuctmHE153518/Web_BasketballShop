<%-- 
    Document   : shop-single
    Created on : Mar 2, 2022, 8:34:59 PM
    Author     : Duc Tran
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Baller Shop &mdash; Colorlib e-Commerce Template</title>
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
                            <div class="col-md-12 mb-0"><a href="home">Home</a> <span class="mx-2 mb-0">/</span> <a href="shop">Shop</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">${detail.name}</strong></div>
                    </div>
                </div>
            </div>  

            <div class="site-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <img src="${detail.img}" alt="Image" class="img-fluid">
                        </div>
                        <div class="col-md-6">
                            <h2 class="text-black">${detail.name}</h2>
                            <p class="mb-4">${detail.describe}</p>
                            <p><strong class="text-primary h4">
                                    <fmt:setLocale value = "vi_VN"/>
                                    <fmt:formatNumber value="${detail.price}" type="currency" />
                                </strong></p>
                            <div class="mb-1 d-flex">
                                <label for="option-sm" class="d-flex mr-3 mb-3">
                                    <span class="d-inline-block mr-2" style="top:-2px; position: relative;"><input type="radio" id="option-sm" name="shop-sizes"></span> <span class="d-inline-block text-black">Small</span>
                                </label>
                                <label for="option-md" class="d-flex mr-3 mb-3">
                                    <span class="d-inline-block mr-2" style="top:-2px; position: relative;"><input type="radio" id="option-md" name="shop-sizes"></span> <span class="d-inline-block text-black">Medium</span>
                                </label>
                                <label for="option-lg" class="d-flex mr-3 mb-3">
                                    <span class="d-inline-block mr-2" style="top:-2px; position: relative;"><input type="radio" id="option-lg" name="shop-sizes"></span> <span class="d-inline-block text-black">Large</span>
                                </label>
                                <label for="option-xl" class="d-flex mr-3 mb-3">
                                    <span class="d-inline-block mr-2" style="top:-2px; position: relative;"><input type="radio" id="option-xl" name="shop-sizes"></span> <span class="d-inline-block text-black"> Extra Large</span>
                                </label>
                            </div>
                            <div class="mb-5">
                                <div class="input-group mb-3" style="max-width: 120px;">
                                    <div class="input-group-prepend">
                                        <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                                    </div>
                                    <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                                    </div>
                                </div>
                            </div>
                            <p><a href="cart.jsp" class="buy-now btn btn-sm btn-primary">Add To Cart</a></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="site-section block-3 site-blocks-2 bg-light">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-7 site-section-heading text-center pt-4">
                            <h2>Featured Products</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="nonloop-block-3 owl-carousel">
                                <c:forEach items="${listT}" var="o">
                                    <div class="item">
                                        <div class="block-4 text-center">
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