<%@page import="com.model.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
        <title>Main</title>
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
                <li><a href="account.jsp">Account</a></li>
                <li><a href="logout.jsp">Logout</a></li>
                <li><a class="active" href="#">Main</a></li>
            </ul>
        </nav>
        
        <!-- Linking to the XML page -->
        <% String filename = application.getRealPath("/WEB-INF/users.xml"); %>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        
        <% 
            User user = (User) session.getAttribute("user");            
            
            Users users = userDAO.getUsers();
           
            userDAO.update(users, user);
            
            session.setAttribute("user", user);
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
                    <td><%= user.getName()%></td>
                </tr>
                <tr>
                    <td class="td-title">Email: </td>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <td class="td-title">Password: </td>
                    <td><%= user.getPassword()%></td>
                </tr>
                <tr>
                    <td class="td-title">Date of Birth: </td>
                    <td>${user.DOB}</td>
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