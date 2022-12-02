<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/12/2022
  Time: 3:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
 <table border="1">
     <tr>
         <th>ID</th>
         <th>Name</th>
         <th>Email</th>
         <th>Country</th>
     </tr>
     <tr>
        <th>${user.id}</th>
        <th>${user.name}</th>
        <th>${user.email}</th>
        <th>${user.country}</th>
     </tr>
 </table>
</body>
</html>
