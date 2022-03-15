<%-- 
    Document   : login
    Created on : Mar 14, 2022, 9:40:15 PM
    Author     : Duc Tran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <div class="container">
            <div class="omb_login">
                <h3 class="omb_authTitle">Sign up or <a href="login.jsp">Login</a></h3>

                <div class="row omb_row-sm-offset-3">
                    <div class="col-xs-12 col-sm-6">	
                        <form class="omb_loginForm" action="signup" method="post">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" name="username" placeholder="Username">
                            </div>
                            <span class="help-block"></span>
                            
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                <input type="text" class="form-control" name="email" placeholder="Email: you@example.com">
                            </div>
                            <span class="help-block"></span>

                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input  type="password" class="form-control" name="password" placeholder="Password">
                            </div>
                            <span class="help-block"></span>
                            
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input  type="password" class="form-control" name="re-password" placeholder="Repeat Password">
                            </div>
                            
                            <span class="help-block">${mess}</span>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
