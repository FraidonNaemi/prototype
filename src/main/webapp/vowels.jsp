<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.function.Function" %>
<%@ page import="java.util.stream.Collectors" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vowels</title>
        <link rel="stylesheet" href="css/style.css"/>
        <script type="text/javascript" src="js/script.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%
            String s = request.getParameter("strings");
            String cs = s.replaceAll("\\s", "");
            long sc = s.chars().filter(c -> c == (int) ' ').count();
        %>
        <%!
            private int frequencyA(String s) {
                return (int) s.chars()
                        .mapToObj(c -> (char) c)
                        .filter(c -> "aA".contains("" + c))
                        .count();
            }

            private int frequencyE(String s) {
                return (int) s.chars()
                        .mapToObj(c -> (char) c)
                        .filter(c -> "eE".contains("" + c))
                        .count();
            }

            private int frequencyI(String s) {
                return (int) s.chars()
                        .mapToObj(c -> (char) c)
                        .filter(c -> "iI".contains("" + c))
                        .count();
            }

            private int frequencyO(String s) {
                return (int) s.chars()
                        .mapToObj(c -> (char) c)
                        .filter(c -> "oO".contains("" + c))
                        .count();
            }

            private int frequencyU(String s) {
                return (int) s.chars()
                        .mapToObj(c -> (char) c)
                        .filter(c -> "uU".contains("" + c))
                        .count();
            }

        %>

        <!-- Table Data -->
        <table class="content-table">
            <thead>
                <tr>
                    <th>Vowel</th>
                    <th>Frequency</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>A: </td>
                    <td><%= frequencyA(s)%></td>
                </tr>
                <tr>
                    <td>E: </td>
                    <td><%= frequencyE(s)%></td>
                </tr>
                <tr>
                    <td>I: </td>
                    <td><%= frequencyI(s)%></td>
                </tr>
                <tr>
                    <td>O: </td>
                    <td><%= frequencyO(s)%></td>
                </tr>
                <tr> 
                    <td>U: </td>
                    <td><%= frequencyU(s)%></td>
                </tr>
                <tr> 
                    <td style="width:70%">Compressed String: </td>
                    <td><%= cs%></td>
                </tr>
                <tr> 
                    <td>Number of Spaces: </td>
                    <td><%= sc%></td>
                </tr>
            </tbody>
        </table>     
    </body>
</html>
