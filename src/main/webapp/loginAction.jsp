<%@page import="com.model.User"%>
<%@page import="com.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
        <title>Login Action</title>
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
                <li><a class="active" href="#">Login Action</a></li>
            </ul>
        </nav>
        
        <%  
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Users users = (Users) session.getAttribute("users");
            User user = users.user(email, password); 
        %>
        
        <% if(user != null) { %>
            <!-- Table Data -->
            <table class="content-table">
                <thead>
                    <tr>
                        <th colspan="2"><h3>User Information</h3></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="td-title">Email: </td>
                        <td><%= email %></td>
                    </tr>
                    <tr>
                        <td class="td-title">Password: </td>
                        <td><%= password %></td>
                    </tr>
                </tbody>
            </table> 
        
            
        <% } else {
            session.setAttribute("userError", "User does not exist");
            response.sendRedirect("login.jsp"); 
        } %>
        
        <!-- Clock - Footer -->
        <div class="clock">
            <span class="clock-time"></span>
            <span class="clock-ampm"></span>
        </div>
        <script src="js/clock.js"></script>
    </body>
</html>