<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en" dir="ltr">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        

    </head>

    <body>
        <!-- Navigation Bar -->
        <nav>
            <div class="logo">
                Ab | Fr
            </div>
            <input type="checkbox" id="click">
            <label for="click" class="menu-btn">
                <i class="fas fa-bars"></i>
            </label>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a class="active" href="#">Admin</a></li>
            </ul>
        </nav>
        
        <%
            String adminError = (String) session.getAttribute("adminError");
        %>
        
        <!-- Login -->
        <div class="wrapper-login">
            <header>Admin Login</header>
            <div class="error-field-login"> 
                <p><%= (adminError != null) ? adminError : ""%></p>
            </div>
            <form method="POST" action="adminAction.jsp">
                <div class="field email">
                    <div class="input-area">
                        <input type="text" name="email" placeholder="Email Address">
                        <i class="icon fas fa-envelope"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
                <div class="field password">
                    <div class="input-area">
                        <input type="password" name="password" placeholder="Password">
                        <i class="icon fas fa-lock"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
                <div class="field login">
                    <input type="submit" value="Login">
                </div>
            </form>
        </div>
        <%  
            adminError = "";
            session.setAttribute("adminError",adminError);
        %>
        
        <!-- Clock - Footer -->
        <div class="clock">
            <span class="clock-time"></span>
            <span class="clock-ampm"></span>
        </div>
        <script src="js/clock.js"></script>
    </body>
</html>