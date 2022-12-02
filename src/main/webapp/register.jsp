<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
        <title>Register</title>
        <link rel="stylesheet" href="css/register.css">
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
                <li><a class="active" href="#">Register</a></li>
            </ul>
        </nav>

        <!-- Downloading the errors -->
        <%
            String emailError = (String) session.getAttribute("emailError");
            String passError = (String) session.getAttribute("passError");
            String emailPassError = (String) session.getAttribute("emailPassError");
        %>

        <!-- Sign up - Form -->
        <div class="wrapper">
            <header>Sign Up</header>
            <div class="error-field-register"> 
                <p><%= (emailError != null) ? emailError : ""%></p>
                <p><%= (emailError != null) ? passError : ""%></p>
                <p><%= (emailError != null && passError != null) ? emailPassError : ""%></p>
            </div>
            <form method="POST" action="welcome.jsp">
                <div class="field name">
                    <div class="input-area">
                        <input type="text" name="name" placeholder="Name">
                        <i class="icon fas fa-user"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
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
                <div class="field dateOfBirth">
                    <div class="input-area">
                        <input type="date" name="dob" placeholder="Date of Birth">
                    </div>
                </div>
                <input type="submit" value="Sing Up">
            </form>
            <div class="sign-txt">Already have an account? <a href="login.jsp">Sign In</a></div>
        </div>
        <%  
            passError = "";
            emailError = "";
            emailPassError = "";
            session.setAttribute("emailError",emailError);
            session.setAttribute("passError",passError);
            session.setAttribute("emailPassError",emailPassError);
        %>

        <!-- Clock - Footer -->
        <div class="clock">
            <span class="clock-time"></span>
            <span class="clock-ampm"></span>
        </div>
        <script src="js/clock.js"></script>
    </body>
</html>