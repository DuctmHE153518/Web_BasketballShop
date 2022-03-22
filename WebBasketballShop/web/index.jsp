<%-- 
    Document   : index
    Created on : Mar 2, 2022, 8:34:15 PM
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
                <div class="site-blocks-cover" style="background-image: url(images/ballershop.png);" data-aos="fade">
                    <div class="container">
                        <div class="row align-items-start align-items-md-center justify-content-end">
                            <div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
                                <h1 class="mb-2">Just Do It</h1>
                                <div class="intro-text text-center text-md-left">
                                    <p class="mb-4">Some people want it to happen, some wish it would happen, and others make it happen.</p>
                                    <p>
                                        <a href="shop" class="btn btn-sm btn-primary">Shop Now</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="site-section block-3 site-blocks-2 bg-light">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-7 site-section-heading text-center pt-4">
                                <h2>Sản phẩm nổi bật</h2>
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

            <div class="site-section block-8">
                <div class="container">
                    <div class="row justify-content-center  mb-5">
                        <div class="col-md-7 site-section-heading text-center pt-4">
                            <h2>Big Sale!</h2>
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col-md-12 col-lg-7 mb-5">
                            <a href="#"><img src="images/sale.png" alt="Image placeholder" class="img-fluid rounded"></a>
                        </div>
                        <div class="col-md-12 col-lg-5 text-center pl-md-5">
                            <h2><a href="#">Siêu Sale 25% các sản phẩm của PEAK</a></h2>
                            <p class="post-meta mb-4">By <a href="#">PEAK VietNam</a> <span class="block-8-sep">&bullet;</span> Ngày 1 tháng 4, 2022</p>
                            <p>Siêu Sale ngày hội giảm giá đến từ nhà tài trợ PEAK Việt Nam, giảm giá tất cả các sản phẩm PEAK từ 5% - 25% trong ngày 1 tháng 4 năm 2022. HIện tại các bạn có thể đến cửa hàng để tham khảo các sản phẩm khác. </p>
                            <p><a href="shop" class="btn btn-primary btn-sm">Shop Now</a></p>
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
