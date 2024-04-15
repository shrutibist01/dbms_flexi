<%-- 
    Document   : index
    Created on : Apr 6, 2024, 11:20:46 PM
    Author     : sandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World Sat!</h1>
        <a href="/main">Go to main</a><form action="/" method="post">
            <input type="email" name="email" placeholder="email">
            <input type="text" name="name" placeholder="name">
            <input type="text" name="age" placeholder="age">
            <input type="submit">
        </form>
        
    </body>
</html>
