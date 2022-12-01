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
                <li><a href="index.jsp">Home</a></li>
                <li><a class="active" href="#">Strings</a></li>
            </ul>
        </nav>

        <!-- String -->
        <div class="string">
            <header>String</header>
            <form class="strings" action="strings.jsp">
                <div class="input-area-string">
                    <input id="strings" class="input-area-string" name="strings" type="text" placeholder="Input">
                </div>  
            </form>
        </div>
        
        <div class="strings-output">
            <jsp:include page="vowels.jsp" flush="true"/>
        </div>

        <!-- Clock - Footer -->
        <div class="clock">
            <span class="clock-time"></span>
            <span class="clock-ampm"></span>
        </div>
        <script src="js/clock.js"></script>
    </body>
</html>