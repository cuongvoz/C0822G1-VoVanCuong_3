<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/12/2022
  Time: 8:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Create New Product Form</h3>
<form action="/product?action=add" method="post">
        <table>
            <tr>
                <th>ID: </th>
                <th><input type="number" name="id"> </th>
            </tr>
           <tr>
               <th>Name: </th>
               <th><input type="text" name="name"></th>
           </tr>
            <tr>
                <th>Price: </th>
                <th><input type="number" name="price"></th>
            </tr>
            <tr>
                <th>Description: </th>
                <th><input type="text" name="description"></th>
            </tr>
            <tr>
                <th>Brand: </th>
                <th><input type="text" name="brand"></th>
            </tr>
        </table>
    <button type="submit">Create</button>
</form>
<a href="/product"><button>Quay lại danh sách</button></a>
</body>
</html>
