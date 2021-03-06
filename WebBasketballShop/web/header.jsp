<%-- 
    Document   : menu
    Created on : Mar 13, 2022, 7:36:15 PM
    Author     : Duc Tran
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="site-navbar" role="banner">
    <div class="site-navbar-top">
        <div class="container">
            <div class="row align-items-center">

                <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
                    <form action="search" method="post" class="site-block-top-search">
                        <button type="submit" class="icon icon-search2" style=" padding-left: 1px; padding-right: 1px;"></button>
                        <input value="${txtS}" name="txt" type="text" class="form-control border-0" placeholder="Search" style="padding-left: 35px;">
                    </form>
                </div>

                <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
                    <div class="site-logo">
                        <a href="home" class="js-logo-clone">Baller Shop</a>
                    </div>
                </div>

                <div class="col-6 col-md-4 order-3 order-md-3 text-right">
                    <div class="site-top-icons">
                        <ul>
                            <c:if test="${sessionScope.acc != null}">
                                <li><a href="#">${sessionScope.acc.name}<span class="icon icon-person"></span></a></li>
                            </c:if>
                            <li>
                                <c:set var="size" value="${sessionScope.size}"/>
                                <a href="cart.jsp" class="site-cart">
                                    <span class="icon icon-shopping_cart"></span>
                                    <span class="count">${size}</span>
                                </a>
                            </li> 
                            <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle">
                                    <span class="icon-menu"></span></a>
                            </li>
                        </ul>
                    </div> 
                </div>

            </div>
        </div>
    </div>
                    
    <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
            <ul class="site-menu js-clone-nav d-none d-md-block">
                <li class="has-children">
                    <a href="home">Home</a>
                    <ul class="dropdown">
                        <li><a href="category?id=6">B??ng r???</a></li>
                        <li><a href="category?id=7">Ph??? ki???n</a></li>
                        <li><a href="category?id=8">?????ng ph???c thi ?????u</a></li>
                        <li class="has-children">
                            <a>Gi??y B??ng R???</a>
                            <ul class="dropdown">
                                <li><a href="category?id=1">Gi??y Peak</a></li>
                                <li><a href="category?id=2">Gi??y Nike</a></li>
                                <li><a href="category?id=3">Gi??y Adidas</a></li>
                                <li><a href="category?id=4">Gi??y Jordan</a></li>
                                <li><a href="category?id=5">Gi??y Under Armour</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                
                <li><a href="shop">Shop</a></li>
                <li class="has-children">
                    <a>User</a>
                    <ul class="dropdown">
                        <c:if test="${sessionScope.acc == null}">
                            <li><a href="login.jsp">Login</a></li>
                            </c:if>

                        <c:if test="${sessionScope.acc != null}">
                            <li><a href="logout">logout</a></li>
                            </c:if>

                        <c:if test="${sessionScope.acc.isAdmin == 'TRUE'}">
                            <li><a href="manageracc">Manager Account</a></li>
                            <li><a href="manager">Manager Product</a></li>
                            <li><a href="managerbd">Manager Bill Detail</a></li>
                            </c:if>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
