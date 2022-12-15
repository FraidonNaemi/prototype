<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
        <title>Account</title>
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
                <li><a class="active" href="#">Account</a></li>
                <li><a href="main.jsp">Main</a></li>
            </ul>
        </nav>
        <%!
            User user;
        %>
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%= filename%>"/>
        </jsp:useBean>
        <%
            String submitted = request.getParameter("submitted");
            String emailView = request.getParameter("emailView");
            Users users = userDAO.getUsers();
            if (emailView != null) {
                user = users.user(emailView);
                session.setAttribute("emailView", emailView);
            } else {
                user = (User) session.getAttribute("user");
            }
            if (submitted != null && submitted.equals("submitted")) {
                int ID = Integer.parseInt(request.getParameter("ID"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                emailView = (String)session.getAttribute("emailView");
                if(emailView != null)
                    user = users.user(emailView);
                user.update(ID, name, email, password, dob);
                userDAO.update(users, user);
                session.setAttribute("user", user);
            }
        %>
        <!-- Sign up - Form -->
        <div class="wrapper-account" style="height: 650px!important;">
            <header>Edit Account</header>
            <div class="confirm-field">
                <p><%= (submitted != null) ? "Updated successfully" : ""%></p>
            </div>
            <form method="POST" action="">
                <div class="field ID">
                    <div class="input-area">
                        <input type="text" name="ID" value="<%= user.getID()%>" readonly="true">
                        <i class="icon fas fa-id"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
                <div class="field name">
                    <div class="input-area">
                        <input type="text" name="name" value="<%= user.getName()%>">
                        <i class="icon fas fa-user"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
                <div class="field email">
                    <div class="input-area">
                        <input type="text" name="email" value="<%= user.getEmail()%>" readonly="true">
                        <i class="icon fas fa-envelope"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
                <div class="field password">
                    <div class="input-area">
                        <input type="text" name="password" value="<%= user.getPassword()%>">
                        <i class="icon fas fa-lock"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
                <div class="field dateOfBirth">
                    <div class="input-area">
                        <input type="date" name="dob" value="<%= user.getDOB()%>">
                    </div>
                </div>
                <input type="hidden" name="submitted" value="submitted">
                <div class="account-div">
                    <table class="account-table">
                        <tr>
                            <td class="acc-td">
                                <% if (emailView != null) { %>
                                <span class="account-home-button" style="background: #1B1B1B; color: white; padding-top: 14px; padding-bottom: 14px; padding-left: 20px; padding-right: 20px; border-radius: 5px; font-size: 18px;"><a class="button" href="index.jsp" style="color: white;">Home</a> </span>
                                <%} else { %>
                                <span class="account-dashboard-button" style="background: #FF2305; color: white; padding-top: 14px; padding-bottom: 14px; padding-left: 20px; padding-right: 20px; border-radius: 5px; font-size: 18px;"><a class="button" href="main.jsp" style="color: white;">Dashboard</a></span>
                                <%}%>
                            </td>
                            <td class="acc-td"><span class="account-delete-button" style="background: #FF2305; color: white; padding-top: 14px; padding-bottom: 14px; padding-left: 20px; padding-right: 20px; border-radius: 5px; font-size: 18px;"><a href="delete.jsp" class="account-delete-link" style="color: white;">Delete</a></span></td>
                            <td class="acc-td"><input type="submit" class="update-input-account" value="Update" style="width: 100px;"></td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
        <%
            submitted = "";
            session.setAttribute("submitted", submitted);
        %>
        <!-- Clock - Footer -->
        <div class="clock">
            <span class="clock-time"></span>
            <span class="clock-ampm"></span>
        </div>
        <script src="js/clock.js"></script>
    </body>
</html>