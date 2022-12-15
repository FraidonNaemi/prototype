<%@page import="com.model.Admin"%>
<%@page import="com.model.Admins"%>
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
                <li><a class="active" href="#">Admin Action</a></li>
            </ul>
        </nav>
        
        <!-- Linking to the AdminDAO -->
        <% String filename = application.getRealPath("/WEB-INF/admins.xml");%>
        <jsp:useBean id="adminDAO" class="com.model.dao.AdminDAO" scope="application">
            <jsp:setProperty name="adminDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        
        <%  
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Admins admins = adminDAO.getAdmins();
                        
            Admin admin = admins.admin(email, password);
        %>
        
        <% if(admin != null) {
            session.setAttribute("admin", admin);
            response.sendRedirect("adminView.jsp");
        } else {
            session.setAttribute("adminError", "Admin does not exist");
            response.sendRedirect("adminLogin.jsp"); 
        } %>
        
        <!-- Clock - Footer -->
        <div class="clock">
            <span class="clock-time"></span>
            <span class="clock-ampm"></span>
        </div>
        <script src="js/clock.js"></script>
    </body>
</html>