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
        <%
            String submitted = request.getParameter("submitted");

            if (submitted != null && submitted.equals("submitted")) {
                int ID = Integer.parseInt(request.getParameter("ID"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                user = (User) session.getAttribute("user");
                user.update(ID, name, email, password, dob);     
                session.setAttribute("user", user);
            }else{
                user = (User) session.getAttribute("user");
            }
        %>
        
        <!-- Sign up - Form -->
        <div class="wrapper-account">
            <header>Edit Account</header>
            <div class="error-field"> 
                <p><%= (submitted != null) ? "Update was Successful" : "" %></p>                
            </div>
            <form method="POST" action="welcome.jsp">
                <div class="field ID">
                    <div class="input-area">
                        <input type="text" name="ID" value="${user.ID}" readonly="true">
                        <i class="icon fas fa-id"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
                <div class="field name">
                    <div class="input-area">
                        <input type="text" name="name" value="${user.name}">
                        <i class="icon fas fa-user"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
                <div class="field email">
                    <div class="input-area">
                        <input type="email" name="email" value="${user.email}" readonly="true">
                        <i class="icon fas fa-envelope"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
                <div class="field password">
                    <div class="input-area">
                        <input type="text" name="password" value="${user.password}">
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
                <input type="submit" value="Update">
            </form>
        </div>
        
        <!-- Clock - Footer -->
        <div class="clock">
            <span class="clock-time"></span>
            <span class="clock-ampm"></span>
        </div>
        <script src="js/clock.js"></script>
    </body>
</html>