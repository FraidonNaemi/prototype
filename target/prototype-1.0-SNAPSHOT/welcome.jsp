<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
        <title>Home</title>
        <link rel="stylesheet" href="css/style.css">
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
                <li><a href="logout.jsp">Logout</a></li>
                <li><a href="main.jsp">Main</a></li>
                <li><a class="active" href="#">Welcome</a></li>
            </ul>
        </nav>

        <!-- Catching the user data and regex - JSP -->
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");

            String emailRegEx = "([a-zA-Z]+)[._-]([a-zA-Z]+)@example.com";
            String passRegEx = "[A-Z][a-z]{5,15}\\d{1,3}";
            
            if (!email.matches(emailRegEx) && !password.matches(passRegEx)) {
                session.setAttribute("emailPassError", "Incorrect email and password format");
                response.sendRedirect("register.jsp");
            }
            else if (!email.matches(emailRegEx)) {
                session.setAttribute("emailError", "Incorrect email format");
                response.sendRedirect("register.jsp");
            } else if (!password.matches(passRegEx)) {
                session.setAttribute("passError", "Incorrect password format");
                response.sendRedirect("register.jsp");
            } else {
                User user = new User(name, email, password, dob);
                Users users = new Users();
                users.add(user);

                session.setAttribute("user", user);
                session.setAttribute("users", users);
            }
        %>

        <!-- Table Data -->
        <table class="content-table">
            <thead>
                <tr>
                    <th colspan="2"><h3>User Information</h3></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="td-title">Name: </td>
                    <td><%= name %></td>
                </tr>
                <tr>
                    <td class="td-title">Email: </td>
                    <td><%= email %></td>
                </tr>
                <tr>
                    <td class="td-title">Password: </td>
                    <td><%= password %></td>
                </tr>
                <tr>
                    <td class="td-title">Date of Birth: </td>
                    <td><%= dob %></td>
                </tr>
            </tbody>
        </table>

        <!-- Clock - Footer -->
        <div class="clock">
            <span class="clock-time"></span>
            <span class="clock-ampm"></span>
        </div>
        <script src="js/clock.js"></script>
    </body>
</html>